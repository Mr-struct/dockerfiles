#! /bin/bash
set -euo pipefail

# TODO get db-parameter-group-name from snapshot rather than hardcoding it

new_instance_identifier=$1
pass=$2
region=us-east-1
host=$new_instance_identifier.cxkeotvuoqai.$region.rds.amazonaws.com
last_snapshot=`aws rds describe-db-snapshots \
  --db-instance-identifier recombine-apps-production-2 \
  --snapshot-type automated \
  --region $region \
  --output json | jq -r '(.DBSnapshots | sort_by(.SnapshotCreateTime) | reverse)[0]'`
last_snapshot_identifier=`echo $last_snapshot | jq -r '.DBSnapshotIdentifier'`
db_snapshot_identifier=${3-$last_snapshot_identifier}
port=`echo $last_snapshot | jq -r '.Port'`
user=`echo $last_snapshot | jq -r '.MasterUsername'`
db=$user

get_instance_status() {
  aws rds describe-db-instances --db-instance-identifier $1 --output json | jq -r '.DBInstances[0].DBInstanceStatus'
}

wait_until_db_instance_is() {
  status=`get_instance_status $1`
  until [ $status = $2 ]
  do
    echo "Waiting for $1 to be $2 -- `date`"
    sleep 30
    status=`get_instance_status $1`
  done
}

echo ""
echo "Restoring from snapshot $db_snapshot_identifier to new db $new_instance_identifier"
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier $new_instance_identifier \
  --db-snapshot-identifier $db_snapshot_identifier \
  --region $region \
  --no-multi-az \
  --publicly-accessible \
  --db-subnet-group-name recombine \
  --tags Key=workload-type,Value=integration Key=env,Value=integration \
  --output json


wait_until_db_instance_is $new_instance_identifier 'available'
echo ""
echo "Disabling auto-backups on integration db and setting master password to $pass"
aws rds modify-db-instance --db-instance-identifier $new_instance_identifier \
  --apply-immediately \
  --db-parameter-group-name recombine-postgres-9-3 \
  --backup-retention-period 0 \
  --master-user-password $pass \
  --vpc-security-group-ids sg-4708ab23 \
  --output json
wait_until_db_instance_is $new_instance_identifier 'modifying'


wait_until_db_instance_is $new_instance_identifier 'available'
echo ""
echo "Setting all non-master user passwords to $pass"
PGPASSWORD=$pass psql --host $host --port $port --dbname $db --username $user -c "ALTER ROLE read_only_user ENCRYPTED PASSWORD '$pass'"
PGPASSWORD=$pass psql --host $host --port $port --dbname $db --username $user -c "ALTER ROLE read_write_user ENCRYPTED PASSWORD '$pass'"
PGPASSWORD=$pass psql --host $host --port $port --dbname $db --username $user -c "ALTER ROLE uploads_app_user ENCRYPTED PASSWORD '$pass'"


echo ""
echo "Done"
