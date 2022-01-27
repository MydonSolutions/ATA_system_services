#!/bin/bash
# conda activate rfsoc8bit
echo '+ conda activate rfsoc8bit'
source /home/sonata/miniconda3/bin/activate /home/sonata/miniconda3/envs/rfsoc8bit
# export ATASHAREDIR="/opt/mnt"
export ATASHAREDIR=/opt/mnt

export PYTHONUNBUFFERED=yes
workdir="/home/sonata/logs"
logstem="${workdir}/meta-marshall"

echo "Starting meta-marshall"

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

meta_marshall.py < /dev/null 1>> "${logstem}.out" 2>> "${logstem}.err"
