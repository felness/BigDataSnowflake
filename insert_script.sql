INSERT INTO dim_customers (
    customerfirstname, customerlastname, customerage, customeremail,
    customercountry, customerpostalcode, customerpettype, customerpetname, customerpetbreed
)
SELECT DISTINCT
    customer_first_name,
    customer_last_name,
    customer_age,
    customer_email,
    customer_country,
    customer_postal_code,
    customer_pet_type,
    customer_pet_name,
    customer_pet_breed
FROM mock_data;


INSERT INTO dim_seller (
    seller_first_name, seller_last_name, seller_email,
    seller_country, seller_postal_code
)
SELECT DISTINCT
    seller_first_name,
    seller_last_name,
    seller_email,
    seller_country,
    seller_postal_code
FROM mock_data;

INSERT INTO dim_product (
    product_name, product_category, product_price, product_quantity,
    product_weight, product_color, product_size, product_brand,
    product_material, product_description, product_rating,
    product_release_date, product_expiry_date, product_reviews
)
SELECT DISTINCT
    product_name,
    product_category,
    product_price,
    product_quantity,
    product_weight,
    product_color,
    product_size,
    product_brand,
    product_material,
    product_description,
    product_rating,
    product_release_date,
    product_expiry_date,
    product_reviews
FROM mock_data;


INSERT INTO dim_sales (
    sale_date, sale_quantity, sale_total_price
)
SELECT DISTINCT
    sale_date,
    sale_quantity,
    sale_total_price
FROM mock_data;

INSERT INTO dim_stores (
    store_name, store_location, story_city, story_state,
    story_country, story_phone, story_email
)
SELECT DISTINCT
    store_name,
    store_location,
    store_city,
    store_state,
    store_country,
    store_phone,
    store_email
FROM mock_data;


INSERT INTO dim_pets (pet_category)
SELECT DISTINCT pet_category
FROM mock_data;


INSERT INTO dim_supliers (
    supplier_name, supplier_contact, supplier_email,
    supplier_phone, supplier_address, supplier_city, supplier_country
)
SELECT DISTINCT
    supplier_name,
    supplier_contact,
    supplier_email,
    supplier_phone,
    supplier_address,
    supplier_city,
    supplier_country
FROM mock_data;


INSERT INTO fact_sales (
    customer_id, seller_id, product_id, sale_id,
    store_id, pet_id, supplier_id, sale_amount,
    sale_quantity, sale_date
)
SELECT
    c.id,
    s.id,
    p.id,
    sl.id,
    st.id,
    pt.id,
    sp.id,
    m.sale_total_price,
    m.sale_quantity,
    m.sale_date
FROM mock_data m
JOIN dim_customers c ON c.customeremail = m.customer_email
JOIN dim_seller s ON s.seller_email = m.seller_email
JOIN dim_product p ON p.product_name = m.product_name
JOIN dim_sales sl ON sl.sale_date = m.sale_date AND sl.sale_total_price = m.sale_total_price
JOIN dim_stores st ON st.store_name = m.store_name
JOIN dim_pets pt ON pt.pet_category = m.pet_category
JOIN dim_supliers sp ON sp.supplier_name = m.supplier_name;







