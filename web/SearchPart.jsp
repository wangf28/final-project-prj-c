<%-- 
    Document   : SearchPart
    Created on : Mar 6, 2025, 6:14:57 PM
    Author     : Admin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.SalePerson"%>
<%@page import="model.Part"%>
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
        <h1>Search part</h1>
        <p><a href="MainServlet?action=salePersonDashBoard">BACK</a></p>
        
        <div>
            <form action="MainServlet">
                <input type="hidden" name="action" value="searchPartByName"/>
                <input type="text" name="partName" placeholder="Enter part name"/>
                <input type="submit" value="Find"/>
            </form>
        </div>
        <!--in part o day-->
        <%
            ArrayList<Part> list =(ArrayList<Part>) request.getAttribute("partlist");
            if(list != null){
                if(list.size() > 0){
        %>
        <table border="1">
            <tr>
                <th>Part ID</th>
                <th>Part Name</th>
                <th>Purchase Price</th>
                <th>Retail Price</th>
            </tr>
            <%
                for (Part p : list) {
            %>
            <tr>
                <td><%= p.getPartId() %></td>
                <td><%= p.getPartName() %></td>
                <td><%= p.getPurchasePrice() %></td>
                <td><%= p.getRetailPrice() %></td>
                <td><a href="#">Delete</a></td>
                <td><a href="#">Update</a></td>
            </tr>
            
            <%
                    }
            %>
            
        </table>
        
        <%
                }
            }
        %>
        
        <%
            }else{
                request.getRequestDispatcher("MainServlet?action=home").forward(request, response);
            }
        %>
    </body>
</html>
