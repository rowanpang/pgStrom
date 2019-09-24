#!/usr/bin/bash

export CUDA_DEVICE_WAITS_ON_EXCEPTIO=1

if [[ -z $CUDA_VISIBLE_DEVICES ]];then
	export CUDA_VISIBLE_DEVICES='0,1,2,3'
fi

source ./env.sh

while getopts "d:l:h" arg
do
        case $arg in
             d) # postgres data path
                PGDATA=$OPTARG
                ;;
             l) # postgres log file
                PG_LOG=$OPTARG
                ;;
             h) # help
                echo "

parameter:
-h: help
-d: postgres data path
-l: postgres log file

usage:
./start_server.sh -d \${PGDATA} -l \${PG_LOG} [-h]
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


if [[ ! -n ${PG_LOG} || ${PG_LOG} == "" ]];then
  PG_LOG_PATH=${PGDATA}/logs
  if [[ ! -d "${PG_LOG_PATH}" ]]; then
    mkdir -p ${PG_LOG_PATH}
  fi
  PG_LOG="${PG_LOG_PATH}/logfile"
fi

${PGROOT}/bin/pg_ctl -D ${PGDATA} -l ${PG_LOG} start                    
