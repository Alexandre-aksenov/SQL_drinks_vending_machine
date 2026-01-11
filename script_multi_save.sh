#!/bin/bash
DB_FILE="Distributeur.sqlite"
SQL_FILE="distributeur_query.sql"
counter=1

# Use awk to split the file by semicolons and loop through each block
awk -v RS=';' '{print $0}' "$SQL_FILE" | while read -r query; do
    
    # Skip empty lines or whitespace-only blocks
    [[ -z "${query//[[:space:]]/}" ]] && continue

    output_file="results/result_${counter}.csv"
    
    # Execute the query and redirect to CSV
    # We add the semicolon back to the query string for SQLite execution
    sqlite3 -header -csv "$DB_FILE" "$query;" > "$output_file"
    
    echo "Exported query #$counter to $output_file"
    ((counter++))
done