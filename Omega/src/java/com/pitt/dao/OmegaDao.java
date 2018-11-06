
package com.pitt.dao;

import com.pitt.domain.UserInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    
    public List<UserInfo> getUsers() throws Exception
    {
        Connection conn = null;
        try
        {
            List<UserInfo> users = new ArrayList<>();
            String sql = "select ou_id, ou_first_name, ou_last_name, ou_email, "
                + "ou_address, ou_ph_number, ou_role_id, ur_name, "
                + "DATE_FORMAT(ou_creation_date, '%m-%d-%Y %H:%i:%s') as "
                + "ou_cr_time, DATE_FORMAT(ou_modified_date, "
                + "'%m-%d-%Y %H:%i:%s') as ou_mo_time from omega_user u, "
                + "user_role r where r.ur_id = u.ou_role_id";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    UserInfo usr = new UserInfo();
                    usr.setId(rs.getLong("ou_id"));
                    usr.setFirstName(rs.getString("ou_first_name"));
                    usr.setLastName(rs.getString("ou_last_name"));
                    usr.setEmail(rs.getString("ou_email"));
                    usr.setAddress(rs.getString("ou_address"));
                    usr.setPhoneNumber(rs.getString("ou_ph_number"));
                    usr.setRoleId(rs.getInt("ou_role_id"));
                    usr.setRoleName(rs.getString("ur_name"));
                    usr.setCreatedTime(rs.getString("ou_cr_time"));
                    usr.setModifiedTime(rs.getString("ou_mo_time"));
                    
                    users.add(usr);
                }
            return users;
        }
        catch(Exception ex)
        {
            System.out.println("Failed to fetch users from database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
    
    public List<UserInfo> getManufacturers() throws Exception
    {
        Connection conn = null;
        try
        {
            List<UserInfo> users = new ArrayList<>();
            String sql = "select ou_id, ou_first_name, ou_last_name, ou_email, "
                + "ou_address, ou_ph_number, ou_role_id, ur_name, "
                + "DATE_FORMAT(ou_creation_date, '%m-%d-%Y %H:%i:%s') as "
                + "ou_cr_time, DATE_FORMAT(ou_modified_date, "
                + "'%m-%d-%Y %H:%i:%s') as ou_mo_time from omega_user u, "
                + "user_role r where r.ur_id = u.ou_role_id";
            conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            if(rs != null)
                while(rs.next())
                {
                    UserInfo usr = new UserInfo();
                    usr.setId(rs.getLong("ou_id"));
                    usr.setFirstName(rs.getString("ou_first_name"));
                    usr.setLastName(rs.getString("ou_last_name"));
                    usr.setEmail(rs.getString("ou_email"));
                    usr.setAddress(rs.getString("ou_address"));
                    usr.setPhoneNumber(rs.getString("ou_ph_number"));
                    usr.setRoleId(rs.getInt("ou_role_id"));
                    usr.setRoleName(rs.getString("ur_name"));
                    usr.setCreatedTime(rs.getString("ou_cr_time"));
                    usr.setModifiedTime(rs.getString("ou_mo_time"));
                    
                    users.add(usr);
                }
            return users;
        }
        catch(Exception ex)
        {
            System.out.println("Failed to fetch users from database");
            ex.printStackTrace();
            throw ex;
        }
        finally
        {
            conn.close();
        }
    }
}