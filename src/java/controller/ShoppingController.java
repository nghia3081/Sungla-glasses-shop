/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Category;
import entity.Product;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ShoppingController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        List<Category> ListCategory = new CategoryDAO().getAllCategory();
        List<Product> ListProduct = new ArrayList<>();

        int page, numberOfPage;
        int prodPerPage = 6;
        if (request.getParameter("page") == null) {
            page = 1;
        } else {
            page = Integer.parseInt(request.getParameter("page"));

        }

        int cateId;
        if (request.getParameter("cateId") == null || request.getParameter("cateId").equals("0")) {
            cateId = 0;
            ListProduct = new ProductDAO().getAllProduct();
        } else {
            cateId = Integer.parseInt(request.getParameter("cateId"));
            ListProduct = new ProductDAO().getAllProductByCateId(cateId);
        }

        String search;

        if (request.getParameter("search") == null || request.getParameter("search").equals("")) {
            search = "";

        } else {
            search = request.getParameter("search");
            List<Product> allProduct = new ArrayList();
            for (Product product : ListProduct) {
                allProduct.add(product);
            }
            ListProduct.clear();
            for (Product product : allProduct) {

                if (product.getName().toLowerCase().trim().contains(search.toLowerCase().trim()) || Double.toString(product.getPrice()).contains(search)) {
                    ListProduct.add(product);
                }
            }

        }
        if (request.getSession().getAttribute("user") == null || !((User) request.getSession().getAttribute("user")).isIsAdmin()) {
            numberOfPage = ListProduct.size() % prodPerPage == 0 ? ListProduct.size() / prodPerPage : ListProduct.size() / prodPerPage + 1;
        } else {
            numberOfPage = (ListProduct.size() + 1) % prodPerPage == 0 ? (ListProduct.size() + 1) / prodPerPage : (ListProduct.size() + 1) / prodPerPage + 1;
        }
        int prodStart = prodPerPage * (page - 1);
        request.setAttribute("search", search);
        request.setAttribute("numberOfPage", numberOfPage);
        request.setAttribute("page", page);
        request.setAttribute("prodStart", prodStart);
        request.setAttribute("prodPerPage", prodPerPage);
        request.setAttribute("cateId", cateId);
        request.setAttribute("listP", ListProduct);
        request.setAttribute("listCate", ListCategory);
        request.setAttribute("mpage", 2);
        request.getRequestDispatcher("glasses.jsp").forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
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
