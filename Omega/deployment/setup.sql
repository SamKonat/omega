
/**
 * Author:  Sam
 * Created: Sep 28, 2018
 */

CREATE TABLE access_permission_category (
    apc_id              INT AUTO_INCREMENT PRIMARY KEY,
    apc_name            VARCHAR(128) NOT NULL,
    apc_description     VARCHAR(128)
);

CREATE TABLE access_permission (
    ap_id               INT AUTO_INCREMENT PRIMARY KEY,
    ap_name             VARCHAR(128) NOT NULL,
    ap_description      VARCHAR(128),
    ap_string           VARCHAR(128) NOT NULL,
    ap_category         INT NOT NULL,
    FOREIGN KEY(ap_category) REFERENCES access_permission_category(acp_id)
);

CREATE TABLE user_role (
    ur_id               INT AUTO_INCREMENT PRIMARY KEY,
    ur_name             VARCHAR(128) NOT NULL,
    ur_description      VARCHAR(128)
);

CREATE TABLE role_permission_map (
    rpm_role_id         INT NOT NULL,
    rpm_perm_id         INT NOT NULL,
    PRIMARY KEY(rpm_role_id, rpm_perm_id),
    FOREIGN KEY(rpm_role_id) REFERENCES user_role(ur_id),
    FOREIGN KEY(rpm_perm_id) REFERENCES access_permission(ap_id)
);