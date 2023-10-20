/*find out the name of the colors that are most used in the LEGO parts, for each
theme, and list the top 1 for each theme (please provide the name of the
theme, too). Different from the “e”, if we have 10 green Plate 1 x 1, it should
be counted as 10 green parts. Hint: Quantity
*/
--use join

COPY(
    with full_table as(
    select colors.name as color, themes.name as theme, count(inventory_parts.color_id) as count
    from (inventory_parts join inventories on inventory_parts.inventory_id = inventories.id)
        join (sets join themes on sets.theme_id = themes.id) on inventories.set_num = sets.set_num
        join colors on inventory_parts.color_id = colors.id
    group by color, theme
    order by theme, count desc
    ),
    max_count as(
    select theme, max(count) as max
    from full_table
    group by theme
    )
    select full_table.theme, full_table.color
    from full_table, max_count
    where full_table.theme = max_count.theme and full_table.count = max_count.max
)
TO '/mnt/c/Users/dytso/src/db2023/hw1/results/4f.csv' WITH CSV HEADER;