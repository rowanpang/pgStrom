#!/bin/bash                                                                                                                                                                                            
ulimit -n 65536
ulimit -c unlimited 

PGROOT='/home/rowan/rpmbuild/BUILDROOT/postgresql11-11.5-1PGDG.el7a.ppc64le/usr/pgsql-11'
PGCONFIG=$PGROOT/bin/pg_config

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"


if [[ ! -n ${PGDATA} ]];then
	PGDATA=${PGROOT}/data
fi

LIBPG="${PGROOT}/lib"
LIBCUDA="/usr/local/cuda/lib64"
export LD_LIBRARY_PATH=$LIBCUDA:$LIBPG:$LD_LIBRARY_PATH
