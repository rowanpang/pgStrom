#!/bin/bash                                                                                                                                                                                            

source env.sh

DB_NAME="postgres" # default postgres
PORT="5432"  # default 5432
DATAPATH=${PGDATA}
FORCE=false
FOOL_PROOFING=true

while getopts "p:n:d:ifh" arg
do
        case $arg in
             p) # port
                PORT=$OPTARG
                ;;
             n) # db_name
                DB_NAME=$OPTARG
                ;;
             d) # data_path
                DATAPATH=$OPTARG
                ;;
             i) # fool proof
                FOOL_PROOFING=false
                ;;
             f) # force delete database storage path
                FORCE=true
                ;;
             h) # help
                echo "

parameter:
-h: help
-p: postgres port
-n: database name
-d: database storage path
-i: fool proof
-f: force delete database storage path

usage:
./initdb.sh -p \${PORT} -n \${DB_NAME} -d \${DATAPATH} [-i] [-f] [-h]
                "
                exit 0
                ;;
             ?)
                echo "unkonw argument"
        exit 1
        ;;
        esac
done


if [[ ! -n ${DATAPATH} ]]; then
  DATAPATH=${PGROOT}/data
fi

if [[ ${FORCE} == false ]]; then
  QUIT_COMMAND="Y"
  if [[ -d "${DATAPATH}" ]]; then
    if [[ ${FOOL_PROOFING} == false ]]; then
      echo "The \" ${DATAPATH} \" already exists!"
      exit 0
    fi

    until [ "$USER_INPUT" = "$QUIT_COMMAND" ]
    do
      echo "
  The \" ${DATAPATH} \" already exists!
  Do you want to delete it? Enter (\"Y\"/\"n\"/\"quit\")."
      read USER_INPUT
      case ${USER_INPUT} in
         "Y")
                 rm -rf ${DATAPATH}
                 ;;
         "n")
                 exit 0
                 ;;
      "quit")
                 exit 0
                 ;;
           *)
                 ;;
      esac
    done
  fi
else
  if [[ -d "${DATAPATH}" ]]; then
    rm -rf ${DATAPATH}
  fi
fi

mkdir -p ${DATAPATH}
${PGROOT}/bin/initdb ${DATAPATH}
export PGDATA=${DATAPATH}

if [ -f $DIR/postgresql.conf ];then
	cat "${DIR}/postgresql.conf"  >> ${PGDATA}/postgresql.conf
fi
echo "port = ${PORT}" >> ${PGDATA}/postgresql.conf

${DIR}/start_server.sh
if [[ ${DB_NAME} != "postgres" ]]; then
  $PGROOT/bin/createdb -p ${PORT} ${DB_NAME}
fi
${DIR}/stop_server.sh
