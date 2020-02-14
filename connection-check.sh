#!/bin/bash
# check if idle connection is established and restart service if not.

# place port to check for by replaceing PORT
connection=`netstat -taupen | grep PORT | awk '/EST/{print $6}'`

if [ "$connection" == "ESTABLISHED" ]; 
        then
         echo "IDLE connection is up"
        else
         echo "IDLE connection is broken!"
         echo "Restarting Service."
         #place service or command for restart here
         systemctl restart SERVICE OR COMMAND
        fi
