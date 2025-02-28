<%-- 
    Document   : updateCarPage
    Created on : Feb 24, 2025, 12:21:18 PM
    Author     : ASUS
--%>

<%@page import="model.Car"%>
<%@page import="dao.CarDAO"%>
<%@page import="model.SalePerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
        .head-page{
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        </style>
    </head>
    <body>
        <div class="head-page">
            <h1>Update car page</h1>
            <a href="MainServlet?action=salePersonDashBoard">Back to sale person dashboard</a>
        </div>
        <%
            SalePerson sp = (SalePerson)session.getAttribute("sale");
            if(sp == null) request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
        %>
        <%
            String carIDs = request.getParameter("carID");
            if(carIDs == null || carIDs.isEmpty())
                request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
            int carID = Integer.parseInt(carIDs);
            CarDAO cD = new CarDAO();
            Car c = cD.getCarByCarID(carID);
        %>
        <p>Car before updating</p>
        <div><%= c.toString() %></div>
    </body>
</html>
