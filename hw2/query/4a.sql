CREATE view joined_data as(
    select countries.name as country, countries.continent as continent, country_date.date as date, government_idx.stringency_avg as str
    from countries join (country_date join government_idx on country_date.id = government_idx.country_date_id) on countries.three_letter_code = country_date.country
);

CREATE view rank_low as(
    select country, continent, date, str, rank() over (partition by continent, date order by str asc, country asc) as r
    from joined_data
    where date in ('20221201', '20220401', '20210401', '20200401')
);

CREATE view lowest_rank as(
    select date, continent, country, str
    from rank_low
    where r = 1
    order by date, continent, country
);

CREATE view rank_high as(
    select country, continent, date, str, rank() over (partition by continent, date order by str desc, country asc) as r
    from joined_data
    where date in ('20221201', '20220401', '20210401', '20200401')
);

CREATE view highest_rank as(
    select date, continent, country, str
    from rank_high
    where r = 1
    order by date, continent, country
);

select lowest_rank.date, lowest_rank.continent, lowest_rank.country as low_country, lowest_rank.str as low_idx, highest_rank.country as high_country, highest_rank.str as high_idx
from lowest_rank join highest_rank on lowest_rank.date = highest_rank.date and lowest_rank.continent = highest_rank.continent;

drop view lowest_rank;
drop view rank_low;
drop view highest_rank;
drop view rank_high;
drop view joined_data;