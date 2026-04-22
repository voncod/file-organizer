#!/bin/bash

BASE_DIR="/home/luan/workspace/estudos-devops"
LOG_FILE="$BASE_DIR/Bash-Script/logs/log.txt"

mkdir -p $(dirname "$LOG_FILE")"

contador=0

for arquivo in *; do
	[[ -d $arquivo ]] && continue
	[[ $arquivo == "$(basename "$0")" ]] && continue
	ext="${arquivo##*.}"
	
	if [[ "$arquivo" == "$ext" ]]; then
		ext="sem_extensao"
	fi

	mkdir -p "$ext"
	mv "$arquivo" "$ext/"
	
	contador=$((contador + 1))
	
	echo "[$(date)] $arquivo -> $ext/" >> "$LOG_FILE"
	 
done

echo "Total de arquivos movidos: $contador"




	
