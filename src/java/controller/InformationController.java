/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class InformationController extends HttpServlet {

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
            out.println("<title>Servlet InformationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InformationController at " + request.getContextPath() + "</h1>");
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

            if (((User)request.getSession().getAttribute("user")).isIsAdmin()) {
                List<User> listUser = new UserDAO().getAllUser();
                request.setAttribute("listUser", listUser);
            } else {
                User user = ((User) request.getSession().getAttribute("user"));
                if (request.getParameter("page") == null) {
                    request.setAttribute("page", 1);
                } else {
                    request.setAttribute("page", request.getParameter("page"));

                }
                request.setAttribute("user", user);

            }

            request.setAttribute("mpage", 5);

            request.getRequestDispatcher("information.jsp").forward(request, response);
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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        String toDo = request.getParameter("submit");
        HttpSession s = request.getSession();
        User user = (User) s.getAttribute("user");
        String mess;
        if (toDo.equals("Update Information")) {
            String uname = request.getParameter("uname");
            String uaddress = request.getParameter("uaddress");
            String uemail = request.getParameter("uemail");
            String pass = request.getParameter("newpass");
            if (pass.equals(user.getUpass())) {

                new UserDAO().updateInformation(new User(user.getUid(), uname, uemail, pass, uaddress, false));

                s.removeAttribute("user");
                s.setAttribute("user", new UserDAO().getUser(uemail, pass));
                doGet(request, response);
            } else {
                mess = "Wrong password!!!";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("information.jsp").forward(request, response);
            }
        } else if (toDo.equals("Change Password")) {

            String oldPass = request.getParameter("oldpass");
            String newPass = request.getParameter("newpass");
            if (oldPass.equals(user.getUpass())) {
                new UserDAO().updatePass(user.getUemail(), newPass);
                s.removeAttribute("user");
                s.setAttribute("user", new UserDAO().getUser(user.getUemail(), newPass));
                doGet(request, response);

            } else {
                mess = "Wrong old password!!";
                request.setAttribute("mess", mess);
                request.getRequestDispatcher("information.jsp").forward(request, response);
            }

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
