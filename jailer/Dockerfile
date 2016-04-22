# USAGE (with recombine-migrations project root as working directory):
# $ Restore a recent snapshot of production to a running RDS instance (using rc_new_integration_db docker image)

# Manually run Jailer against the snapshot db.
# Use the extraction_model and datamodel stored in recombine-migrations repo as a base.
# Store any changes you make to the extraction_model and datamodel in version control in the recombine-migrations repo.
# $ java -jar jailer.jar -datamodel ~/recombine/recombine-migrations/jailer/datamodel -UTF8

# Set up a somewhat large EC2 instance to run the jailer export command from.
# This is much more stable than trying to run the export command from your local machine.
# $ docker-machine create --driver amazonec2 --amazonec2-instance-type "m3.2xlarge" --amazonec2-root-size 100 --amazonec2-vpc-id vpc-8c8b90ee trw-ec2-docker
# $ docker-machine scp -r ~/recombine/recombine-migrations/jailer trw-ec2-docker:/home/ubuntu/jailer_data
# $ echo "mkdir /home/ubuntu/jailer_data/dump_output" | docker-machine ssh trw-ec2-docker
#
# TODO:
# The bluerogue251/jailer:v1.0.13 image has a hacked jailer.sh script that increases the JVM max memory heap.
# This is to fix problems where it was running out of memory.
# It would be way cleaner if we instead can figure out how to use the java -jar way of running this rather than the jailer.sh way.
# That way, we could specify the memory size right in our docker run command.
#
# $ docker run \
#   --detach \
#   --volume /home/ubuntu/jailer_data:/root/jailer_data:rw \
#   bluerogue251/jailer:v1.0.13 \
#   ./jailer.sh  export /root/jailer_data/extraction_models/recombine/extraction_model.csv org.postgresql.Driver jdbc:postgresql://<DB_HOST>:<DB_PORT>/<DB_NAME> <DB_USER> <DB_PASSWORD> -jdbcjar lib/postgresql-9.1-901.jdbc4.jar -e /root/jailer_data/dump_output/dump.sql.zip -UTF8 -where "T.id in (40000, 33167, 37146, 5102, 44675, 20110, 25000, 27000, 10000, 1008,2456,2572,2563,2479,2656,2860,2854,2861,2640,2639,2857,2862,2567,2566,2565,2662,2587,3161,2655,2773,2641,2859,2864,2589,2583,2858,2650,2658,2646,2573,2434,1970,2922,3051,3213,3049,3053,3125,3128,2728,3163,2792,2967,2968,2965,2765,3129,2966,3263,3216,3130,12805,3052,3202,20110,3319,2996,3427,3318,3428,3621,3583,9772,3509,4224,3963,4015,4158,4263,6421,6416,6417,5548,5411,5671,5460,5459,2531,7946,6102,5458,3119,3188,3757,3897,3937,3940,5259,2959,13792,12,17303,16829,15728,15720,17296,15689,16821,18876)" -format SQL -scope SESSION_LOCAL -datamodel /root/jailer_data/datamodels/recombine

FROM java:8

WORKDIR /root
RUN wget --output-document=/root/jailer.zip https://sourceforge.net/projects/jailer/files/Jailer/Jailer_5.1/jailer_5.1.zip/download
RUN unzip jailer.zip
RUN rm jailer.zip

WORKDIR /root/jailer