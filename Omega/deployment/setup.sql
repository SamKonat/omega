
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

CREATE TABLE user_transaction (
    ut_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    ut_productId        BIGINT AUTO_INCREMENT NOT NULL,
    ut_userId           BIGINT AUTO_INCREMENT NOT NULL,
    ut_price            FLOAT NOT NULL,
    ut_status           VARCHAR(64) NOT NULL,
    ut_deliveryStatus   VARCHAR(64) NOT NULL,
    ut_type             VARCHAR(64) NOT NULL,
    FOREIGN KEY(ut_productId) REFERENCES products(p_id),
    FOREIGN KEY(ut_userId ) REFERENCES omega_user(ou_id)
);

CREATE TABLE products (
    p_id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    p_name             VARCHAR(128) NOT NULL,
    p_description      VARCHAR(256),
    p_manufacturer_id  BIGINT NOT NULL,
    p_image            BLOB,
    p_quantity         INT NOT NULL,
    p_price            FLOAT NOT NULL,
    FOREIGN KEY(p_manufacturer_id) REFERENCES phone_manufacturer(pm_id)
);