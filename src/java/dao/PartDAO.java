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
import model.Part;
import mylib.DBUtils;

/**
 *
 * @author Admin
 */
public class PartDAO {
    //Ham nay lay ds part dua theo partName
    public ArrayList<Part> getPartByName(String partName){
        ArrayList<Part> rs = new ArrayList<>();
        Connection cn=null;
        try {
            cn = DBUtils.getConnection();
            if(cn != null){
                String sql = "SELECT [partID], [partName], [purchasePrice], [retailPrice] FROM [dbo].[Parts]\n" +
                            "WHERE partName LIKE ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + partName + "%");
                ResultSet table = pst.executeQuery();
                if(table != null){
                    while(table.next()){
                        int partid = table.getInt("partID");
                        String partname = table.getString("partName");
                        Double pprice = table.getDouble("purchasePrice");
                        Double rprice = table.getDouble("retailPrice");
                        rs.add(new Part(partid, partname, pprice, rprice));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        
        return rs;
    }
    
    //hàm này để insert part vào DB
    public int insertPart(int partID, String partName, Double purchasePrice, Double retailPrice){
        int rs = 0;
        Connection cn=null;
        try {
            cn = DBUtils.getConnection();
            if(cn != null){
                String sql = "INSERT Parts (partID, partName, purchasePrice, retailPrice)\n" +
                                "VALUES (?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, partID);
                pst.setString(2, partName);
                pst.setDouble(3, purchasePrice);
                pst.setDouble(4, retailPrice);
                rs = pst.executeUpdate();
                
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
    
    //ham nay lay part dua vao id
    public Part getPartById(int partid){
        Part result = null;
        Connection cn=null;
        try {
            cn = DBUtils.getConnection();
            if(cn != null){
                String sql = "SELECT [partID],[partName],[purchasePrice],[retailPrice] FROM [dbo].[Parts]\n" +
                                "WHERE [partID] = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, partid);
                ResultSet table = pst.executeQuery();
                if(table != null){
                    while(table.next()){
                        int partID = table.getInt("partID");
                        String partname = table.getString("partName");
                        Double pprice = table.getDouble("purchasePrice");
                        Double rprice = table.getDouble("retailPrice");
                        result = new Part(partID, partname, pprice, rprice);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
