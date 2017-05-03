#!/usr/bin/env bash

# Auto enable PiCamera (can also be done with "raspi-config" command)
grep "start_x=1" /boot/config.txt
if grep "start_x=1" /boot/config.txt; then
  echo "PiCamera already enabled, no need to enable it again."
else
  sed -i "s/start_x=0/start_x=1/g" /boot/config.txt
  echo "Reboot will be necessary in order to use the PiCamera."
fi

# Install Python (python 2.7 & 3.x)
[[ -z $(which python) ]] && sudo apt-get --yes --force-yes install python
[[ -z $(which python2.7) ]] && sudo apt-get --yes --force-yes install python2.7
[[ -z $(which python3) ]] && sudo apt-get --yes --force-yes install python3

# Install & Upgrade Pi-Camera python library
[[ -z $(which python-picamera) ]] && sudo apt-get --yes --force-yes install python-picamera
[[ -z $(which python3-picamera) ]] && sudo apt-get --yes --force-yes install python3-picamera
