# Oracle client installation

To install Oracle db client.

    sudo apt-get install alien
    
Then download appropriate rpm packages, - launch the following cmd.

    ./download_packages.sh
    
Continue with installation process.

    sudo alien -i oracle-instantclient19.6-basic-19.6.0.0.0-1.x86_64.rpm
    sudo alien -i oracle-instantclient19.6-sqlplus-19.6.0.0.0-1.x86_64.rpm
    sudo alien -i oracle-instantclient19.6-devel-19.6.0.0.0-1.x86_64.rpm
 
    sudo apt-get install libaio1
 
Create Oracle configuration file:

    sudo sensible-editor /etc/ld.so.conf.d/oracle.conf

Put this line in that file:

    /usr/lib/oracle/<your version>/client/lib/ 

Note - for 64-bit installations, the path will be:

    /usr/lib/oracle/<your version>/client64/lib/ 

Update the configuration by running following command:
    
    sudo ldconfig
    
Try to connect using:

    sqlplus username/password@//dbhost:1521/SID

or:

    sqlplus testuser/password

Note that if you installed the 64-bit version, the client is called `sqlplus64`.    