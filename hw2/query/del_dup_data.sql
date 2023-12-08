CREATE TABLE new_c(
    "id" SERIAL PRIMARY KEY,
    "Continent_Name" VARCHAR NOT NULL, 
    "Continent_Code" char(2) NOT NULL, 
    "Country_Name" VARCHAR NOT NULL UNIQUE,
    "Two_Letter_Country_Code" char(2) UNIQUE,
    "Three_Letter_Country_Code" char(3) UNIQUE,
    "Country_Number" int UNIQUE
);

with a as(
    select min(c.id) as id
    from "country-and-continent-codes-list-csv" as c
    group by c."Three_Letter_Country_Code"
)
insert into new_c("id", "Continent_Name", "Continent_Code", "Country_Name", "Two_Letter_Country_Code", "Three_Letter_Country_Code", "Country_Number")
select distinct c.id, c."Continent_Name", c."Continent_Code", c."Country_Name", c."Two_Letter_Country_Code", c."Three_Letter_Country_Code", c."Country_Number"
from "country-and-continent-codes-list-csv" as c, a, "OxCGRT_nat_latest" as o
where a.id = c.id and o."CountryCode" = c."Three_Letter_Country_Code"
order by c."Country_Number";

