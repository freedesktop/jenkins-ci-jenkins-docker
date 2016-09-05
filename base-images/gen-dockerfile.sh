#!/bin/sh

set -e

BASEDIR=$(dirname $0)

PLATFORM=$1
shift
ARCH=$1
shift
DEST=$1
shift

case "${PLATFORM}:${ARCH}" in
  centos-7:armv7)
    exit 1
    ;;
  centos-7:x86-64)
    BASE="centos:7"
    ;;
  debian-jessie:armv7)
    BASE="armhf/debian:jessie"
    ;;
  debian-jessie:x86-64)
    BASE="debian:jessie"
    ;;
  fedora-24:armv7)
    exit 1
    ;;
  fedora-24:x86-64)
    BASE="fedora:24"
    ;;
  ubuntu-14.04:armv7)
    exit 1
    ;;
  ubuntu-14.04:x86-64)
    BASE="ubuntu:14.04"
    ;;
  ubuntu-16.04:armv7)
    BASE="armhf/ubuntu:16.04"
    ;;
  ubuntu-16.04:x86-64)
    BASE="ubuntu:16.04"
    ;;
  *)
    exit 1
    ;;
esac

mkdir ${DEST}
cp ${BASEDIR}/${PLATFORM}/* ${DEST}
sed -e "s#@@BASE@@#${BASE}#;" < ${DEST}/Dockerfile.template > ${DEST}/Dockerfile

echo "Generated ${DEST}/Dockerfile from ${BASE}"
