
package model;

import java.util.Date;

public class ServiceTicket {
    private int seviceTicketID;
    private Date dateReceived;
    private Date dateReturned;
    private double carID;
    private int custID;

    public ServiceTicket() {
    }

    public ServiceTicket(int seviceTicketID, Date dateReceived, Date dateReturned, double carID, int custID) {
        this.seviceTicketID = seviceTicketID;
        this.dateReceived = dateReceived;
        this.dateReturned = dateReturned;
        this.carID = carID;
        this.custID = custID;
    }


    public int getSeviceTicketID() {
        return seviceTicketID;
    }

    public void setSeviceTicketID(int seviceTicketID) {
        this.seviceTicketID = seviceTicketID;
    }

    public Date getDateReceived() {
        return dateReceived;
    }

    public void setDateReceived(Date dateReceived) {
        this.dateReceived = dateReceived;
    }

    public Date getDateReturned() {
        return dateReturned;
    }

    public void setDateReturned(Date dateReturned) {
        this.dateReturned = dateReturned;
    }

    public double getCarID() {
        return carID;
    }

    public void setCarID(double carID) {
        this.carID = carID;
    }

    public int getCustID() {
        return custID;
    }

    public void setCustID(int custID) {
        this.custID = custID;
    }
    
    
}
