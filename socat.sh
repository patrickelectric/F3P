#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Use: sudo ./socat.sh youruser"
fi

if [ "$USER" = "root" ]
then
	socat PTY,link=/dev/ttyVirtual1 PTY,link=/dev/ttyVirtual2&
	sleep 1
	chown $1:uucp /dev/ttyVirtual1
	chown $1:uucp /dev/ttyVirtual2
	echo "Created ports, set ownership to user $1"
	echo "Connect to /dev/ttyVirtual1 and /dev/ttyVirtual2"
else
	echo "RUN WITH SUDO!"
fi
