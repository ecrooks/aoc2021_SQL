# aoc2021_SQL
 2021 advent of code in Db2 LUW SQL  

# Usage
## Docker Image

This repository contains a Docker file. Building and running the docker image will include pulling down the official Db2 image with a free developer edition license. This license is valid when using 4 cores and 16 GB of memory or less.

 This repo is also structured so that any functions, tables, etc that are created in the pursuit of solutions are automatically created within the database.

 When running on Mac or linux, the local docker container is easy to deal with. There may be issues on Windows caused by the default security settings or firewalls.

On Mac, open a command line, change directories to where you have cloned this repo, and execute the following to build the image locally:
`./build.sh`
That may take a while depending on network speed as it pulls the IBM Db2 image from DockerHub.

Edit the run command in `run.sh` to map the /database directory to the data directory in your copy of this repo. This will ensure you have easy access to files there. Also, use a secure password that works for you.
Next, run the image using:
`./run.sh`

The run actually takes a few minutes. Either give it 5 minutes or watch the logs to see when it displays:
`(*) Setup has completed.
(*) Running user-provided scripts ...
(*) Running create_funcs.sh ...`

You should now be able to connect to the database (named TESTDB) using whatever method you like. A Db2 client or the programming language of your choice. If you want to interact with Db2 at the command line, you can use:
`docker exec -it sql_aoc bash -c "su - db2inst1"`


## Use IBM Db2 on Cloud
Db2 on cloud is available for free for a "lite" instance on the IBM cloud. You can [create a free account with a free instance](https://cloud.ibm.com/catalog/services/db2).
Note that instances that are not used for 30 days will be deleted, so be sure to save any work you do there elsewhere.
To create the objects used here, you simply have to execute the SQL files listed in create_funcs.sh in the order listed there.

## structure
Because each user's data in AOC is different, data files are stored in a folder called /data which is not included in this repo. Simply place your data files there and match the names to use them.

Each day there are generally 4 data files named like this:
`dayNN_part1_sample.csv
dayNN_part1.csv
dayNN_part2_sample.csv
dayNN_part2.csv
`
This is to cover both parts of each day's challenge, and have the sample data provided in the problem as well as the full set of data needed for the answer. There may be additional data sets for some days as needed.

The SQL files for a day will all start with `dayNN_partX` to indicate which challenge they are for. `dayNN_partX_setup` will include the creation of all objects used for that day's solution.

Each day also has a Jupyter Notebook to show the full SQL used for that day. These also start with `dayNN_partX`
