
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Car;
import mylib.DBUtils;

public class CarDAO {
    public ArrayList<Car> searchCars(String serialNumber, String model, String colour, int year) {
        String sql = "";
        //nếu year đầu vào = 0 thì sql sẽ không tìm kiếm theo year
        //tại sao các fields khác lại ko cần check??
        //      --> bởi vì các fields khác là string và kết hợp dùng LIKE
        //      --> nên chỉ cần để đầu vào là rỗng thì câu sql sẽ bỏ qua fields đó
        //      --> do đó chúng ta chỉ cần check year, vì year là int và không dùng theo LIKE được
        if(year == 0) {
            sql = "select carID, serialNumber, model, colour, year\n"
                    + "from Cars\n"
                    + "where serialNumber like ?, model like ?, colour like ?";
        }else{
            sql = "select carID, serialNumber, model, colour, year\n"
                    + "from Cars\n"
                    + "where serialNumber like ?, model like ?, colour like ?, year = ?";
        }
        
        ArrayList<Car> cList = new ArrayList<>();
        Connection cn = null;
        try{
            cn = DBUtils.getConnection();
            if(cn != null) {
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + serialNumber + "%");
                pst.setString(2, "%" + model + "%");
                pst.setString(3, "%" + colour + "%");
                //nếu year != 0 thì cần set sql thêm year
                //ngược lại thì set sql khong có year
                if(year != 0) {
                    pst.setInt(4, year);
                }
                ResultSet table = pst.executeQuery();
                if(table != null) {
                    while(table.next()) {
                        double carID = table.getDouble("carID");
                        String carSerialNumber = table.getString("serialNumber");
                        String carModel = table.getString("model");
                        String carColour = table.getString("colour");
                        int carYear = table.getInt("year");
                        cList.add(new Car(carID, carSerialNumber, carModel, carColour, carYear));
                    }
                }
            }
        }catch(Exception e) {
            e.printStackTrace();
        }finally {
            try{
                if(cn != null) cn.close();
            }catch(Exception e) {
                e.printStackTrace();
            }
        }
        return cList;
    }
}
