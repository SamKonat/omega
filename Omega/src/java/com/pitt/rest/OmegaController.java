
package com.pitt.rest;

import com.pitt.dao.OmegaDao;
import com.pitt.domain.ManufacturerInfo;
import com.pitt.domain.UserInfo;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class OmegaController 
{
    @RequestMapping(method = RequestMethod.GET, value = "/users")
    public Map<String, Object> getUsers()
    {
        Map<String, Object> ret = new HashMap<>();
        try
        {
            OmegaDao dao = OmegaDao.getInstancce();
            List<UserInfo> users = dao.getUsers();
            ret.put("data", users);
            ret.put("count", users.size());
            
            return ret;
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
    
}
