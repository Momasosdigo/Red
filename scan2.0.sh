#!/bin/bash
clear

while [ "$op" != 3 ]; do
    echo "================================="
    echo "|=| 1. Modificar datos de red |=|"
    echo "|=| 2. Ver datos              |=|"
    echo "|=| 3. Salir                  |=|"
    echo "================================="
    read -r -p "=> " op
    
   case "$op" in
    1)
        source '2° Tarea'/mod_datos
    ;;

    2)
        clear
        cat /etc/netplan/01-network-manager-all.yaml
        read -n1 -p "Presione cualquier tecla para [ CONTINUAR ]..." op
        clear
        [ "$op" = true ]
    ;;
    
    3)
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
