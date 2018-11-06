
package com.pitt.rest;

import java.util.HashMap;
import java.util.Map;

public class RestError extends RuntimeException
{
    private String status = "error";
    private String message;
    private String details;
    
    public RestError(){}
    
    public RestError(String message, String details)
    {
        this.message = message;
        this.details = details;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
    
    public String getMessage() {
        return this.message;
    }
    
    public void setString(String message) {
        this.message = message;
    }
}
