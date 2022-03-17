#!/bin/sh

MM_PID=$(pidof ModemManager 2>/dev/null)
MM_RCFILE=$(ls /etc/rc.d/S*modemmanager 2>/dev/null)
OPTION="$1"

if [ x"${OPTION}" = x"enable" ]; then
    if [ x"${MM_RCFILE}" = x"" ]; then
        /etc/init.d/modemmanager enable
    fi

    if [ x"${MM_PID}" = x"" ]; then
        /etc/init.d/modemmanager start
    fi
elif [ x"${OPTION}" = x"disable" ]; then
    if [ x"${MM_PID}" != x"" ]; then
        /etc/init.d/modemmanager stop
    fi

    if [ x"${MM_RCFILE}" != x"" ]; then
        /etc/init.d/modemmanager disable
    fi
fi
