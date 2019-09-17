#!/usr/bin/bash
source env.sh

while getopts "d:l:h" arg
do
        case $arg in
             d) # postgres data path
                PGDATA=$OPTARG
                ;;
             h) # help
                echo "

parameter:
-h: help
-d: postgres data path

usage:
./stop_server.sh -d \${PGDATA} [-h]
                "
                exit 0
                ;;
             ?)
                echo "unkonw argument"
        exit 1
        ;;
        esac
done

if [[ -z "${PGDATA}" ]];then
  echo "Environment variable 'PGDATA' does not exist."
  exit 1
fi


${PGROOT}/bin/pg_ctl -D ${PGDATA} stop
