#!/bin/bash

# Archivo de entrada
input_file="modsList.txt"

# Archivo de salida
output_file="outVariables.txt"

# Inicializar variables para almacenar los IDs
mod_ids=""
workshop_ids=""

# Leer el archivo línea por línea
while IFS= read -r line; do
    # Verificar si la línea contiene "Mod ID"
    if [[ $line == Mod\ ID:* ]]; then
        # Extraer el valor después de "Mod ID:" y añadirlo a mod_ids
        mod_ids+="${line#Mod ID:};"
    fi

    # Verificar si la línea contiene "Workshop ID"
    if [[ $line == Workshop\ ID:* ]]; then
        # Extraer el valor después de "Workshop ID:" y añadirlo a workshop_ids
        workshop_ids+="${line#Workshop ID:};"
    fi
done < "$input_file"

# Remover el último punto y coma
mod_ids=${mod_ids%;}
workshop_ids=${workshop_ids%;}

# Escribir los resultados en el archivo de salida
{
    echo "Mod ID:$mod_ids"
    echo "Workshop ID:$workshop_ids"
} > "$output_file"

echo "Datos extraídos y guardados en $output_file"

