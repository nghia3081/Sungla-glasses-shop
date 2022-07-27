/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.CartDAO;
import DAO.ProductOrderDAO;
import DAO.StatusOrderDAO;
import entity.Cart;
import entity.ProductOrder;
import entity.StatusOrder;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        request.setCharacterEncoding("UTF-8");
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("login");
        } else {
            User u = ((User) request.getSession().getAttribute("user"));
            List<ProductOrder> productOrder;
            if (u.isIsAdmin()) {
                productOrder = new ProductOrderDAO().getAllProduct();
            } else {
                int uid = u.getUid();
                productOrder = new ProductOrderDAO().getAllProduct(uid);
            }

            List<StatusOrder> statusList = new StatusOrderDAO().getAllStatusOrder();
            Collections.reverse(productOrder);
            Collections.reverse(statusList);
            request.setAttribute("listProductOrder", productOrder);
            request.setAttribute("statusList", statusList);
            request.setAttribute("mpage", 4);

            request.getRequestDispatcher("order.jsp").forward(request, response);
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
        String toDo = request.getParameter("submit");
        if (toDo == null || !toDo.equals("Order")) {
            int pid = Integer.parseInt(request.getParameter("pid"));
            int uid = ((User) request.getSession().getAttribute("user")).getUid();

            double pprice = Double.parseDouble(request.getParameter("pprice"));
            int pquantity = Integer.parseInt(request.getParameter("pquantity"));
            int ptotal;

            Cart findProdInCart = new CartDAO().getProductInCartByUidAndPid(uid, pid);
            findProdInCart.setPprice(pprice);
            findProdInCart.setPquantity(findProdInCart.getPquantity() + pquantity);
            findProdInCart.setPprice(pprice * findProdInCart.getPquantity());
            new CartDAO().updateProductInCart(findProdInCart.getPprice(), findProdInCart.getPquantity(), uid, pid);

            response.sendRedirect("shopping");
        } else {
            String[] pid = request.getParameterValues("pid");
            int uid = ((User) request.getSession().getAttribute("user")).getUid();
            String uname = request.getParameter("uname");
            String uemail = request.getParameter("uemail");
            String uphone = request.getParameter("uphone");
            String opay = request.getParameter("opay");
            String uaddress = request.getParameter("uaddress");
            Calendar c = Calendar.getInstance();
            String timeAdd = c.get(Calendar.YEAR) + "-" + c.get(Calendar.MONTH) + "-" + c.get(Calendar.DAY_OF_MONTH) + " " + c.get(Calendar.HOUR_OF_DAY) + ":" + c.get(Calendar.MINUTE) + ":" + c.get(Calendar.SECOND);

            for (String string : pid) {
                Cart toOrder = new CartDAO().getProductInCartByUidAndPid(uid, Integer.parseInt(string));
                int pquantity = Integer.parseInt(request.getParameter("pquantity" + string));
                String pdes = toOrder.getPimg();
                ProductOrder pOrder = new ProductOrder();
                pOrder.setOid(1);
                pOrder.setOpay(opay);
                pOrder.setPdes(pdes);
                pOrder.setPname(toOrder.getPname());
                pOrder.setPprice(toOrder.getPprice());
                pOrder.setPquantity(pquantity);
                pOrder.setUaddress(uaddress);
                pOrder.setUemail(uemail);
                pOrder.setUid(uid);
                pOrder.setUname(uname);
                pOrder.setUphone(uphone);
                pOrder.setOrderTime(timeAdd);
                new ProductOrderDAO().insertOrder(pOrder);
                new CartDAO().removeInCart(toOrder.getPid(), uid);
                int oid = new ProductOrderDAO().getOid();
                new StatusOrderDAO().insertStatus(new StatusOrder(1, oid, "Verifying your information", "Verifying your infomation", timeAdd));
            }
            request.setAttribute("mess", "Order successfully!! View your order in <a href='order'>Order page</a>");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
