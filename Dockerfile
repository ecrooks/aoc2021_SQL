## Author: Ember Crooks
## Date: 2021-12-01
## Docker file for Db2 SQL advent of code
FROM ibmcom/db2
RUN mkdir /var/custom
COPY create_funcs.sh /var/custom/
COPY data/sql_aoc/* /database/sql_aoc/
RUN chmod a+x /var/custom/*
