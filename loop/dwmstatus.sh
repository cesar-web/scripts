#!/bin/sh

while true; do
    # Initial padding
    statusbar="  "

    # RAM used
    MEM=$(free -h | grep Mem)
    MEMUSED=$(echo $MEM | awk '{print $3}')
    MEMUTOT=$(echo $MEM | awk '{print $2}')
    statusbar="$statusbar$(printf "MEM %s/%s | " "$MEMUSED" "$MEMUTOT")"

    # CPU
    CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%
    statusbar="$statusbar$(printf "CPU %s | " "$CPU")"

    # Battery
    BAT=$(acpi | awk '{print $4}' | sed 's/.$//')
    DIS=$(acpi | awk '{print $3}')
    if [ "$DIS" != "Discharging," ]; then
        statusbar="$statusbar$(printf "* %s | " "$BAT")"
    else
        statusbar="$statusbar$(printf "%s | " "$BAT")"
    fi

    # Show tasks to be completed if amount > 0
    TASK=$(wc -l ~/documents/todo | awk '{print $1}')
    if [ $TASK -gt 0 ]; then
        statusbar="$statusbar$(printf "TODO %s | " "$TASK")"
    fi

    # Date and time
    statusbar="$statusbar$(printf "%s" "$(date "+%a %B %d | %I:%M:%S ")")"

    # End padding
    statusbar="$statusbar "

    xsetroot -name "$statusbar"
    sleep 0.9s
done
