#!/bin/bash 

if [[ $EUID > 0 ]]
then 
  echo "Please run with super-user privileges"
  exit 1
else
	cp ./hpguppi*.service /etc/systemd/system/
	cp ./redis_gateway.service /etc/systemd/system/
	cp ./init_hpguppi*.sh /usr/local/bin/
	cp ./hpguppi_service.conf /opt/mnt/share/
	cp ./redis_gateway_service.conf /opt/mnt/share

	systemctl disable hpguppi
	systemctl disable hpguppi_pypeline
	systemctl disable redis_gateway
	systemctl daemon-reload
	systemctl enable hpguppi
	systemctl enable hpguppi_pypeline
	systemctl enable redis_gateway

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
