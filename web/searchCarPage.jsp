<%-- 
    Document   : searchCarPage
    Created on : Feb 23, 2025, 4:49:01 PM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Car"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Search car page</h1>
        
        <form action="MainServlet" accept-charset="UTF-8">
            <div>
                <label>Serial number: </label>
                <input type="text" name="serialNum" placeholder="enter serial number">
            </div>
            <div>
                <label>Model: </label>
                <input type="text" name="model" placeholder="enter model">
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
            <div><input type="submit" value="search"></div>    
            <input type="hidden" name="action" value="seachCarServ">
        </form>
                
        <%
            if(request.getAttribute("result") != null) {
                ArrayList<Car> cList = (ArrayList<Car>)request.getAttribute("result");
                if(!cList.isEmpty()) {
                    for (Car c : cList) {
        %>
        <div><%= c.toString() %></div>
        <%
                    }
                }else {
        %>
        <h5>Not found</h5>
        <%
                }
            }
        %>        
        
    </body>
</html>
