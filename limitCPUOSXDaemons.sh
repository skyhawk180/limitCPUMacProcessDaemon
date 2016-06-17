#!/bin/bash
#echo "Usage: Command ProcessName Limit%% "
###
# setup cputhrottle if doesn't exists. I prefer /usr/bin or /usr/local/bin. You can always select home directory if you choose.
###
#echo "PID: $(pgrep $1)"
set_service_cpu_limit(){
    service_pid=$(pgrep $1)
    limit=$2
    if [[ ! -z $service_pid  ]]; then
        service_cpu=$(ps aux | grep "sudo /path/to/cputhrottle $service_pid $limit" | grep -v grep | wc -l)
        if [[ ! $service_cpu -gt 0 ]]; then
            sudo ./cputhrottle $service_pid $limit &
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
