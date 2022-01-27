#!/bin/bash
source "/home/sonata/.rvm/scripts/rvm"

export ATASHAREDIR="/opt/mnt"
export PATH=/opt/mnt/bin:$PATH:/home/sonata/.rvm/rubies/ruby-2.1.10/bin:/home/sonata/.rvm/bin
export GEM_PATH=/home/sonata/.rvm/gems/ruby-2.1.10/bin
export LD_LIBRARY_PATH=/opt/mnt/lib:$LD_LIBRARY_PATH
# use environment variable instead of HOME/"/tmp" to ensure user-agnostic key is generated by ftok
export HASHPIPE_KEYFILE=/home/sonata

instance_systemname=$1
if [ -z "$1" ]
then
  instance_systemname="pktsock_atasnap_optimised"
fi

/opt/mnt/bin/init_hpguppi.py $instance_systemname 0,1 --configfile '/opt/mnt/share/config_hpguppi.yml' >> /var/log/init_hpguppi.log 2>&1
# /home/sonata/miniconda3/bin/python /opt/mnt/bin/start_hpguppi_daq.py -I 0,1 >> /var/log/init_hpguppi.log 2>&1
# bash /opt/mnt/bin/init_pypeline.sh 0 1 >> /var/log/init_full_hpguppi_pipeline.log 2>&1

#exit 0
