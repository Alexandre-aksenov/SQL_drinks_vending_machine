#!/bin/bash
DB_FILE="Distributeur.sqlite"
SQL_FILE="distributeur_query.sql"

mkdir -p results
counter=1

while read -rd ';' sql
do
    if [ "${sql#SELECT}" = "$sql" ] # ask whether the text does not begin with the word SELECT.
    then
        echo "Not a SELECT!"
    else
        output_file="results/result_${counter}.txt"

        # export query to text file
          echo "Exported query to: $output_file"
        while IFS= read -r line; do

            printf '%s\n' "$line" >> "$output_file"
        done <<< "${sql};"  # Append semicolon back for correctness

        # Next V: execute the query using
        # sqlite3 -header -csv "$DB_FILE" "$sql;" > "$output_file"
    fi

    ((counter++))

done < "$SQL_FILE"
