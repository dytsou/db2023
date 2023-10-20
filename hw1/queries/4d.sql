/*extract the average number of parts in a set for each theme, with the name of
the theme and the average number of parts per set. In ascending order of
average number of parts in a set
*/

COPY(
    select themes.name, avg(sets.num_parts) as avg_part
    from themes, sets
    where themes.id = sets.theme_id
    group by themes.name
    order by avg_part    
)
TO '/mnt/c/Users/dytso/src/db2023/hw1/results/4d2.csv' WITH CSV HEADER;
