
/**
 * Author:  Sam
 * Created: Sep 28, 2018
 */

CREATE TABLE access_permission (
    ap_id               INT PRIMARY KEY,
    ap_name             VARCHAR(128) NOT NULL UNIQUE,
    ap_description      VARCHAR(128),
    ap_string           VARCHAR(128) NOT NULL
);

CREATE TABLE user_role (
    ur_id               INT PRIMARY KEY,
    ur_name             VARCHAR(128) NOT NULL UNIQUE,
    ur_admin            BOOLEAN NOT NULL DEFAULT FALSE,
    ur_description      VARCHAR(128)
);

CREATE TABLE role_permission_map (
    rpm_role_id         INT NOT NULL,
    rpm_perm_id         INT NOT NULL,
    PRIMARY KEY(rpm_role_id, rpm_perm_id),
    FOREIGN KEY(rpm_role_id) REFERENCES user_role(ur_id),
    FOREIGN KEY(rpm_perm_id) REFERENCES access_permission(ap_id)
);

CREATE TABLE omega_user (
    ou_id               INT AUTO_INCREMENT PRIMARY KEY,
    ou_first_name       VARCHAR(128) NOT NULL,
    ou_last_name        VARCHAR(128) NOT NULL,
    ou_email            VARCHAR(128) NOT NULL UNIQUE,
    ou_ph_number        VARCHAR(64) NOT NULL,
    ou_address          VARCHAR(256),
    ou_role_id          INT NOT NULL,
    ou_creation_date    TIMESTAMP NOT NULL DEFAULT current_timestamp,
    ou_modified_date    TIMESTAMP NOT NULL DEFAULT current_timestamp,
    FOREIGN KEY(ou_role_id) REFERENCES user_role(ur_id)
);

CREATE TRIGGER modify_time BEFORE UPDATE ON omega_user FOR EACH ROW SET 
    NEW.ou_modified_date = current_timestamp;