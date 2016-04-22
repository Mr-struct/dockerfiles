# USAGE:
# $ docker-machine create --driver amazonec2 --amazonec2-instance-type "m3.2xlarge" --amazonec2-root-size 100 --amazonec2-vpc-id vpc-8c8b90ee trw-ec2-docker
# $ echo "mkdir /home/ubuntu/jailer" | docker-machine ssh trw-ec2-docker
# $ echo "mkdir /home/ubuntu/jailer/dump_output" | docker-machine ssh trw-ec2-docker
# $ docker-machine scp ./jailer_extraction_models/extraction_model_13.csv trw-dockermachine:/home/ubuntu/jailer/extraction_model.csv
# $ docker-machine scp -r ./jailer_datamodels/datamodel/recombine trw-dockermachine:/home/ubuntu/jailer/recombine_datamodel
#
# $ docker run \
#   --detach \
#   --volume /home/ubuntu/jailer/extraction_model.csv:/root/extraction_model.csv:ro \
#   --volume /home/ubuntu/jailer/recombine_datamodel:/root/recombine_datamodel:ro \
#   --volume /home/ubuntu/jailer/dump_output:/root/dump_output:rw \
#   bluerogue251/jailer:v1.0.12 \
#   ./jailer.sh export /root/extraction_model.csv org.postgresql.Driver jdbc:postgresql://<DB_HOST>:<DB_PORT>/<DB_NAME> <DB_USER> <DB_PASSWORD> -jdbcjar lib/postgresql-9.1-901.jdbc4.jar -e /root/dump_output/dump.sql.zip -UTF8 -threads 1 -entities 50 -where "T.id in (40000, 33167, 37146, 5102, 44675, 20110, 25000, 27000, 10000, 1008,2456,2572,2563,2479,2656,2860,2854,2861,2640,2639,2857,2862,2567,2566,2565,2662,2587,3161,2655,2773,2641,2859,2864,2589,2583,2858,2650,2658,2646,2573,2434,1970,2922,3051,3213,3049,3053,3125,3128,2728,3163,2792,2967,2968,2965,2765,3129,2966,3263,3216,3130,12805,3052,3202,20110,3319,2996,3427,3318,3428,3621,3583,9772,3509,4224,3963,4015,4158,4263,6421,6416,6417,5548,5411,5671,5460,5459,2531,7946,6102,5458,3119,3188,3757,3897,3937,3940,5259,2959,13792,12,17303,16829,15728,15720,17296,15689,16821,18876)" -format SQL -schemamapping = -source-schemamapping = -t /root/recombine_datamodel/exclude-from-deletion.csv -scope SESSION_LOCAL -datamodel /root/recombine_datamodel -script-enhancer .


FROM java:8

WORKDIR /root
RUN wget --output-document=/root/jailer.zip https://sourceforge.net/projects/jailer/files/Jailer/Jailer_5.1/jailer_5.1.zip/download
RUN unzip jailer.zip
RUN rm jailer.zip

WORKDIR /root/jailer