#!/bin/bash
workdir="/home/sonata/logs"
logstem="${workdir}/atapipelinemonitor"

echo "Starting atapipelinemonitor"

if test -f "$logstem.out"; then
	echo "Trimming log $logstem.out"
	tail -n 100000 $logstem.out > tmp.out
	mv -f tmp.out $logstem.out
	echo -------------------- >> $logstem.out
	echo Startup `date` >> $logstem.out
fi
if test -f "$logstem.err"; then
	echo "Trimming log $logstem.err"
	tail -n 100000 $logstem.err > tmp.err
	mv -f tmp.err $logstem.err
	echo -------------------- >> $logstem.err
	echo Startup `date` >> $logstem.err
fi

cd /home/sonata/src/atapipelinemonitor
node main.js < /dev/null 1>> "${logstem}.out" 2>> "${logstem}.err"
