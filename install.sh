#!/bin/bash

git submodule update --recursive --remote --init

HOSTNAME=`hostname`

STOW=`which stow`
if [[ ! -f $STOW ]] ; then
	echo No stow found 1>&2
	exit
fi
M4=`which m4`
if [[ ! -f $M4 ]] ; then
	echo No m4 found 1>&2
	exit
fi

M4_FILES=`find -iname \*m4`

for INPUT in $M4_FILES ; do
	OUTPUT=${INPUT%.m4}
	echo $INPUT '=>' $OUTPUT
	$M4 -P -D HOSTNAME=$HOSTNAME $INPUT > $OUTPUT
done

PACKAGES=`cat configs`
for p in $PACKAGES ; do
	$STOW $p --ignore=.keep
done
