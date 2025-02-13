/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Customer;
import mylib.DBUtils;

/**
 *
 * @author ASUS
 */
public class CustomerDAO {
//    public int createCustomer() {
//        
//    } 
    
    public ArrayList<Customer> searchCustomerByName(String name) {
        ArrayList<Customer> rs = new ArrayList<>();
        Connection cn = null;
        
        try{
            cn = DBUtils.getConnection();
            if(cn != null) {
                String sql = "SELECT custID, custName, phone, sex, cusAddress\n"
                        + "FROM Customer\n"
                        + "WHERE custName LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + name + "%");//'%?%'
                ResultSet table = pst.executeQuery();
                if(table != null) {
                    while(table.next()) {
                        int custID = table.getInt("custID");
                        String custName = table.getString("custName");
                        //phone trong sql null thì nhận về 0
                        double custPhone = table.getDouble("phone");
                        //sex trong sql null thì nhận về null
                        String custSex = table.getString("sex") != null ? table.getString("sex") : "";
                        //address trong sql null thì nhận về null
                        String custAddress = table.getString("cusAddress") != null ? table.getString("cusAddress") : "";
                        Customer c = new Customer(custID, custName, custPhone, custSex, custAddress);
                        rs.add(c);
                    }
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            try{
                if(cn != null) {
                    cn.close();
                }
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        
        return rs;
    }
}
