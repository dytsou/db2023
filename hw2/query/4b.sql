CREATE view joined_data as(
    select countries.name as country, countries.continent as continent, country_date.date as date, government_idx.stringency_avg as str, confirmed.cases as cases
    from (countries join (country_date join government_idx on country_date.id = government_idx.country_date_id) on countries.three_letter_code = country_date.country) join confirmed on country_date.id = confirmed.country_date_id
    where date in ('20221125', '20221201', '20220326', '20220401', '20210326', '20210401', '20200326', '20200401')
);

CREATE view diff as(
    select country, continent, date, str, cases, (cases - lag(cases) over (partition by country, continent order by date))/7 as avg
    from joined_data
);

create view over_table as(
    select country, continent, date, (str/avg) as over_str
    from diff
    where avg != 0
);

CREATE view rank_low as(
    SELECT country, continent, over_str, date, rank() over (partition by continent, date order by over_str asc, country asc) as r
    FROM over_table
    where date in ('20221201', '20220401', '20210401', '20200401')
);

CREATE view lowest_rank as(
    select date, continent, country, round(over_str,5) as over_str
    from rank_low
    where r = 1
    order by date, continent, country
);

CREATE view rank_high as(
    SELECT country, continent, over_str, date, rank() over (partition by continent, date order by over_str desc, country asc) as r
    FROM over_table
    where date in ('20221201', '20220401', '20210401', '20200401')
);

CREATE view highest_rank as(
    select date, continent, country, round(over_str,5) as over_str
    from rank_high
    where r = 1
    order by date, continent, country
);

select lowest_rank.date, lowest_rank.continent, lowest_rank.country as low_country, lowest_rank.over_str as low_idx, highest_rank.country as high_country, highest_rank.over_str as high_idx
from lowest_rank join highest_rank on lowest_rank.date = highest_rank.date and lowest_rank.continent = highest_rank.continent;


drop view highest_rank;
drop view rank_high;
drop view lowest_rank;
drop view rank_low;
drop view over_table;
drop view diff;
drop view joined_data;