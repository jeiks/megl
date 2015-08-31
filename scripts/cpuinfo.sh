#!/bin/bash

ARQ_INFO='/proc/cpuinfo'

INFO_CORES=$(grep 'cpu cores' $ARQ_INFO | cut -d: -f2 | tail -n 1)
INFO_VENDOR=$(grep vendor_id $ARQ_INFO | cut -d: -f2 | tail -n 1)
INFO_MODEL=$(grep 'model name' $ARQ_INFO | cut -d: -f2 | head -n 1) # só pra diferenciar
INFO_HZ=$(grep 'cpu MHz' $ARQ_INFO | awk '{print $NF}' | tail -n 1)
INFO_CACHE=$(awk '{if ($1 == "cache" && $2 == "size") { print $(NF-1)" "$NF; exit; }}' $ARQ_INFO) # para diferenciar de novo

echo -e "
\t\033[0;1mInformações da CPU do Computador\033[0m
 - Quantidade de Núcleos: $INFO_CORES
 - Vendedor: $INFO_VENDOR
 - Modelo: $INFO_MODEL
 - Taxa de processamento atual: $INFO_HZ
 - Tamanho da cache: $INFO_CACHE
"
