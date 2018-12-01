
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
    pay_card_expiry      TIMESTAMP NOT NULL,
    pay_card_cvv         VARCHAR(16) NOT NULL,
    pay_order_id         BIGINT NOT NULL UNIQUE,
    FOREIGN KEY(pay_order_id) REFERENCES orders(od_id)
);