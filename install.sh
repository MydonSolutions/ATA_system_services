#!/bin/bash 

if [[ $EUID > 0 ]]
then 
  echo "Please run with super-user privileges"
  exit 1
else
	cp ./hpdaq.service /etc/systemd/system/
	cp ./hpdaq_service.conf /opt/mnt/share/

	systemctl disable hpdaq
	systemctl daemon-reload
	systemctl enable hpdaq

	# echo
	echo To install Meta Marshall as a service:
	echo sudo cp ./meta_marshall.service /etc/systemd/system/
	echo sudo cp ./init_meta_marshall.sh /usr/local/bin/
	echo sudo systemctl disable meta_marshall
	echo sudo systemctl daemon-reload
	echo sudo systemctl enable meta_marshall

	# echo
	echo To install ATApipelinemonitor as a service:
	echo sudo cp ./atapipelinemonitor.service /etc/systemd/system/
	echo sudo cp ./init_atapipelinemonitor.sh /usr/local/bin/
	echo sudo systemctl disable atapipelinemonitor
	echo sudo systemctl daemon-reload
	echo sudo systemctl enable atapipelinemonitor
fi
