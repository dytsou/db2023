SET client_encoding = 'UTF8';

insert into continents(name, code)
select distinct c."Continent_Name", c."Continent_Code"
from "new_c" as c;

insert into countries(name, jurisdiction, two_letter_code, three_letter_code, number, continent)
select distinct c."Country_Name", o."Jurisdiction", c."Two_Letter_Country_Code", c."Three_Letter_Country_Code", c."Country_Number", c."Continent_Name"
from "OxCGRT_nat_latest" as o, "new_c" as c
where o."CountryCode" = c."Three_Letter_Country_Code";

insert into country_date(id, country, date)
select distinct o."id", o."CountryCode", o."Date"
from "OxCGRT_nat_latest" as o, countries as c
where o."CountryCode" = c."three_letter_code";

insert into confirmed(country_date_id, cases, death)
select distinct o.id, o."ConfirmedCases", o."ConfirmedDeaths"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."ConfirmedCases" is null and o."ConfirmedDeaths" is null);

insert into vaccinated(country_date_id, majority, population)
select distinct o.id, o."MajorityVaccinated", o."PopulationVaccinated"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."MajorityVaccinated" is null and o."PopulationVaccinated" is null);

insert into "containment and closure policies"(country_date_id, "C1M_School closing", "C1M_Flag", "C2M_Workplace closing", "C2M_Flag", "C3M_Cancel public events", "C3M_Flag", "C4M_Restrictions on gatherings", "C4M_Flag", "C5M_Close public transport", "C5M_Flag", "C6M_Stay at home requirements", "C6M_Flag", "C7M_Restrictions on internal movement", "C7M_Flag", "C8EV_international travel controls")
select distinct o.id, o."C1M_School closing", o."C1M_Flag", o."C2M_Workplace closing", o."C2M_Flag", o."C3M_Cancel public events", o."C3M_Flag", o."C4M_Restrictions on gatherings", o."C4M_Flag", o."C5M_Close public transport", o."C5M_Flag", o."C6M_Stay at home requirements", o."C6M_Flag", o."C7M_Restrictions on internal movement", o."C7M_Flag", o."C8EV_international travel controls"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."C1M_School closing" is null and o."C1M_Flag" is null and o."C2M_Workplace closing" is null and o."C2M_Flag" is null and o."C3M_Cancel public events" is null and o."C3M_Flag" is null and o."C4M_Restrictions on gatherings" is null and o."C4M_Flag" is null and o."C5M_Close public transport" is null and o."C5M_Flag" is null and o."C6M_Stay at home requirements" is null and o."C6M_Flag" is null and o."C7M_Restrictions on internal movement" is null and o."C7M_Flag" is null and o."C8EV_international travel controls" is null);

insert into "economic policies"(country_date_id, "E1_Income support", "E1_Flag", "E2_Debt/contract relief", "E3_Fiscal measures", "E4_International support")
select distinct o.id, o."E1_Income support", o."E1_Flag", o."E2_Debt/contract relief", o."E3_Fiscal measures", o."E4_International support"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."E1_Income support" is null and o."E1_Flag" is null and o."E2_Debt/contract relief" is null and o."E3_Fiscal measures" is null and o."E4_International support" is null);

insert into "health system policies"(country_date_id, "H1_Public information campaigns", "H1_Flag", "H2_Testing policy", "H3_Contact tracing", "H4_Emergency investment in healthcare", "H5_Investment in vaccines", "H6M_Facial Coverings", "H6M_Flag", "H7_Vaccination policy", "H7_Flag", "H8M_Protection of elderly people", "H8M_Flag")
select distinct o.id, o."H1_Public information campaigns", o."H1_Flag", o."H2_Testing policy", o."H3_Contact tracing", o."H4_Emergency investment in healthcare", o."H5_Investment in vaccines", o."H6M_Facial Coverings", o."H6M_Flag", o."H7_Vaccination policy", o."H7_Flag", o."H8M_Protection of elderly people", o."H8M_Flag"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."H1_Public information campaigns" is null and o."H1_Flag" is null and o."H2_Testing policy" is null and o."H3_Contact tracing" is null and o."H4_Emergency investment in healthcare" is null and o."H5_Investment in vaccines" is null and o."H6M_Facial Coverings" is null and o."H6M_Flag" is null and o."H7_Vaccination policy" is null and o."H7_Flag" is null and o."H8M_Protection of elderly people" is null and o."H8M_Flag" is null);


insert into "vaccination policies"(country_date_id, "V1_Vaccine Prioritisation (summary)", "V2A_Vaccine Availability (summary)", "V2B_Vaccine age eligibility/availability age floor (general population summary)", "V2C_Vaccine age eligibility/availability age floor (at risk summary)", "V2D_Medically/ clinically vulnerable (Non-elderly)", "V2E_Education", "V2F_Frontline workers  (non healthcare)", "V2G_Frontline workers  (healthcare)", "V3_Vaccine Financial Support (summary)", "V4_Mandatory Vaccination (summary)")
select distinct o.id, o."V1_Vaccine Prioritisation (summary)", o."V2A_Vaccine Availability (summary)", o."V2B_Vaccine age eligibility/availability age floor (general population summary)", o."V2C_Vaccine age eligibility/availability age floor (at risk summary)", o."V2D_Medically/ clinically vulnerable (Non-elderly)", o."V2E_Education", o."V2F_Frontline workers  (non healthcare)", o."V2G_Frontline workers  (healthcare)", o."V3_Vaccine Financial Support (summary)", "V4_Mandatory Vaccination (summary)"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."V1_Vaccine Prioritisation (summary)" is null and o."V2A_Vaccine Availability (summary)" is null and o."V2B_Vaccine age eligibility/availability age floor (general population summary)" is null and o."V2C_Vaccine age eligibility/availability age floor (at risk summary)" is null and o."V2D_Medically/ clinically vulnerable (Non-elderly)" is null and o."V2E_Education" is null and o."V2F_Frontline workers  (non healthcare)" is null and o."V2G_Frontline workers  (healthcare)" is null and o."V3_Vaccine Financial Support (summary)" is null and o."V4_Mandatory Vaccination (summary)" is null);

insert into government_idx(country_date_id, stringency_avg, gov_response_avg, containment_health_avg, economic_support)
select distinct o.id, o."StringencyIndex_Average_ForDisplay", "GovernmentResponseIndex_Average_ForDisplay", "ContainmentHealthIndex_Average_ForDisplay", "EconomicSupportIndex_ForDisplay"
from "OxCGRT_nat_latest" as o, country_date as c
where o.id = c.id and NOT (o."StringencyIndex_Average_ForDisplay" is null and o."GovernmentResponseIndex_Average_ForDisplay" is null and o."ContainmentHealthIndex_Average_ForDisplay" is null and o."EconomicSupportIndex_ForDisplay" is null);