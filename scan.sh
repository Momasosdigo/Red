#!/bin/bash
clear

echo "Ingrese el rango de ip que desea comprobar en la red"
echo "Ingresar los primeros 3 octetos solamente: 123.0.0."
read -r -p "ip: " ip

for i in `seq 1 254`; do
    ping -c 1 "$ip"."$i" > /dev/null 
    
    if [ "$?" -eq 0 ];then
        echo "$ip"."$i" "[ Activo ]"
    else
        echo "$ip"."$i" "[ No Activo ]"
    fi
done
