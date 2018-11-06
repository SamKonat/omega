
package com.pitt.domain;

import java.util.HashMap;
import java.util.Map;

public class RestError 
{
    public static Map<String, Object> errorMessage(String message, 
            String details)
    {
        Map<String, Object> msg = new HashMap<>();
        msg.put("status", "error");
        msg.put("message", message);
        msg.put("details", details);
        
        return msg;
    }
}
