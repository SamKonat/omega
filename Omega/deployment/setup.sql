
/**
 * Author:  Sam
 * Created: Sep 28, 2018
 */

CREATE TABLE access_permission (
    ap_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    ap_name             VARCHAR(128) NOT NULL UNIQUE,
    ap_description      VARCHAR(128),
    ap_string           VARCHAR(128) NOT NULL
);

CREATE TABLE user_role (
    ur_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    ur_name             VARCHAR(128) NOT NULL UNIQUE,
    ur_admin            BOOLEAN NOT NULL DEFAULT FALSE,
    ur_description      VARCHAR(128)
);

CREATE TABLE role_permission_map (
    rpm_role_id         BIGINT AUTO_INCREMENT NOT NULL,
    rpm_perm_id         BIGINT NOT NULL,
    PRIMARY KEY(rpm_role_id, rpm_perm_id),
    FOREIGN KEY(rpm_role_id) REFERENCES user_role(ur_id),
    FOREIGN KEY(rpm_perm_id) REFERENCES access_permission(ap_id)
);

CREATE TABLE omega_user (
    ou_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    ou_first_name       VARCHAR(128) NOT NULL,
    ou_last_name        VARCHAR(128) NOT NULL,
    ou_email            VARCHAR(128) NOT NULL UNIQUE,
    ou_ph_number        VARCHAR(64) NOT NULL,
    ou_address          VARCHAR(256),
    ou_role_id          BIGINT NOT NULL,
    ou_creation_date    TIMESTAMP NOT NULL DEFAULT current_timestamp,
    ou_modified_date    TIMESTAMP NOT NULL DEFAULT current_timestamp,
    ou_password         VARCHAR(50) NOT NULL,
    FOREIGN KEY(ou_role_id) REFERENCES user_role(ur_id)
);

CREATE TRIGGER modify_time BEFORE UPDATE ON omega_user FOR EACH ROW SET 
    NEW.ou_modified_date = current_timestamp;

CREATE TABLE phone_manufacturer (
    pm_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    pm_name             VARCHAR(128) NOT NULL,
    pm_description      VARCHAR(256),
    pm_logo             BLOB
);

CREATE TABLE products (
    p_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    p_name             VARCHAR(128) NOT NULL,
    p_description      VARCHAR(256),
    p_manufacturer_id  BIGINT NOT NULL,
    p_quantity         INT NOT NULL,
    p_price            FLOAT NOT NULL,
    FOREIGN KEY(p_manufacturer_id) REFERENCES phone_manufacturer(pm_id)
);

CREATE TABLE orders (
    od_id                BIGINT AUTO_INCREMENT PRIMARY KEY,
    od_product_id        BIGINT NOT NULL,
    od_user_id           BIGINT NOT NULL,
    od_price             FLOAT NOT NULL,
    od_order_status      VARCHAR(64) NOT NULL,
    od_payment_type      VARCHAR(64) NOT NULL,
    od_creation_date     TIMESTAMP NOT NULL DEFAULT current_timestamp,
    od_modified_date     TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(od_product_id) REFERENCES products(p_id),
    FOREIGN KEY(od_user_id ) REFERENCES omega_user(ou_id)
);

CREATE TRIGGER od_modify_time BEFORE UPDATE ON orders FOR EACH ROW SET 
    NEW.od_modified_date = current_timestamp;

CREATE TABLE delivery_detail(
    dd_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    dd_dest_address     VARCHAR(255) NOT NULL,
    dd_dest_city        VARCHAR(64) NOT NULL,
    dd_dest_state       VARCHAR(64) NOT NULL,
    dd_dest_zip         VARCHAR(64) NOT NULL,
    dd_status           VARCHAR(64) NOT NULL,
    dd_expected_date    TIMESTAMP NOT NULL,
    dd_delivered_date   TIMESTAMP,
    dd_order_id         BIGINT NOT NULL UNIQUE,
    FOREIGN KEY(dd_order_id) REFERENCES orders(od_id)
);

CREATE TABLE reviews (
    r_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    r_notes            VARCHAR(400),
    r_rating           FLOAT,
    r_product_id       BIGINT NOT NULL,
    r_user_id          BIGINT NOT NULL,
    r_date             DATETIME,
    FOREIGN KEY(r_product_id ) REFERENCES products(p_id),
    FOREIGN KEY(r_user_id ) REFERENCES omega_user(ou_id)
);

CREATE TABLE payments (
    pay_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    pay_card_name        VARCHAR(128) NOT NULL,
    pay_card_number      VARCHAR(64) NOT NULL,
    pay_card_expiry      VARCHAR(16) NOT NULL,
    pay_card_cvv         VARCHAR(16) NOT NULL,
    pay_order_id         BIGINT NOT NULL UNIQUE,
    FOREIGN KEY(pay_order_id) REFERENCES orders(od_id)
);

DELIMITER $$
CREATE PROCEDURE purchase_product(IN prod_id BIGINT, IN quantity INT, 
    IN user_id BIGINT, IN price FLOAT, IN order_status VARCHAR(64),
    IN pay_type VARCHAR(64), IN c_name VARCHAR(128), IN c_number VARCHAR(64), 
    IN c_expiry VARCHAR(16), IN cvv VARCHAR(16), IN d_address VARCHAR(255), 
    IN d_city VARCHAR(64), IN d_state VARCHAR(64), IN d_status VARCHAR(64), 
    IN d_zip VARCHAR(64), IN d_expected_date DATE)
BEGIN
    DECLARE prd_cnt INT;
    DECLARE new_order_id BIGINT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION ROLLBACK;
    DECLARE EXIT HANDLER FOR SQLWARNING ROLLBACK;

    START TRANSACTION;

    SELECT p_quantity INTO prd_cnt FROM products WHERE p_id = prod_id;

    IF prd_cnt > 0
    THEN
        UPDATE products SET p_quantity = (p_quantity - quantity) WHERE p_id = prod_id;

        INSERT INTO orders(od_product_id,od_user_id,od_price,od_order_status,
        od_payment_type) VALUES(prod_id,user_id,price,order_status,pay_type);
        
        SELECT LAST_INSERT_ID() INTO new_order_id;

        INSERT INTO payments(pay_card_name,pay_card_number,pay_card_expiry,
        pay_card_cvv,pay_order_id) VALUES(c_name,c_number,c_expiry,cvv,new_order_id);

        INSERT INTO delivery_detail(dd_dest_address,dd_dest_city,dd_dest_state,
        dd_dest_zip,dd_status,dd_expected_date,dd_order_id) VALUES(d_address,
        d_city,d_state,d_zip,d_status,d_expected_date,new_order_id);
    END IF;

    SELECT prd_cnt;

    COMMIT;

END $$
DELIMITER ;
