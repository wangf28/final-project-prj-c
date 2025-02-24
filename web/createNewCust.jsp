<%-- 
    Document   : createNewCust
    Created on : Feb 19, 2025, 5:45:39 PM
    Author     : ASUS
--%>

<%@page import="model.Mechanic"%>
<%@page import="model.SalePerson"%>
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
            if(sp == null) request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
        %>
        <h1>create cust jsp</h1>
        <form action="MainServlet" accept-charset="UTF-8">
            <div><input type="text" name="custID" placeholder="enter cust id" pattern="[0-9]+" required>*</div>
            <div><input type="text" name="custName" placeholder="enter cust name" required>*</div>
            <div><input type="text" name="custPhone" placeholder="enter cust phone" pattern="[0-9]+"></div>
            <div><input type="text" name="custSex" placeholder="enter cust sex"></div>
            <div><input type="text" name="custAddress" placeholder="enter cust address"></div>
            <div><input type="submit" value="create"></div>
            <input type="hidden" value="createCustServ" name="action">
        </form>
        
        <a href="MainServlet?action=salePersonDashBoard">Back to sale person dashboard</a>
        
        <%
            if(request.getAttribute("result") != null) {
        %>
        <h5><%= request.getAttribute("result") %></h5>
        <%
            }
        %>
    </body>
</html>
