<%-- 
    Document   : viewAllCust
    Created on : Feb 22, 2025, 5:00:12 PM
    Author     : ASUS
--%>

<%@page import="model.Mechanic"%>
<%@page import="model.SalePerson"%>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            SalePerson sp = (SalePerson)session.getAttribute("sale");
            Mechanic m = (Mechanic)session.getAttribute("mechanic");
            if(sp == null && m == null) request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
            
            CustomerDAO d = new CustomerDAO();
            ArrayList<Customer> custlist = d.searchCustomerByName("");
            if(custlist != null && !custlist.isEmpty()) {
                for (Customer c : custlist) {
        %>
        <p><%= c.toString() %></p>
        <%
                }
            }else{
        %>
        <p>There are no customers</p>
        <%
            }
        %>
    </body>
</html>
