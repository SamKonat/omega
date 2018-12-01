
package com.pitt.dao;

import com.pitt.domain.Constants;
import static com.pitt.domain.Constants.CHART_COLORS;
import com.pitt.domain.ManufacturerInfo;
import com.pitt.domain.ProductInfo;
import com.pitt.domain.UserInfo;
import com.pitt.domain.OrderInfo;
import com.pitt.domain.PaymentInfo;
import com.pitt.domain.Review;
import com.pitt.util.StringUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

public class OmegaDao 
{
    private static OmegaDao DAO = null;
    
    private OmegaDao(){}
    
    public static OmegaDao getInstancce()
    {
        if(DAO == null)
            DAO = new OmegaDao();
        
        return DAO;
    }
    
    private void executeUpdate(String sql) throws SQLException
    {
        Connection conn = null;
        try
        {
            conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql);
                 ps.executeUpdate();
            }
        catch(SQLException tx)
        {
            System.out.println("Failed to insert/update object with query '" 
                    + sql + "'");
            tx.printStackTrace();
            throw tx;
        }
        finally
        {
            conn.close();
        }
    }
    
    public UserInfo getUsers(String userName, String password) throws Exception
    {
        Connection conn = null;
        try
        {
            UserInfo user = new UserInfo();
            String sql = "select ou_id, ou_password, ou_first_name,ou_last_name,"
                    + " ou_email, ou_address, ou_ph_number, ou_role_id, ur_admin,"
                    + "DATE_FORMAT(ou_creation_date, '%m-%d-%Y %H:%i:%s') "
                    + "as ou_cr_time, DATE_FORMAT"
                    + "(ou_modified_date,'%m-%d-%Y %H:%i:%s') "
                    + "as ou_mo_time from omega_user, user_role where "
                    + "ou_email = '"+userName+"' and ou_password ='"+password+"' and ur_id = ou_role_id;";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    user.setId(rs.getLong("ou_id"));
                    user.setFirstName(rs.getString("ou_first_name"));
                    user.setLastName(rs.getString("ou_last_name"));
                    user.setEmail(rs.getString("ou_email"));
                    user.setPassword("ou_password");
                    user.setAddress(rs.getString("ou_address"));
                    user.setPhoneNumber(rs.getString("ou_ph_number"));
                    user.setRoleId(rs.getInt("ou_role_id"));
                    user.setCreatedTime(rs.getString("ou_cr_time"));
                    user.setModifiedTime(rs.getString("ou_mo_time"));
                    user.setIsAdmin(rs.getBoolean("ur_admin"));
                    
                }
            return user;
        }
        catch(Exception ex)
        {
            System.out.println("Incorrect Username or password");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public void addUsers(UserInfo login) throws Exception {
        
        Connection conn = null;
        try {
            
            String sql = "INSERT INTO omega_user(ou_first_name, ou_last_name, "
                    + "ou_email, ou_ph_number, ou_address, ou_role_id, ou_password) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?);";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, login.getFirstName());
            ps.setString(2, login.getLastName());
            ps.setString(3, login.getEmail());
            ps.setString(4, login.getPhoneNumber());
            ps.setString(5, login.getAddress());
            ps.setString(6, "1");
            ps.setString(7, login.getPassword());
            ps.execute();
            
        } catch(Exception ex)
        {
            System.out.println("Failed to fetch phone manufacturers from "
                    + "database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public List<ManufacturerInfo> getManufacturers() throws Exception
    {
        Connection conn = null;
        try
        {
            List<ManufacturerInfo> users = new ArrayList<>();
            String sql = "select pm_id, pm_name, pm_description, pm_logo "
                + "from phone_manufacturer;";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    ManufacturerInfo man = new ManufacturerInfo();
                    man.setId(rs.getLong("pm_id"));
                    man.setName(rs.getString("pm_name"));
                    man.setDescription(rs.getString("pm_description"));
                    man.setLogo(Constants.IMAGE_DATA_PREFIX + 
                        StringUtils.getBase64String(rs.getBytes("pm_logo")));
                    
                    users.add(man);
                }
            return users;
        }
        catch(Exception ex)
        {
            System.out.println("Failed to fetch phone manufacturers from "
                    + "database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
//    public List<Transaction> getTransactions() throws Exception
//    {
//        Connection conn = null;
//        try
//        {
//            List<Transaction> users = new ArrayList<>();
//            String sql = "ut_id, ut_productId, ut_userId, ut_price, ut_status,"
//                + "ut_deliveryStatus, ut_type from user_transaction;";
//            conn = DBConnection.getConnection();
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//            
//            if(rs != null)
//                while(rs.next())
//                {
//                    Transaction tran = new Transaction();
//                    tran.setId(rs.getLong("ut_id"));
//                    tran.setProductId(rs.getLong("ut_productId"));
//                    tran.setUserId(rs.getLong("ut_userId"));
//                    tran.setPrice(rs.getFloat("ut_price"));
//                    tran.setStatus(rs.getString("ut_status"));
//                    tran.setDeliveryStatus(rs.getString("ut_deliveryStatus"));
//                    tran.setType(rs.getString("ut_type"));
//                    
//                    users.add(tran);
//                }
//            return users;
//        }
//        catch(Exception ex)
//        {
//            System.out.println("Failed to fetch transactions from "
//                    + "database");
//            ex.printStackTrace();
//            throw ex;
//        }
//        finally
//        {
//            conn.close();
//        }
//    } 
    
    public List<ProductInfo> getProducts(long manId, Boolean outOfStock) 
            throws Exception
    {
        Connection conn = null;
        try
        {
            List<ProductInfo> productsList = new ArrayList<>();
            String xtraWhere = "";
            if(outOfStock != null && outOfStock)
                xtraWhere = " and p_quantity < 1";
            String sql = "select p_id, p_name, p_description, "
                + "p_quantity, p_price, pm_name "
                + "from products, phone_manufacturer where pm_id = "
                + "p_manufacturer_id and p_manufacturer_id = " 
                + manId + xtraWhere + ";";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    ProductInfo products = new ProductInfo();
                    products.setId(rs.getLong("p_id"));
                    products.setProductName(rs.getString("p_name"));
                    products.setDescription(rs.getString("p_description"));
                    products.setPrice(rs.getFloat("p_price"));
                    products.setQuantity(rs.getInt("p_quantity"));
                    products.setManufacturerName(rs.getString("pm_name"));
                    
                    productsList.add(products);
                }
            return productsList;
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to fetch products from "
                    + "database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public List<Review> getReviews(long prodId) throws Exception
    {
        Connection conn = null;
        try
        {
            List<Review> reviews = new ArrayList<>();
            String sql = "select r_id, r_notes, r_rating, "
                + "r_product_id, r_user_id, r_date "
                + "from reviews where r_product_id = " 
                + prodId + ";";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    Review r = new Review();
                    r.setId(rs.getLong("r_id"));
                    r.setNotes(rs.getString("r_notes"));
                    r.setRating(rs.getFloat("r_rating"));
                    r.setProductId(rs.getLong("r_product_id"));
                    r.setUserId(rs.getLong("r_user_id"));
                    r.setDate(rs.getString("r_date"));
                    
                    
                    reviews.add(r);
                }
            return reviews;
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to fetch reviews from "
                    + "database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public List<ProductInfo> getProductdetails(long prodId) throws Exception
    {
        Connection conn = null;
        try
        {
            List<ProductInfo> productdetailslist = new ArrayList<>();
            String sql = "select p_id, p_name, p_description, "
                + "p_quantity, p_price "
                + "from products where p_id = " 
                + prodId + ";";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    ProductInfo pr = new ProductInfo();
                    pr.setId(rs.getLong("p_id"));
                    pr.setProductName(rs.getString("p_name"));
                    pr.setDescription(rs.getString("p_description"));
                    pr.setPrice(rs.getFloat("p_price"));
                    pr.setQuantity(rs.getInt("p_quantity"));
                    
                    productdetailslist.add(pr);
                }
            return productdetailslist;
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to fetch product details from "
                    + "database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public List<Map<String, Object>> getBrandSales(String period) throws Exception
    {
        Connection conn = null;
        try
        {
            List<Map<String, Object>> ret = new ArrayList<>();
            Map<String, Object> elem = new HashMap<>();
            String xtraWhere = "";
            if(period != null) {
                xtraWhere = " and ";
                switch(xtraWhere) {
                    case "daily" :
                        xtraWhere = " date(od_creation_date) = current_date ";
                        break;
                    case "mothly" :
                        xtraWhere = " month(od_creation_date) = month("
                                + "current_date) and year(od_creation_date) = "
                                + "year(current_date) ";
                        break;
                    case "yearly" :
                        xtraWhere = " year(od_creation_date) = year(current_date) ";
                        break;
                }
            }
            String sql = "select count(o.od_id) as cnt, m.pm_name from phone_manufacturer m, "
                + "products p, orders o where o.od_product_id = p.p_id and "
                + "p.p_manufacturer_id = m.pm_id " + xtraWhere 
                + " group by o.od_product_id order by pm_name limit 10;";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            Iterator iter = CHART_COLORS.keySet().iterator();
            if(rs != null)
                while(rs.next())
                {
                    elem = new HashMap<>();
                    elem.put("label", rs.getString("pm_name"));
                    elem.put("value", rs.getString("cnt"));
                    elem.put("color", CHART_COLORS.get(iter.next()));
                    
                    ret.add(elem);
                }
            
            return ret;
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to find top selling brands from database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public Map<String, Object> getSalesTrend(String period) 
        throws Exception
    {
        Connection conn = null;
        try
        {
            Map<String, Object> ret = new HashMap<>();
            String xtraSelect = " date(od_creation_date) as label ";
            String xtraWhere = " group by date(od_creation_date)";
            if(period != null) {
                switch(xtraWhere) {
                    case "mothly" :
                        xtraSelect = " substring(monthname(od_creation_date), "
                                + "1, 3) as label ";
                        xtraWhere = " group by month(od_creation_date)";
                        break;
                    case "yearly" :
                        xtraSelect = " year(od_creation_date) as label ";
                        xtraWhere = " group by year(od_creation_date)";
                        break;
                }
            }
            String sql = "select count(o.od_id) as cnt, " + xtraSelect
                + " from phone_manufacturer m, products p, orders o where "
                + "o.od_product_id = p.p_id and p.p_manufacturer_id = m.pm_id " 
                + xtraWhere + " order by od_creation_date desc limit 10;";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            List<String> labels = new ArrayList<>();
            List<Integer> values = new ArrayList<>();
            if(rs != null)
                while(rs.next())
                {
                    String label = rs.getString("label");
                    Integer value = rs.getInt("cnt");
                    
                    labels.add(label);
                    values.add(value);
                }
            
            Collections.reverse(labels);
            Collections.reverse(values);
            ret.put("labels", labels);
            String col = CHART_COLORS.get("blue");
            List<Map<String, Object>> datasets = new ArrayList<>();
            Map<String, Object> map = new HashMap<>();
            map.put("data", values);
            map.put("label", "Products Sold");
            map.put("fillColor", "rgba(0,0,0,0.1)");
            map.put("strokeColor", col);
            map.put("pointColor", col);
            map.put("pointStrokeColor", "rgba(128,128,128,1.0)");
            map.put("pointHighlightFill", "rgba(128,128,128,1.0)");
            
            datasets.add(map);
            
            ret.put("datasets", datasets);
            return ret;
        }
        catch(Exception ex)
        {
            System.out.println("Failed to find sales trend from database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public void updateProductQuantity(long productId, int quantity) 
            throws Exception
    {
        Connection conn = null;
        try
        {
            String sql = "update products set p_quantity = " + quantity 
                + " where p_id = " + productId;
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        }
        catch(Exception ex)
        {
            System.out.println("Failed to update product quantity");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public List<PaymentInfo> getPaymentInfo(String cardName, String cardNo, 
            String cardExpiry, String cardCvv) throws Exception
    {
        Connection conn = null;
        try
        {
            List<PaymentInfo> paymentsList = new ArrayList<>();
            String sql = "select pay_id, pay_card_name, pay_card_number, "
                + "pay_card_expiry, pay_card_cvv, pay_order_id "
                + "from payments where p_id = " 
                + "where pay_card_name = '"+cardName+"' and pay_card_number = "
                    + "'"+cardNo+"' and pay_card_expiry = '"+cardExpiry+"' "
                    + "and pay_card_cvv= '"+cardCvv+"';";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    PaymentInfo pi = new PaymentInfo();
                    pi.setId(rs.getLong("pay_id"));
                    pi.setCardName(rs.getString("pay_card_name"));
                    pi.setCardNo(rs.getString("pay_card_number"));
                    pi.setCardExpiry(rs.getString("pay_card_expiry"));
                    pi.setCardCvv(rs.getString("pay_card_cvv"));
                    pi.setOrderId(rs.getLong("pay_order_id"));
                    
                    paymentsList.add(pi);
                }
            return paymentsList;
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to fetch payment details from "
                    + "database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
}