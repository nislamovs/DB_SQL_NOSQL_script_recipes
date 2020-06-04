# MSSQL

#Install mssql-cli

    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo curl -o /etc/apt/sources.list.d/microsoft.list https://packages.microsoft.com/config/ubuntu/18.04/prod.list
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install mssql-cli
    
    
#Install mssql-tools [Ubuntu]

    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list
    echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/18.04/prod bionic main" | sudo tee /etc/apt/sources.list.d/mssql-release.list
    
    sudo apt update
    sudo apt install libodbc1 unixodbc msodbcsql17
    sudo apt-get install mssql-tools unixodbc-dev
    
    echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
    source ~/.bashrc
    
# Additional info
    https://www.sqlservercentral.com/blogs/upgrading-sql-server-2017-containers-to-2019-non-root-containers-with-data-volumes