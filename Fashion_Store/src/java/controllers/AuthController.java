/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import account.AccountDAO;
import account.AccountDTO;
import category.CategoryDAO;
import category.CategoryDTO;
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
public class AuthController extends HttpServlet {

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
            String action = request.getParameter("action");
            
            if (action.equals("logout")) {
                AccountDAO accountDAO = new AccountDAO();
                accountDAO.logout(request);
                response.sendRedirect("home");
            } else if (action.equals("login")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
               
                if (username == null || password == null) {
                    out.println("Please input username and password");
                } else {
                    AccountDAO accountDAO = new AccountDAO();
                    AccountDTO account = accountDAO.login(username, password);
                    if(account == null) {
                            
                            request.setAttribute("error", "Wrong username or password");
                            request.getRequestDispatcher("login.jsp").forward(request, response);
                        }
                    if (account.getStatus() != 1) {
                        response.sendRedirect("Error.jsp");
                    } else {
                        String indexPage = request.getParameter("index");
                        if (indexPage == null) {
                            indexPage = "1";
                        }
                        int index = Integer.parseInt(indexPage);
                        ProductDAO productDAO = new ProductDAO();
                        CategoryDAO categoryDAO = new CategoryDAO();
                        List<ProductDTO> listProduct = productDAO.listProduct();
                        List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                        int count = productDAO.getTotalProduct();
                        int endPage = count / 6;
                        if (count % 6 != 0) {
                            endPage++;
                        }
                        List<ProductDTO> list = productDAO.pagingProduct(index);

                        request.setAttribute("endP", endPage);
                        request.setAttribute("data", listProduct);
                        request.setAttribute("listCategory", listCategory);
                        request.setAttribute("listProduct", list);
                        request.setAttribute("tag", index);

                        if (account != null) {
                            HttpSession session = request.getSession(true);
                            session.setAttribute("account", account);
                            request.setAttribute("listProduct", list);
                            request.setAttribute("endP", endPage);
                            request.setAttribute("data", listProduct);
                            request.setAttribute("listCategory", listCategory);
                            request.setAttribute("tag", index);
                            request.getRequestDispatcher("Home.jsp").forward(request, response);
                        } 
                    }
                }
            } else if (action.equals("register")) {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String repassword = request.getParameter("repassword");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String phoneNumber = request.getParameter("phoneNumber");
                String fullName = request.getParameter("fullName");

                AccountDAO accountDAO = new AccountDAO();
                List<AccountDTO> listAcc = accountDAO.getAllAccount();

                // Check if username or email already exists
                boolean usernameExists = listAcc.stream().anyMatch(acc -> acc.getUsername().equals(username));
                boolean emailExists = listAcc.stream().anyMatch(acc -> acc.getEmail().equals(email));

                if (usernameExists) {
                    request.setAttribute("error", "Username already exists");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (emailExists) {
                    request.setAttribute("error", "Email already exists");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (!password.equals(repassword)) {
                    request.setAttribute("error", "Repassword not match with password");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
                    // Register the new account
                    accountDAO.register(username, password, email, address, phoneNumber, fullName);
                    request.setAttribute("success", "Regiser success! Now you can login!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
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
