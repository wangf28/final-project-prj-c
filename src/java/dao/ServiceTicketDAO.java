
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.ServiceTicket;
import mylib.DBUtils;

public class ServiceTicketDAO {
    public int createServiceTicket(ServiceTicket s) {
        int rs = 0;
        Connection cn = null;
        
        try{
            cn = DBUtils.getConnection();
            if(cn != null) {
               String sql = "insert ServiceTicket \n"
                        + "values(?, ?, ?, ?, ?)";
               PreparedStatement pst = cn.prepareStatement(sql);
               //ticket id trong java là string, nhma db là decimal nên chuyển
               pst.setInt(1, Integer.parseInt(s.getSeviceTicketID()));
               pst.setString(2, s.getDateReceived().toString());
               pst.setString(3, s.getDateReturned().toString());
               //cust id là int nên k cần chuyển
               pst.setInt(4, s.getCustID());
               //car id trong java là string, nhma db là decimal nên chuyển
               pst.setDouble(5, Double.parseDouble(s.getCarID()));
               rs = pst.executeUpdate();
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
