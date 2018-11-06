
package com.pitt.util;

import javax.xml.bind.DatatypeConverter;

public class StringUtils 
{
    private StringUtils(){}
    
    public static String getBase64String(byte[] bytes)
    {
        return DatatypeConverter.printBase64Binary(bytes);
    }
}
