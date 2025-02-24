<%-- 
    Document   : searchCust
    Created on : Feb 19, 2025, 5:53:00 PM
    Author     : ASUS
--%>

<%@page import="model.SalePerson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession s = request.getSession();
            SalePerson sp = (SalePerson)s.getAttribute("sale");
            if(sp != null) {
        %>

                <h1>Search cust by name</h1>
                <form action="MainServlet" accept-charset="UTF-8">
                    <div>
                        <input type="text" name="custName" placeholder="enter cust name"
                        value="<%= request.getParameter("custName") != null ? request.getParameter("custName") :"" %>"
                        >
                    </div>
                    <div><input type="submit" value="find"></div>
                    <input type="hidden" name="action" value="searchCustByName">
                </form>
                <a href="MainServlet?action=salePersonDashBoard">Back to sale person dashboard</a>
                <%

                    ArrayList<Customer> custList = (ArrayList<Customer>)request.getAttribute("custList");
                    if(custList != null) {
                        if(custList.size() > 0) {
                            for (Customer c : custList) {
                %>
                <div><%= c.toString() %></div>
                <%
                            }
                        } else {
                %>
                <div>There is no customer</div>
                <%
                        }
                    }
                %>
        
        <%
            }else {
                request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
            }
        %>
    </body>
</html>
