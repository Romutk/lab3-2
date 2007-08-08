#!/bin/bash

#
# Copyright (C) 2007 Karel Zak <kzak@redhat.com>
#
# This file is part of util-linux-ng.
#
# This file is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This file is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
. ./commands.sh

echo
echo "------------------ Utils-linux-ng regression tests ------------------"
echo
echo "                    For development purpose only.                    "
echo "                 Don't execute on production system!                 "
echo

rm -f *~

res=0
count=0
for ts in $(find -maxdepth 1 -regex "\./ts[^\.~]*" |  sort); do
	$TS_TOPDIR/$ts "$1"
	res=$(( $res + $? ))
	count=$(( $count + 1 ))
done

echo
echo "---------------------------------------------------------------------"
if [ $res -eq 0 ]; then
	echo "  All $count tests PASSED"
	res=0
else
	echo "  $res tests of $count FAILED"
	res=1
fi
echo "---------------------------------------------------------------------"
exit $res
