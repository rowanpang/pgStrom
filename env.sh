#!/bin/bash                                                                                                                                                                                            

PGROOT='/home/rowan/rpmbuild/BUILDROOT/postgresql10-10.10-1PGDG.el7a.ppc64le/usr/pgsql-10'

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
