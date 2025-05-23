CREATE TABLE dim_customers (
    id SERIAL PRIMARY KEY,
    customerfirstname VARCHAR(50),
    customerlastname VARCHAR(50),
    customerage INT,
    customeremail VARCHAR(50),
    customercountry VARCHAR(50),
    customerpostalcode VARCHAR(50),
    customerpettype VARCHAR(50),
    customerpetname VARCHAR(50), 
    customerpetbreed VARCHAR(50)
);
CREATE TABLE dim_seller (
    id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR(50),
    seller_last_name VARCHAR(50),
    seller_email varchar(50),
    seller_country VARCHAR(50),
    seller_postal_code VARCHAR(50)
);

CREATE TABLE dim_product (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    product_category VARCHAR(50),
    product_price float,
    product_quantity int,
    product_weight float,
    product_color varchar(50),
    product_size varchar(50),
    product_brand varchar(50),
    product_material varchar(50),
    product_description varchar(1024),
    product_rating float,
    product_release_date varchar(50),
    product_expiry_date varchar(50),
    product_reviews varchar(1024)
    
);

CREATE TABLE dim_sales (
    id SERIAL PRIMARY KEY,
    sale_date VARCHAR(50),
    sale_quantity int,
    sale_total_price float
);

CREATE TABLE dim_stores (
    id SERIAL PRIMARY KEY,
    store_name VARCHAR(50),
    store_location VARCHAR(50),
    story_city VARCHAR(50),
    story_state VARCHAR(50),
    story_country VARCHAR(50),
    story_phone VARCHAR(50),
    story_email VARCHAR(50)
);
CREATE TABLE dim_pets (
    id SERIAL PRIMARY KEY,
    pet_category VARCHAR(50)
    
);

CREATE TABLE dim_supliers (
    id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_contact VARCHAR(50),
    supplier_email VARCHAR(50),
    supplier_phone VARCHAR(50),
    supplier_address VARCHAR(50),
    supplier_city VARCHAR(50),
    supplier_country VARCHAR(50)
);


CREATE TABLE fact_sales (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES dim_customers(id),
    seller_id INT REFERENCES dim_seller(id),
    product_id INT REFERENCES dim_product(id),
    sale_id INT REFERENCES dim_sales(id),
    store_id INT REFERENCES dim_stores(id),
    pet_id INT REFERENCES dim_pets(id),
    supplier_id INT REFERENCES dim_supliers(id),
    sale_amount FLOAT,
    sale_quantity INT,
    sale_date VARCHAR(50)
);






