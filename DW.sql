drop table if exists state_province_fact;
drop table if exists date_dim;

CREATE TABLE date_dim (
    date_id BIGINT NOT NULL,
    full_date DATE NOT NULL,
    day INT not null,
    month INT not null,
    quarter INT not null,
    year INT not null,
    is_weekday VARCHAR(255) NOT NULL,
    day_of_week VARCHAR(255) NOT NULL,
    PRIMARY KEY(date_id)
);

CREATE TABLE state_province_fact (
    date_id BIGINT NOT NULL,
	state_province_fact_id BIGINT NOT NULL,
    state_province_code VARCHAR(255) NOT NULL,
    state_province_name VARCHAR(255) NOT NULL,
    country_name VARCHAR(255) NOT NULL,
    province_lat FLOAT NOT NULL,
    province_long FLOAT NOT NULL,
    product_count BIGINT NOT NULL,
    order_count BIGINT NOT NULL,
    total_discount FLOAT NOT NULL,
    customer_count BIGINT NOT NULL,
    total_sale FLOAT NOT NULL,
    PRIMARY KEY(date_id, state_province_fact_id),
    FOREIGN KEY(date_id) REFERENCES date_dim(date_id)
);

ALTER TABLE state_province_fact 
    ADD CONSTRAINT state_province_fact_date_id_foreign 
    FOREIGN KEY(date_id) REFERENCES date_dim(date_id);