# aoc2021_SQL
 2021 advent of code in Db2 LUW SQL  

# Why SQL?
AOC challenges at their heart involve processing data in some way. I expect that some days will require procedural SQL in functions or procedures, but as much as possible, I will do them in plain-vanilla Db2 SQL.

# Why IBM Db2?
1. I am an expert in Db2, so it's easy for me.
1. Anyone can get a free fully-featured version of Db2 in a container and I can easily share my code that way. This container is available to anyone and the only limits are those on the number of cores and amount of memory the container can use.
1. Anyone can spin up a free IBM Db2 on cloud instance and run the code that way as well.

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

```(*) Setup has completed.
(*) Running user-provided scripts ...
(*) Running create_funcs.sh ...
```

You should now be able to connect to the database (named AOCDB if you use the default in run.sh) using whatever method you like. A Db2 client or the programming language of your choice. If you want to interact with Db2 at the command line, you can use:  
`docker exec -it sql_aoc bash -c "su - db2inst1"`

The docker image will automatically create all structures for every day of the challenge, but it will not import the data. This is for two reasons. First each person's data is different and you should use your own. Second, you may only want to see one day's worth of details, and waiting for data for every day to load is far too much time.

## Use IBM Db2 on Cloud
Db2 on cloud is available for free for a "lite" instance on the IBM cloud. You can [create a free account with a free instance](https://cloud.ibm.com/catalog/services/db2).
Note that free instances that are not used for 30 days will be deleted, so be sure to save any work you do there elsewhere.
To create the objects used here, you simply have to execute the SQL files listed in create_funcs.sh in the order listed there.

## Structure and Conventions
Because each user's data in AOC is different, data files are stored in a folder called /data which is not included in this repo. Simply place your data files there and match the names to use them.

Each day there are generally 4 data files named like this:  
```dayNN_part1_sample.csv
dayNN_part1.csv
dayNN_part2_sample.csv
dayNN_part2.csv
```
I am not sharing my data files, you are expected to add your own data files with this naming convention if you would like to use it.

This is to cover both parts of each day's challenge, and have the sample data provided in the problem as well as the full set of data needed for the answer. There may be additional data sets for some days as needed.

The SQL files for a day will all start with `dayNN_partX` to indicate which challenge they are for. `dayNN_partX_setup` will include the creation of all objects used for that day's solution.

Each day also has a Jupyter Notebook to show the full SQL used for that day. These also start with `dayNN_partX`
