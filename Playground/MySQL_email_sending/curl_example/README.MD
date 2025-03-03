## Here is example how to send email with attachment via curl from MySQL 5.7

#### Preparation:

        sudo apt-get install libmysqlclient-dev
        sudo apt-get install zlib1g-dev
        
  - also You need `cmake`, `docker`.
  
#### Build

Run `createSharedLib.sh`; It will generate shared library `rcemodule.so`.

#### Prepare MySQL

- Run `docker-compose up`. It will start MySQL server and Adminer(web UI to connect to MySQL).

- Then run script `copySharedLibToContainer.sh`. It will copy our `rcemodule.so` module to mysql plugins folder
in out mysql container.
 
- Then go to `localhost:8081` in Your browser and login to Your MySQL server as root:

        Username : root
        Password : root
        
- Then choose table `MYSQL`;

- Select `SQL command` tab to enter sql command.

- Enter following commands to enable plugin, create user defined function, export data as CSV and send it to email as attachment:

        DROP FUNCTION IF EXISTS RCEModule;
        
        CREATE FUNCTION RCEModule
           RETURNS STRING
           SONAME "rcemodule.so";
        
        SELECT *
        FROM school.pupils
        WHERE id < 50
        INTO OUTFILE '/var/lib/mysql-files/pupils.csv'
        FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n';
        
        SELECT RCEModule('bash -x /var/lib/mysql-files/email_with_attachment.sh pupils.csv') as RESULT;
           
That's it!

---

If You have warning from MySQL that creating fo file is impossible due to permission denied, run command `sudo chmod a+rwx ./volumes/*`.

#### Additional info:

    - https://www.youtube.com/watch?v=wPp7tI8hb4s
    - https://codevlog.com/write-read-delete-file-from-mysql-serverc-programming/151