/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;

/**
 *
 * @author ASUS
 */
public class CreateNewCustomerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.print("<h2>hello</h2>");
            request.setCharacterEncoding("UTF-8");
            int custID = Integer.parseInt(request.getParameter("custID"));
            String custName = request.getParameter("custName");
            //nếu người dùng k nhập phone thì phone sẽ nhận dc chuỗi rỗng ""
            String custPhoneS = request.getParameter("custPhone");
            double custPhone = 0;
            if(!custPhoneS.isEmpty()) {
                custPhone = Double.parseDouble(custPhoneS);
            }
            //nếu người dùng k nhập sex thì sex sẽ nhận dc chuỗi rỗng ""
            String custSex = request.getParameter("custSex");
            //nếu người dùng k nhập address thì address sẽ nhận dc chuỗi rỗng ""
            String custAddress = request.getParameter("custAddress");
            
            Customer c = new Customer(custID, custName, custPhone, custSex, custAddress);
            out.print(c.toString());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
