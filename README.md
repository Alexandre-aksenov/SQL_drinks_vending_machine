# History of a vending machine

The recoirds of a vending machine are
stored and analyzed using SQLite.

# Usage

The database is generated using the script <sql>distributeur_create_db.sql</sql>.
If a name is asked, the user should supply <code>Distributeur.sqlite</code> (the name used in the bash script).

After creating the database, an example of queries is contained in the file <sql>distributeur_query.sql</sql>.
To authomatize extraction of results as CSV files, the script <code>script_multi_save.sh</code> can be used.
It exports the results of the queries to the folder <code>results</code>.


# Limitations of this version

The comments in the SQL script cannot be processed correctly by the script
and result in rejection of the query. The last query (percentage of sells for each drink) can be optimized
for producing a more readable output.

# Feedback and additional questions.

All questions about the source code should be adressed to its author Alexandre Aksenov:
* GitHub: Alexandre-aksenov
* Email: alexander1aksenov@gmail.com