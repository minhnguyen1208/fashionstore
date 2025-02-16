/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import account.AccountDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import order.OrderDAO;
import order.OrderDTO;
import orderDetails.orderDetailsDAO;
import orderDetails.orderDetailsDTO;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author tinit
 */
public class OrderController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            HttpSession session = request.getSession(true);

            if (action == null || action.equals("list")) {
                OrderDAO orderDAO = new OrderDAO();
                if (session != null) {
                    AccountDTO account = (AccountDTO) session.getAttribute("account");
                    int accountId = account.getId();
                    List<OrderDTO> list = orderDAO.getListOrder(accountId);
                    request.setAttribute("listOrder", list);
                    request.getRequestDispatcher("Order.jsp").forward(request, response);
                }
            } else if (action.equals("orderDetails")) {
                orderDetailsDAO orderDetailsDAO = new orderDetailsDAO();
                OrderDAO orderDAO = new OrderDAO();
                int orderId = Integer.parseInt(request.getParameter("orderId"));
                if (orderId > 0) {
                    List<orderDetailsDTO> list = orderDetailsDAO.getListOrderDetail(orderId);
                    String status = orderDAO.getStatusOrderById(orderId);
                    String sessionOrderId = String.valueOf(orderId);
                    session.setAttribute("orderId", sessionOrderId);
                    request.setAttribute("listOrderDetails", list);
                    request.setAttribute("statusOrder", status);
                    request.getRequestDispatcher("OrderDetails.jsp").forward(request, response);
                }

            } else if (action.endsWith("getAll")) {
                OrderDAO orderDAO = new OrderDAO();
                List<OrderDTO> list = orderDAO.getAllOrder();
                request.setAttribute("listOrderAdmin", list);
                request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
            } else if (action.equals("updateStatus")) {
                OrderDAO orderDAO = new OrderDAO();
                String status = request.getParameter("status");
                Long orderId = Long.parseLong((String) session.getAttribute("orderId"));
                boolean updated = orderDAO.updateStatusOrder(status, orderId);
                if (updated == true) {
                    List<OrderDTO> list = orderDAO.getAllOrder();
                    request.setAttribute("listOrderAdmin", list);
                    request.getRequestDispatcher("ManagerOrder.jsp").forward(request, response);
                }
            }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(OrderController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
