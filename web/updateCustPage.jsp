<%-- 
    Document   : updateCustPage
    Created on : Feb 22, 2025, 6:19:05 PM
    Author     : ASUS
--%>

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
            if(sp == null) request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
        %>
        <%
            CustomerDAO d = new CustomerDAO();
            ArrayList<Customer> custList = d.searchCustomerByName("");
        %>
        <h1>Update customer jsp</h1>
        <form action="MainServlet">
            <p>Pick customer who you want to update</p>
            <select name="custID">
                <%
                    for (Customer c : custList) {
                %>
                <option value="<%= c.getCustID() %>"><%= c.toString() %></option>    
                <%
                    }
                %>
            </select>
            
            <p>*If you do not want to update, you make it blank</p>
            <div><input type="text" name="nCustName" placeholder="enter new cust name"></div>
            <div><input type="text" name="nCustPhone" placeholder="enter new cust phone" pattern="[0-9]+"></div>
            <div><input type="text" name="nCustSex" placeholder="enter new cust sex"></div>
            <div><input type="text" name="nCustAddress" placeholder="enter new cust address"></div>
            <div><input type="submit" value="update" name="action"></div>
        </form>
        <a href="MainServlet?action=salePersonDashBoard">Back to sale person dashboard</a>
        
            
            <%
                if(request.getAttribute("result") != null) {
            %>
            <h5><%= request.getAttribute("result") %></h5>
            <%
                    if(request.getAttribute("updatedCust") != null) {
            %>
            <h5>Customer after updating</h5>
            <h5><%= request.getAttribute("updatedCust") %></h5>
            <%
                    }
                }
            %>
    </body>
</html>
