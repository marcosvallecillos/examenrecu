#!/bin/bash

max_consumo=0
min_consumo=999999999999  
ciudad_max=""
ciudad_min=""
mes_max=""
mes_min=""
anio_max=""
anio_min=""

while  read -r linea; do
    ciudad=$(echo "$linea" | awk '{print $1}')
    mes=$(echo "$linea" | awk '{print $2}')
    anio=$(echo "$linea" | awk '{print $3}')
    consumo=$(echo "$linea" | awk '{print $4}')

    if [ "$consumo" -gt "$max_consumo" ]; then
        max_consumo="$consumo"
        ciudad_max="$ciudad"
        mes_max="$mes"
        anio_max="$anio"
    fi

  
    if [ "$consumo" -lt "$min_consumo" ]; then
        min_consumo="$consumo"
        ciudad_min="$ciudad"
        mes_min="$mes"
        anio_min="$anio"
    fi
done <  consumos.txt
echo "Consumo máximo:"
echo "Ciudad: $ciudad_max, Mes: $mes_max, Año: $anio_max, Consumo: $max_consumo"
echo
echo "Consumo mínimo:"
echo "Ciudad: $ciudad_min, Mes: $mes_min, Año: $anio_min, Consumo: $min_consumo"