
package com.pitt.dao;

import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnection 
{
    private static DataSource ds;
    
    public void setDs(DataSource ds)
    {
        this.ds = ds;
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
