#!/bin/bash
# Deltathemes installation script.

installdir="$HOME/.themes/"

function usage
{
    echo "Usage: `basename $0` [-s] [-d directory] [-h]"
}

# Command line parsing.
while [ "$1" != "" ]; do
    case $1 in
        -d | --directory )      shift
                                installdir=$1
                                mkdir -p $installdir
                                ;;
        -s | --system-wide )    installdir="/usr/share/themes"
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
cp -r Blu-Day/ Grazzy/ Hard-Pink/ Sleany/ $installdir

# Check if the copying succeeded.
if [ $? -ne 0 ]; then
    echo "Installation did not succeed."
else
    echo "Installation succeeded!"
fi

