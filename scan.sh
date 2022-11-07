#!/bin/bash
clear

while [ "$op" != 4 ]; do
    echo "======================================"
    echo "|=| 1. Escaneo de manera manual    |=|"
    echo "|=| 2. Escanear desde la ip actual |=|"
    echo "|=| 3. Escaneo automatico          |=|"
    echo "|=| 4. Salir                       |=|"
    echo "====================================="
    read -r -p "=> " op
    echo

    case "$op" in
        1)
            echo "Ingrese el rango de ip que desea comprobar en la red"
            echo "Ingresar los primeros 3 octetos solamente sin punto final: 123.0.0.X"
            read -r -p "ip: " ip
            
            for i in $(seq 1 25); do
                ping -c 1 "$ip"."$i" > /dev/null 
                if [ "$?" -eq 0 ];then
                    echo "$ip"."$i" "[ Activo ]"
                else
                    echo "$ip"."$i" "[ No Activo ]"
                fi
            done
        break;;
        
        2)
            echo "Ingrese su ip actual para continuar: [ $(hostname -I | awk '{print $1}') ]"
            read -r -p "=> " ip

            for i in $(seq 1 25); do
                ping -c 1 "$ip"."$i" > /dev/null 
                if [ "$?" -eq 0 ];then
                    echo "$ip"."$i" "[ Activo ]"
                else
                    echo "$ip"."$i" "[ No Activo ]"
                fi
            done
        break;;

        3) #Ver mejora
            echo "[ Escaneo de red actual ]"
            ip=$(hostname -I | awk '{print $1}')
            for i in $(seq 1 25); do
                ping -c 1 "$ip"."$i" > /dev/null 
                if [ "$?" -eq 0 ];then
                    echo "$ip"."$i" "[ Activo ]"
                else
                    echo "$ip"."$i" "[ No Activo ]"
                fi
            done
        break;;

        4)
            clear
            exit
        ;;

        *)
            clear
            echo
            echo -e "\033[4;35mNo es una opcion lo que intentas\e[0m"
            echo
            sleep 2s
            clear
            [ "$op" = true ]
        ;;
    esac
done