
package com.pitt.domain;

import java.util.*;

public class Constants 
{
    public static String IMAGE_DATA_PREFIX = "data:image/png;base64,";
    public static Map<String, String> CHART_COLORS = new HashMap<>();
    public static Map<Integer, String> MONTHS = new HashMap<>();
    
    static 
    {
        CHART_COLORS.put("darkGrey", "#4D5360");        // DarkGrey
        CHART_COLORS.put("blue", "#4285F4");        // Blue
        CHART_COLORS.put("yellow", "#FDB45C");        // Yellow
        CHART_COLORS.put("green", "#63E2C6");        // Green
        CHART_COLORS.put("red", "#F7464A");        // Red
        CHART_COLORS.put("orange", "#DE8E40");        // Orange
        CHART_COLORS.put("lightGreen", "#C0FBCA");        // Light
        CHART_COLORS.put("darkRed", "#A90D0E");
        CHART_COLORS.put("lilac", "#A687AA");
        CHART_COLORS.put("tuscan", "#6C464E");
        
        MONTHS.put(1, "Jan");
        MONTHS.put(2, "Jan");
        MONTHS.put(3, "Jan");
        MONTHS.put(4, "Jan");
        MONTHS.put(5, "Jan");
        MONTHS.put(6, "Jan");
        MONTHS.put(7, "Jan");
        MONTHS.put(8, "Jan");
        MONTHS.put(9, "Jan");
        MONTHS.put(10, "Jan");
        MONTHS.put(11, "Jan");
        MONTHS.put(12, "Jan");
    }
}
