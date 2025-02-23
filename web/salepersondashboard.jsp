<%-- 
    Document   : salepersondashboard
    Created on : Feb 18, 2025, 11:31:47 PM
    Author     : ASUS
--%>

<%@page import="model.SalePerson"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!--salepersondashboard-->
        <%
            HttpSession s = request.getSession();
            SalePerson sp = (SalePerson)s.getAttribute("sale");
            if(sp != null) {
        %>
                <h1>Welcome to sale person dashboard</h1>
                <h3>Function for customer</h3>  
                <div><a href='MainServlet?action=createCust'>Create new customer</a></div>
                <div><a href='MainServlet?action=searchCust'>Search customer by name</a></div>
                <div><a href='MainServlet?action=viewCust'>View all customers</a></div>
                <div><a href='MainServlet?action=updateCust'>Update customer</a></div>
                <div><a href='MainServlet?action=deleteCust'>Delete customer</a></div>
                <form>
                    <div><input type="submit" name="action" value="logout"></div>
                </form>
        <%
            }else {
                out.print("You are not valid");
            }
        %>
    </body>
</html>
