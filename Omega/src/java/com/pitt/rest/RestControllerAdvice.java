
package com.pitt.rest;

import java.util.HashMap;
import java.util.Map;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.util.WebUtils;

@ControllerAdvice(annotations = {RestController.class})
public class RestControllerAdvice 
{
    @ExceptionHandler({ RestError.class })
    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ResponseBody
    public final Map<String, String> handleException(RestError ex, 
            WebRequest request) 
    {
        Map<String, String> ret = new HashMap<>();
        ret.put("status", "error");
        ret.put("message", ex.getMessage());
        ret.put("details", ex.getDetails());
        
        return ret;
    }
}
