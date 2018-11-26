/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Sam
 * Created: Nov 20, 2018
 */

INSERT INTO products (p_id, p_name, p_description, p_manufacturer_id, p_quantity, p_price) 
	VALUES (600,'Moto G6', 'test description', 3, 100, 200);

INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(1, 13, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO delivery_detail(dd_dest_address, dd_dest_city, dd_dest_zip, dd_status,
    dd_expected_date, dd_delivered_date, dd_order_id)
    VALUES('3295 Kennett Square', 'Pittsburgh', '15213', 'delivered', '2018-11-30', '2018-11-26');

INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 13, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO delivery_detail(dd_dest_address, dd_dest_city, dd_dest_zip, dd_status,
    dd_expected_date, dd_delivered_date, dd_order_id)
    VALUES('3295 Kennett Square', 'Pittsburgh', '15213', 'delivered', '2018-11-30', '2018-11-26');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-10-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-10-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-10-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-10-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-09-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-09-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-07-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-07-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-06-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2018-05-17');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2017-11-16');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2017-11-16');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2017-11-15');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2017-11-14');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2017-11-14');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-13');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-13');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-13');
INSERT INTO orders(od_id, od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-13');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-13');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-13');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2016-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2015-11-13');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2015-11-13');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2015-11-13');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2014-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2014-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2014-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2013-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2013-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2013-11-12');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(13, 5, 250, 'confirmed', 'credit', '2013-11-12');


INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-10-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-10-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-10-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-10-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-09-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-09-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-09-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-09-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-07-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-07-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-07-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-07-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-07-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-06-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-06-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-06-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2016-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2016-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2016-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2015-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2015-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2015-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(600, 5, 250, 'confirmed', 'credit', '2013-05-16');


INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-23');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-22');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-10-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-21');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-20');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-11-19');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-10-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-10-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-10-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-09-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-09-18');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-09-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-09-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-08-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-07-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-07-17');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-07-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-07-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-07-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-06-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-06-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-06-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2018-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2017-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2016-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2016-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2016-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2015-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2015-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2015-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2014-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2013-05-16');
INSERT INTO orders(od_product_id, od_user_id, od_price, od_order_status,
    od_payment_type, od_creation_date)
    VALUES(2, 5, 250, 'confirmed', 'credit', '2013-05-16');