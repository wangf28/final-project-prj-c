
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Car;
import mylib.DBUtils;

public class CarDAO {
    

    //year trong db là int, nhma chúng ta vẫn có thể search như String kết hợp
    //với toán tử LIKE
    public ArrayList<Car> getCars(String serialNum, String model, String year) {
        ArrayList<Car> rs = new ArrayList<>();
        Connection cn = null;

        try {
            cn = DBUtils.getConnection();
            if (cn != null) {
                String sql = "select carID, serialNumber, model, colour, year from Cars\n"
                        + "where serialNumber like ? and model like ? and year like ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + serialNum + "%");
                pst.setString(2, "%" + model + "%");
                pst.setString(3, "%" + year + "%");
                ResultSet table = pst.executeQuery();
                if (table != null) {
                    while (table.next()) {
                        String carID = table.getString("carID");
                        String serialNumber = table.getString("serialNumber");
                        model = table.getString("model");
                        String colour = table.getString("colour");
                        int yearN = table.getInt("year");

                        rs.add(new Car(carID, serialNum, model, colour, yearN));
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return rs;
    }
//--------------------------------------------------------------------
    public ArrayList<Car> getCarsByCustID(int custID) {
        ArrayList<Car> rs = new ArrayList<>();
        Connection cn = null;
        
        try{
            cn = DBUtils.getConnection();
            if(cn != null) {
                String sql = "select carID, serialNumber, model, colour, year\n"
                        + "from Cars c join SalesInvoice s on c.carID = s.carID\n"
                        + "where s.custID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, custID);
                ResultSet table = pst.executeQuery();
                if(table != null) {
                    while(table.next()) {
                        String carID = table.getString("carID");
                        String serialNumber = table.getString("serialNumber");
                        String model = table.getString("model");
                        String colour = table.getString("colour");
                        int year = table.getInt("year");
                        rs.add(new Car(carID, serialNumber, model, colour, year));
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

    public ArrayList<Car> getAllCar() {
        ArrayList<Car> rs = new ArrayList<>();
        Connection cn = null;
        
        try{
            cn = DBUtils.getConnection();
            if(cn != null) {
                String sql = "select carID, serialNumber, model, colour, year from Cars";
                PreparedStatement pst = cn.prepareStatement(sql);
                ResultSet table = pst.executeQuery();
                if(table != null) {
                    while(table.next()) {
                        String carID = table.getString("carID");
                        String serialNumber = table.getString("serialNumber");
                        String model = table.getString("model");
                        String colour = table.getString("colour");
                        int year = table.getInt("year");
                        rs.add(new Car(carID, serialNumber, model, colour, year));
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
