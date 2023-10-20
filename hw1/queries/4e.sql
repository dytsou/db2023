/*find out the name of the colors that are most used in the unique LEGO parts,
and list the top 10. Example of a LEGO part. Unique means if we have 10
green Plate 1 x 1, it should be counted as 1 green part. If we have 10 green
Plate 1 x 1 and 10 green Plate 2 x 2, then it should be counted as 2 green
part.
*/

COPY (
    with part as(
        select inventory_parts.part_num,inventory_parts.color_id
        from inventory_parts
        group by part_num, color_id
    ),
    pop_color as(
        select part.color_id
        from part
        group by color_id 
        order by count(part) desc
        limit 10
    )
    select colors.name
    from colors, pop_color
    where colors.id = pop_color.color_id
    )
TO '/mnt/c/Users/dytso/src/db2023/hw1/results/4e.csv' WITH CSV HEADER;
