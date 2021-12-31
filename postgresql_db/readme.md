# folder structure

- schema.sql  --> a file used to create the schema of the database
- fill_data.sql --> a file used to fill the database tables with data

# er diagram
![er diagram](../images/er.jpg)
# steps to generate the database
- create a database and name it lms in postgres using the pgAdmin or using the psql bash `create database lms_db;`

- run the schama.sql file by opening it into pgAdmin after select the <b>lms_db</b> database (this will create the er diagram)
- run the fill_data.sql file by opening it into pgAdmin after select the <b>lms_db</b> database (this will fill the tables with data)