
/**
 * Author:  Sam
 * Created: Sep 29, 2018
 */

DELETE FROM omega_user;
DELETE FROM role_permission_map;
DELETE FROM user_role;
DELETE FROM access_permission;
DELETE FROM access_permission_category;

# Permissions master list

INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string) 
    VALUES(1, 'Add Role', 'Permission to add new roles',
    'add.role');
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string) 
    VALUES(2, 'Edit Role', 'Permission to edit roles',
    'edit.role');
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string) 
    VALUES(3, 'Delete Role', 'Permission to delete roles',
    'delete.role');
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string) 
    VALUES(4, 'View Role', 'Permission to view roles',
    'view.role');

#
# User management permissions
#

INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(5, 'Add User', 'Permission to add users',
    'add.user', 1);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(6, 'Edit User', 'Permission to edit users',
    'edit.user', 1);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(7, 'Delete User', 'Permission to delete users',
    'delete.user', 1);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(8, 'View User', 'Permission to view user details',
    'view.user', 1);

#
# Product management permissions
#

INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(9, 'Add Product', 'Permission to add products',
    'add.product', 2);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(10, 'Edit Product', 'Permission to edit products',
    'edit.product', 2);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(11, 'Delete Product', 'Permission to delete products',
    'delete.product', 2);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(12, 'View Product', 'Permission to view product details',
    'view.product', 2);
INSERT INTO access_permission(ap_id, ap_name, ap_description, ap_string, 
    ap_category_id) VALUES(13, 'Purchase Product', 'Permission to purchase products',
    'purchase.product', 2);

#
# Role master list
#

INSERT INTO user_role(ur_id, ur_name, ur_admin, ur_description) VALUES(1,
    'Admin', true, 'Admin role with all privileges');
INSERT INTO user_role(ur_id, ur_name, ur_admin, ur_description) VALUES(2,
    'Operator', false, 'Operator role with product management privileges');
INSERT INTO user_role(ur_id, ur_name, ur_admin, ur_description) VALUES(3,
    'Customer', false, 'Customer role');

#
# Role permission mapping
# Admin role permission mapping

INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,1);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,2);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,3);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,4);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,5);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,6);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,7);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,8);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,9);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,10);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,11);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,12);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(1,13);

#
# Operator permission mapping
#

INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(2,9);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(2,10);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(2,11);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(2,12);
INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(2,13);

#
# Customer permission mapping
#

INSERT INTO role_permission_map(rpm_role_id, rpm_perm_id) VALUES(3,13);

#
# User list
#

INSERT INTO omega_user(ou_id, ou_first_name, ou_last_name, ou_email, ou_ph_number,
    ou_address, ou_role_id) VALUES(1, 'Admin', 'Omega', 'admin@omega.com',
    '4127730994', '3295 Kennett Square', 1);
INSERT INTO omega_user(ou_id, ou_first_name, ou_last_name, ou_email, ou_ph_number,
    ou_address, ou_role_id) VALUES(2, 'Operator', 'Omega', 'operator@omega.com',
    '4127730994', '3295 Kennett Square', 2);
INSERT INTO omega_user(ou_id, ou_first_name, ou_last_name, ou_email, ou_ph_number,
    ou_address, ou_role_id) VALUES(3, 'Dilisha', 'Naidu', 'din10@pitt.edu',
    '4127730994', '3295 Kennett Square', 3);
INSERT INTO omega_user(ou_id, ou_first_name, ou_last_name, ou_email, ou_ph_number,
    ou_address, ou_role_id) VALUES(4, 'Sohini', 'Palit', 'soh12@pitt.edu',
    '4127730994', '3295 Kennett Square', 3);
INSERT INTO omega_user(ou_id, ou_first_name, ou_last_name, ou_email, ou_ph_number,
    ou_address, ou_role_id) VALUES(5, 'Samuel', 'Konat', 'sjk124@pitt.edu',
    '4127730994', '3295 Kennett Square', 3);