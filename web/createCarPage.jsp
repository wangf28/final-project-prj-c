<%-- 
    Document   : createCarPage
    Created on : Feb 24, 2025, 12:16:35 PM
    Author     : ASUS
--%>

<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create car page</h1>
        <form action="MainServlet">
            <div>
                <label>Serial Number: </label>
                <input type="text" name="serialNum" placeholder="enter serial number">
            </div>
            <div>
                <label>Model: </label>
                <input type="text" name="model" placeholder="enter model">
            </div>
            <div>
                <label>Color: </label>
                <input type="text" name="colour" placeholder="enter color">
            </div>
            <div>
                <label>Year: </label>
                <select name="year">
                    <option value="0">none</option>
                    <%
                    LocalDate d = LocalDate.now();       
                    for (int i = d.getYear(); i >= 1000; i--) {
                    %>
                    <option value="<%= i %>"><%= i %></option>
                    <%
                    }
                    %>
                </select>
            </div>
            <div><input type="submit" value="create"></div>
            <input type="hidden" name="action" value="createCarServ">
        </form>
    </body>
</html>
