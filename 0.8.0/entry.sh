#!/bin/bash

if [ ! -e '/dev/net/tun' ]; then echo "Error: /dev/net/tun missing! You must run this container with --cap-add=NET_ADMIN --device=/dev/net/tun"; exit 1; fi

if [ "$1" = "client" ]; then
    shift
    "/usr/local/sbin/iodine" "$@"
elif [ "$1" = "server" ]; then
    shift
    "/usr/local/sbin/iodined" "$@"
else
    echo "Invalid mode. Use 'client' or 'server' mode."
fi
