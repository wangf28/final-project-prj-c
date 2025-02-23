<%-- 
    Document   : deleteCustPage
    Created on : Feb 23, 2025, 11:40:37 AM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
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
            CustomerDAO d = new CustomerDAO();
            ArrayList<Customer> custList = d.searchCustomerByName("");
        %>
        <h1>delete cust page</h1>
        <form action="MainServlet">
            <label>Pick customer you want to delete:</label>
            <select name="custID">
                <%
                    for (Customer c : custList) {
                %>
                <option value="<%= c.getCustID() %>"><%= c.toString() %></option>    
                <%
                    }
                %>
            </select>
            <input type="submit" value="delete" name="action">
        </form>
            
        <%
            if(request.getAttribute("result")!=null) {
        %>
        <h5><%= request.getAttribute("result") %></h5>
        <%
            }
        %>
    </body>
</html>
