/*extract the name of the set and name of the theme of all the LEGO sets
published in 2017 Example of a LEGO set.
*/

COPY(
    select sets.name as set_name, themes.name as theme_name
    from sets, themes
    where sets.theme_id = themes.id and sets.year = 2017
)
TO '/mnt/c/Users/dytso/src/db2023/hw1/results/4a.csv' WITH CSV HEADER;
