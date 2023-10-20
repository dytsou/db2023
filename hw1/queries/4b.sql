/*extract the total number of LEGO sets in each year from 1950 to 2017, in
descending order of total number of LEGO sets
*/

COPY(
    select year, count(sets) as total
    from sets
    where year >= 1950 and year <= 2017
    group by year
    order by total desc
)
TO '/mnt/c/Users/dytso/src/db2023/hw1/results/4b.csv' WITH CSV HEADER;
