/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import category.CategoryDAO;
import category.CategoryDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import product.ProductDAO;
import product.ProductDTO;

/**
 *
 * @author tinit
 */
public class ProductController extends HttpServlet {

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

            try {
                if (action == null || action.equals("list")) {
                    ProductDAO productDAO = new ProductDAO();
                    CategoryDAO categoryDAO = new CategoryDAO();
                    List<ProductDTO> listProduct = productDAO.listProduct();
                    List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                    request.setAttribute("listProduct", listProduct);
                    request.setAttribute("listCategory", listCategory);
                    request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
                } else if (action.equals("edit")) {
                    Long id = Long.parseLong(request.getParameter("id"));

                    ProductDAO productDAO = new ProductDAO();
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ProductDTO product = productDAO.getProductById(id);
                    List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                    request.setAttribute("productEdit", product);
                    request.setAttribute("listCategory", listCategory);
                    request.getRequestDispatcher("EditProducts.jsp").forward(request, response);

                } else if (action.equals("update")) {
                    Long id = Long.parseLong(request.getParameter("id"));
                    String productName = request.getParameter("productName");
                    float price = Float.parseFloat(request.getParameter("price"));
                    String size = request.getParameter("size");
                    String img = request.getParameter("img");
                    String description = request.getParameter("description");
                    Long categoryID = Long.parseLong(request.getParameter("categoryId"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));

                    if (id != null) {
                        ProductDAO productDAO = new ProductDAO();
                        ProductDTO product = new ProductDTO(id, productName, price, quantity, description, categoryID, true, img, size);
                        productDAO.update(product);
                        List<ProductDTO> listProduct = productDAO.listProduct();
                        CategoryDAO categoryDAO = new CategoryDAO();
                        List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listCategory", listCategory);
                        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
                    }
                } else if (action.equals("delete")) {
                    Long id = Long.parseLong(request.getParameter("id"));
                    ProductDAO productDAO = new ProductDAO();
                    productDAO.delete(id);
                    List<ProductDTO> listProduct = productDAO.listProduct();
                    CategoryDAO categoryDAO = new CategoryDAO();
                    List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                    request.setAttribute("listProduct", listProduct);
                    request.setAttribute("listCategory", listCategory);
                    request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
                } else if (action.equals("create")) {
                    String productName = request.getParameter("productName");
                    float price = Float.parseFloat(request.getParameter("price"));
                    String size = request.getParameter("size");
                    String img = request.getParameter("img");
                    String description = request.getParameter("description");
                    Long categoryID = Long.parseLong(request.getParameter("categoryId"));
                    boolean status = Boolean.parseBoolean(request.getParameter("status"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    
                 

                    ProductDAO productDAO = new ProductDAO();
                    CategoryDAO categoryDAO = new CategoryDAO();
                    ProductDTO product = new ProductDTO(productName, price, quantity, description, categoryID, status, img, size);
                    boolean check = productDAO.insert(product);
                    if (check == true) {
                        List<ProductDTO> listProduct = productDAO.listProduct();
                        List<CategoryDTO> listCategory = categoryDAO.getAllCategory();
                        request.setAttribute("listProduct", listProduct);
                        request.setAttribute("listCategory", listCategory);
                        request.getRequestDispatcher("ManagerProduct.jsp").forward(request, response);
                    }

                } 
            } catch (Exception e) {
                System.out.println("Error" + e.getMessage());
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
