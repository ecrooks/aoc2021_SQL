## su - db2inst1 -c "db2 connect to testdb; db2 -td@ -vf /database/sql_rv/unif_tfunc.sql |tee unif_tfunc.sql.out; db2 connect reset"
