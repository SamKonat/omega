
package com.pitt.rest;

import com.pitt.dao.OmegaDao;
import com.pitt.domain.ManufacturerInfo;
import com.pitt.domain.ProductInfo;
import com.pitt.domain.UserInfo;
import com.pitt.domain.OrderInfo;
import com.pitt.domain.Review;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OmegaController 
{
    private static HashMap<Long, Boolean> LOGGED_IN_USERS = new HashMap<>();
    @RequestMapping(method = RequestMethod.POST, value = "/login")
    public UserInfo login(@RequestBody UserInfo login)
    {
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            UserInfo users = dao.getUsers(login.getEmail(), login.getPassword());
            LOGGED_IN_USERS.put(users.getId(), true);
            return users;
        }
        catch(Throwable tx)
        {
            System.out.println("Failed to fetch list of users");
            tx.printStackTrace();
            throw new RestError("Failed to fetch list of users", 
                    tx.getMessage());
        }
    }
    
    @RequestMapping(method = RequestMethod.POST, value = "/signUp")
    public void addUser(@RequestBody UserInfo login)
    {
        //Map<String, Object> ret = new HashMap<>();
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            dao.addUsers(login);
            System.out.println("User added sucessfully");
            
        }
        catch(Throwable tx)
        {
            System.out.println("Failed to fetch list of users");
            tx.printStackTrace();
            throw new RestError("Failed to fetch list of users", 
                    tx.getMessage());
        }
    }
 
    @RequestMapping(method = RequestMethod.GET, value = "/manufacturers")
    public Map<String, Object> getManufacturers()
    {
        Map<String, Object> ret = new HashMap<>();
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            List<ManufacturerInfo> mans = dao.getManufacturers();
            ret.put("data", mans);
            ret.put("count", mans.size());
            
            return ret;
        }
        catch(Throwable tx)
        {
            System.out.println("Failed to fetch list of phone manufacturers");
            tx.printStackTrace();
            throw new RestError(
                "Failed to fetch list of phone manufacturers", tx.getMessage());
        }
    }
    
//    @RequestMapping(method = RequestMethod.GET, value = "/transactions")
//    public Map<String, Object> getTransactions()
//    {
//        Map<String, Object> ret = new HashMap<>();
//        try
//        {
//            OmegaDao dao = OmegaDao.getInstancce();
//            List<Transaction> trans = dao.getTransactions();
//            ret.put("data", trans);
//            ret.put("count", trans.size());
//            
//            return ret;
//        }
//        catch(Throwable tx)
//        {
//            System.out.println("Failed to fetch list of transactions");
//            tx.printStackTrace();
//            throw new RestError(
//                "Failed to fetch list of transactions", tx.getMessage());
//        }
//    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/manufacturer/{id}/products")
    public Map<String, Object> getProducts(
            @PathVariable("id") long manId,
            @RequestParam(value = "outOfStock", required = false) Boolean outOfStk
    )
    {
        Map<String, Object> ret = new HashMap<>();
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            List<ProductInfo> productsList = dao.getProducts(manId, outOfStk);
            ret.put("data", productsList);
            ret.put("count", productsList.size());
            
            return ret;
        }
        catch(Throwable tx)
        {
            System.out.println("Failed to fetch list of products");
            tx.printStackTrace();
            throw new RestError(
                "Failed to fetch list of products", tx.getMessage());
        }
    }
    
       @RequestMapping(method = RequestMethod.GET, value = "/products/{id}/productdetails")
    public Map<String, Object> getProductdetails(
            @PathVariable("id") long prodId
    )
    {
        Map<String, Object> ret = new HashMap<>();
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            List<ProductInfo> det = dao.getProductdetails(prodId);
            ret.put("data", det);
            ret.put("count", det.size());
            
            return ret;
        }
        catch(Throwable tx) 
        {
            System.out.println("Failed to fetch list of product details");
            tx.printStackTrace();
            throw new RestError(
                "Failed to fetch list of product details", tx.getMessage());
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/products/{id}/reviews")
    public Map<String, Object> getReviews(
            @PathVariable("id") long prodId
    )
    {
        Map<String, Object> ret = new HashMap<>();
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            List<Review> reviews = dao.getReviews(prodId);
            ret.put("data", reviews);
            ret.put("count", reviews.size());
            
            return ret;
        }
        catch(Throwable tx)
        {
            System.out.println("Failed to fetch list of reviews");
            tx.printStackTrace();
            throw new RestError(
                "Failed to fetch list of reviews", tx.getMessage());
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/topBrands")
    public List<Map<String, Object>> getTopBrands(
            @RequestParam(value = "period", required = false) String period
    )
    {
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            return dao.getBrandSales(period);
        }
        catch(Throwable ex)
        {
            System.out.println("Failed to fetch top brands");
            ex.printStackTrace();
            throw new RestError(
                "Failed to fetch top brands", ex.getMessage());
        }
    }
    
    @RequestMapping(method = RequestMethod.GET, value = "/salesTrend")
    public Map<String, Object> getSalesTrend(
            @RequestParam(value = "period", required = false) String period
    )
    {
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            return dao.getSalesTrend(period);
        }
        catch(Throwable ex)
        {
            System.out.println("Failed to fetch sales trend");
            ex.printStackTrace();
            throw new RestError(
                "Failed to fetch sales trend", ex.getMessage());
        }
    }
    
    @RequestMapping(method = RequestMethod.PUT, 
        value = "/product/{id}/quantity/{quantity}")
    public void updateProductQuantity(
        @PathVariable("id") long productId,
        @PathVariable("quantity") int quantity
    ) {
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            dao.updateProductQuantity(productId, quantity);
        }
        catch(Throwable tx)
        {
            System.out.println("Failed to update product quantity");
            tx.printStackTrace();
            throw new RestError(
                "Failed to update product quantity", tx.getMessage());
        }
    }
}
