SET client_encoding = 'UTF8';

\copy colors from '/mnt/c/Users/dytso/src/db2023/hw1/source/colors.csv' CSV HEADER;
\copy inventories from '/mnt/c/Users/dytso/src/db2023/hw1/source/inventories.csv' CSV HEADER;
\copy inventory_parts from '/mnt/c/Users/dytso/src/db2023/hw1/source/inventory_parts.csv' CSV HEADER;
\copy inventory_sets from '/mnt/c/Users/dytso/src/db2023/hw1/source/inventory_sets.csv' CSV HEADER;
\copy parts from '/mnt/c/Users/dytso/src/db2023/hw1/source/parts.csv' CSV HEADER;
\copy part_categories from '/mnt/c/Users/dytso/src/db2023/hw1/source/part_categories.csv' CSV HEADER;
\copy sets from '/mnt/c/Users/dytso/src/db2023/hw1/source/sets.csv' CSV HEADER;
\copy themes from '/mnt/c/Users/dytso/src/db2023/hw1/source/themes.csv' CSV HEADER;