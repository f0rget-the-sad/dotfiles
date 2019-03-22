#!/bin/bash

OUTDIR=~/.cscope
OUTFILE=$OUTDIR/cscope.files
CSCOPE_DB=$OUTDIR/cscope.out

mkdir -p $OUTDIR
cd $OUTDIR
find $* -type f -regex '.*\.\(c\|h\|cpp\|cc\)' > $OUTFILE
cscope -q -b -i $OUTFILE
echo "CSCOPE_DB=$CSCOPE_DB" >> /etc/environment
