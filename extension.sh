#!/bin/bash

# arguments: ./extension.sh <file>
# Retval: Image=1 Video=2 Documents=3 Archive=4 misc=5 music=6 Directory=0


if [ -z "$1" ]; then
    exit 125
fi

fname="$1"

if [[ -f "$fname" ]]; then
    case "${fname##*.}" in
        txt|md|rst|pdf|hwp|hwpx|xlsx|docx|csv|json|pptx|py|c|cpp|cc|h|hh)
            exit 3
            ;;
        jpg|jpeg|png|jfif|webp|gif|svg)
            exit 1
            ;;
        mp4|mkv|avi|wmv)
            exit 2
            ;;
        tar|gz|xz|bz2|zip|rar)
            exit 4
            ;;
        mp3|wav)
            exit 6
            ;;
        *)
            exit 5
            ;;
    esac
elif [[ -d "$fname" ]]; then
    exit 0
elif [[ -L "$fname" ]]; then
    exit 0
else
    echo "File doesn't exist"
    exit 125
fi