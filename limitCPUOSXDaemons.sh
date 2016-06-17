#!/bin/bash
#echo "Usage: Command "
###
#echo $1 $2
# setup cputhrottle if doesn't exists
###
#echo "PID: $(pgrep CarboniteDaemon)"
set_service_cpu_limit(){
    service_pid=$(pgrep CarboniteDaemon)
#    echo "Found PID: $service_pid"
    limit=$2
    if [[ ! -z $service_pid  ]]; then
        service_cpu=$(ps aux | grep "sudo ./cputhrottle $service_pid 25" | grep -v grep | wc -l)
        if [[ ! $service_cpu -gt 0 ]]; then
            sudo ./cputhrottle $service_pid 25 &
        fi
    fi
}

###
# main loop
###
while true; do
    set_service_cpu_limit bzfilelist 2
    set_service_cpu_limit bztransmit 2
    sleep 30
done
