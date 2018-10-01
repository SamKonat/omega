
package com.k11.dao;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection 
{
    private static DataSource ds;
    
    private DBConnection()
    {
        try
        {
            InitialContext initialContext = new InitialContext();
            Context context = (Context) initialContext.lookup("java:comp/env");
            ds = (DataSource) context.lookup("omegapool");
        }
        catch(Exception ex)
        {
            System.out.println("Failed to fetch connection pool");
            ex.printStackTrace();
        }
    }
    
    static Connection getConnection() throws SQLException
    {
        try
        {
            return ds.getConnection();
        }
        catch(SQLException ex)
        {
            System.out.println("Failed to fetch connection pool");
            ex.printStackTrace();
            throw ex;
        }
    }
}
