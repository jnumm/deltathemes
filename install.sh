#!/bin/bash
# Deltathemes installation script.

INSTALLDIR="$HOME/.themes"

function usage
{
    echo "Usage: `basename $0` [-d DIRECTORY] [-s] [-h]"
    echo
    echo "  -d, --directory DIRECTORY  install to DIRECTORY"
    echo "  -s, --system-wide          install system-wide (to /usr/share/themes)"
    echo "  -h, --help                 show this help"
    echo
    echo "If no arguments are specified, then the installation directory is ~/.themes."
}

# Command line parsing.
while [ "$1" != "" ]; do
    case $1 in
        -d | --directory )      shift
                                INSTALLDIR=$1
                                mkdir -p "$INSTALLDIR"
                                ;;
        -s | --system-wide )    INSTALLDIR="/usr/share/themes"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

# Actual copying.
# TODO: There must be a better way to copy the directories than
# specifying them all...
cp -r Blu-Day/ Grazzy/ Hard-Pink/ Sleany/ $INSTALLDIR

# Check if the copying succeeded.
if [ $? -ne 0 ]; then
    echo "Installation did not succeed."
else
    echo "Installation succeeded!"
fi
