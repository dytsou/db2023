/*extract the name of the most popular theme, defined by the number of sets in
the themes.
*/

COPY(
    select themes.name
    from themes
    where themes.id = (
        select sets.theme_id
        from sets
        group by sets.theme_id
        order by count(sets) desc
        limit 1
    )
)
TO '/mnt/c/Users/dytso/src/db2023/hw1/results/4c.csv' WITH CSV HEADER;
