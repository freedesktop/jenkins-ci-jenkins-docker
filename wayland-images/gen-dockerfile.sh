#!/bin/sh

set -e

BASEDIR=$(dirname $0)

REGISTRY=$1
shift
PLATFORM=$1
shift
ARCH=$1
shift
STAMP=$1
shift
DEST=$1
shift

mkdir -p ${DEST}
sed -e "s#@@REGISTRY@@#${REGISTRY}#; s#@@ARCH@@#${ARCH}#; s#@@STAMP@@#${STAMP}#;" < \
	${BASEDIR}/${PLATFORM}/Dockerfile.template > \
	${DEST}/Dockerfile

echo "Generated ${DEST}/Dockerfile from ${ARCH}/${STAMP}"
