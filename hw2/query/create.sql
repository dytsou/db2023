create table continents(
    name varchar(20) not null,
    code char(2) not null,
    primary key (name)
);

create table countries(
    name varchar(50) not null unique,
    jurisdiction varchar(20),
    two_letter_code char(2) not null unique,
    three_letter_code char(3) not null unique,
    number int not null unique,
    continent varchar(20) not null references continents(name),
    primary key (name)
);

create table country_date(
    id int not null unique,
    country char(3) not null references countries(three_letter_code),
    date char(8) not null,
    primary key (id)
);

create table confirmed(
    country_date_id int not null references country_date(id),
    cases int,
    death int,
    primary key (country_date_id)
);

create table vaccinated(
    country_date_id int not null references country_date(id),
    majority varchar(2),
    population numeric(5,2),
    primary key (country_date_id)
);

create table "containment and closure policies"(
    country_date_id int not null references country_date(id),
    "C1M_School closing" numeric(1), 
    "C1M_Flag" numeric(1), 
    "C2M_Workplace closing" numeric(1), 
    "C2M_Flag" numeric(1), 
    "C3M_Cancel public events" numeric(1), 
    "C3M_Flag" numeric(1), 
    "C4M_Restrictions on gatherings" numeric(1), 
    "C4M_Flag" numeric(1), 
    "C5M_Close public transport" numeric(1), 
    "C5M_Flag" numeric(1), 
    "C6M_Stay at home requirements" numeric(1), 
    "C6M_Flag" numeric(1), 
    "C7M_Restrictions on internal movement" numeric(1), 
    "C7M_Flag" numeric(1), 
    "C8EV_international travel controls" numeric(1), 
    primary key (country_date_id)
);

create table "economic policies"(
    country_date_id int not null references country_date(id),
    "E1_Income support" numeric(1), 
    "E1_Flag" numeric(1), 
    "E2_Debt/contract relief" numeric(1), 
    "E3_Fiscal measures" numeric, 
    "E4_International support" numeric, 
    primary key (country_date_id)
);

create table "health system policies"(
    country_date_id int not null references country_date(id),  
    "H1_Public information campaigns" numeric(1),
    "H1_Flag" numeric(1),
    "H2_Testing policy" numeric(1),
    "H3_Contact tracing" numeric(1),
    "H4_Emergency investment in healthcare" numeric,
    "H5_Investment in vaccines" numeric,
    "H6M_Facial Coverings" numeric(1),
    "H6M_Flag" numeric(1),
    "H7_Vaccination policy" numeric(1),
    "H7_Flag" numeric(1),
    "H8M_Protection of elderly people" numeric(1),
    "H8M_Flag" numeric(1),
    primary key (country_date_id)
);

create table "vaccination policies"(
    country_date_id int not null references country_date(id),
    "V1_Vaccine Prioritisation (summary)" numeric(1), 
    "V2A_Vaccine Availability (summary)" numeric(1), 
    "V2B_Vaccine age eligibility/availability age floor (general population summary)" varchar, 
    "V2C_Vaccine age eligibility/availability age floor (at risk summary)" varchar, 
    "V2D_Medically/ clinically vulnerable (Non-elderly)" numeric(1), 
    "V2E_Education" numeric(1), 
    "V2F_Frontline workers  (non healthcare)" numeric(1), 
    "V2G_Frontline workers  (healthcare)" numeric(1), 
    "V3_Vaccine Financial Support (summary)" numeric(1), 
    "V4_Mandatory Vaccination (summary)" numeric(1),
    primary key (country_date_id)
);

create table government_idx(
    country_date_id int not null references country_date(id),
    stringency_avg numeric(5,2),
    gov_response_avg numeric(5,2),
    containment_health_avg numeric(5,2),
    economic_support numeric(5,2),
    primary key (country_date_id)
);
