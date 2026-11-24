#!/bin/sh

exec vncviewer \
    -FullScreen \
    -QualityLevel=9 \
    PreferredEncoding=Raw \
    ReconnectOnError=0 \
    "$@"
