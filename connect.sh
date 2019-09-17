#!/bin/bash                                                                                                                                                                                            
  
source env.sh

PORT="5432"  # default 5432
DB_NAME="postgres" # default postgres

while getopts "p:n:h" arg
do
        case $arg in
             p) # port
                PORT=$OPTARG
                ;;
             n) # db_name
                DB_NAME=$OPTARG
                ;;
             h) # help
                echo "

parameter:
-h: help
-p: postgres port
-n: database name

usage:
./connect.sh -p \${PORT} -n \${DB_NAME} [-h]
                "
                exit 0
                ;;
             ?)
                echo "unkonw argument"
        exit 1
        ;;
        esac
done


${PGROOT}/bin/psql -p ${PORT} -d ${DB_NAME} -h /tmp
