<%-- 
    Document   : createTicketPage
    Created on : Feb 25, 2025, 3:53:56 PM
    Author     : ASUS
--%>

<%@page import="model.Car"%>
<%@page import="dao.CarDAO"%>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        label {
            display: inline-block;
            width: 150px;
        }
        
        .head-page{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
    </style>
    </head>
    <body>
        
        <%
            CustomerDAO cD = new CustomerDAO();
            ArrayList<Customer> custL = cD.searchCustomerByName("");
            CarDAO carD = new CarDAO();
            ArrayList<Car> carL = carD.getAllCar();
        %>
        
        <div class="head-page">
            <h1>Create service ticket page</h1>
            <a href="MainServlet?action=salePersonDashBoard">Back to sale person dashboard</a>
        </div>
        
        <form action="MainServlet">
            <div>
                <label>Received Date</label>
                <input type="date" name="dateReceived">
            </div>
            <div>
                <label>Returned Date</label>
                <input type="date" name="dateReturned">
            </div>
            <!--chọn customer-->
            <div>
                <label>Customer: </label>
                <select name="custID">
                    <option value="" selected>-----None-----</option>
                    <%
                        for (Customer c : custL) {
                    %>
                    <option value="<%= c.getCustID()%>"><%= c.toString()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <!--select car of customer-->
            <div>
                <label>Car: </label>
                <select name="carID" style="width: 50%">
                    <option value="" selected>-----None-----</option>
                    <%
                        for (Car c : carL) {
                    %>
                    <option value="<%= c.getCarID() %>"> 
                        <%= c.getCarID() +"-"+ c.getSerialNumber() + "-" + c.getColour() + "-" + c.getYear() + "-" + c.getModel() %> 
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>
            
            <div><input type="submit" value="create"></div>
            <input type="hidden" value="createTicketServ" name="action">
        </form>          
                
        <!--output-->
        <%
            if(request.getAttribute("result") != null) {
        %>
        <h5><%= request.getAttribute("result") %></h5>
        <%
            }    
        %>
    </body>
</html>
