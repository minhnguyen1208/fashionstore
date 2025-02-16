/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import cart.Cart;
import item.Item;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author tinit
 */
public class AddToCartController extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            String action = request.getParameter("action");
            Cart cart = null;
            Object o = session.getAttribute("cart");
            if (o != null) {
                cart = (Cart) o;
            } else {
                cart = new Cart();
            }

            String itemNumber = request.getParameter("number").trim();
            String itemId = request.getParameter("id");
            Long id;
            int num;

            try {
                if (action.equals("increase")) {
                    id = Long.parseLong(itemId);
                    num = Integer.parseInt(itemNumber);

                    if ((num == -1) && (cart.getQuantityById(id) <= 1)) {
                        cart.removeItem(id);
                    } else {
                        ProductDAO productDAO = new ProductDAO();
                        ProductDTO product = productDAO.getProductById(id);
                        double price = product.getPrice();
                        Item t = new Item(product, num, price, product.getImg());
                        cart.addItem(t);
                        List<Item> list = cart.getItems();
                        session.setAttribute("cart", cart);
                        session.setAttribute("size", list.size());

                        double totalPrice = 0.0;
                        for (Item item : list) {
                            totalPrice += item.getPrice() * item.getQuantity();
                        }
                        session.setAttribute("totalPrice", totalPrice);
                        request.getRequestDispatcher("Cart.jsp").forward(request, response);
                    }
                } else if (action.equals("descrease")) {
                    id = Long.parseLong(itemId);
                    num = Integer.parseInt(itemNumber);
                    cart.decreaseQuantityById(id, num);
                    List<Item> list = cart.getItems();
                    session.setAttribute("cart", cart);
                    session.setAttribute("size", list.size());

                    double totalPrice = 0.0;
                    for (Item item : list) {
                        totalPrice += item.getPrice() * item.getQuantity();
                    }
                    session.setAttribute("totalPrice", totalPrice);
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                } else if (action.equals("delete")) {
                    id = Long.parseLong(itemId);
                    num = Integer.parseInt(itemNumber);
                    cart.removeItem(id);
                    
                    List<Item> list = cart.getItems();
                    session.setAttribute("cart", cart);
                    session.setAttribute("size", list.size());

                    double totalPrice = 0.0;
                    for (Item item : list) {
                        totalPrice += item.getPrice() * item.getQuantity();
                    }
                    session.setAttribute("totalPrice", totalPrice);
                    request.getRequestDispatcher("Cart.jsp").forward(request, response);
                }
            } catch (Exception e) {
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
