/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class ForgetPassword extends HttpServlet {

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
            out.println("<title>Servlet ForgetPassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgetPassword at " + request.getContextPath() + "</h1>");
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
        response.setCharacterEncoding("UTF-8");
        request.setAttribute("page", 1);
        request.getRequestDispatcher("forget.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    String name, subject, email;

    int forgotCode;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String toDo = request.getParameter("submit");
        System.out.println(toDo);
        if (toDo.equals("Forget")) {
            forgotCode = (int) Math.floor(((Math.random() * 899999) + 100000));
            email = request.getParameter("uemail");
            if (!(new UserDAO().getEmail(email))) {
                request.setAttribute("mess", "Not found this email. Please check email");
                request.setAttribute("page", 1);
                request.getRequestDispatcher("forget.jsp").forward(request, response);
            } else {
                subject = "Re-take password for " + email;

                final String username = "datkmhe150913@fpt.edu.vn";//your email id
                final String password = "Kieuminhdat11";// your password
                Properties props = new Properties();
                props.put("mail.smtp.auth", true);
                props.put("mail.smtp.starttls.enable", true);
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
                props.put("mail.smtp.ssl.trust", "*");
                Session session = Session.getInstance(props,
                        new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
                try {
                    Message message = new MimeMessage(session);
                    message.setFrom(new InternetAddress(email));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
                    MimeBodyPart textPart = new MimeBodyPart();
                    Multipart multipart = new MimeMultipart();
                    String final_Text = "You are is requiring retaking password.\n\n\n\nEnter " + forgotCode + " to restore your password.";
                    textPart.setText(final_Text);
                    message.setSubject(subject);
                    multipart.addBodyPart(textPart);
                    message.setContent(multipart);
                    //out.println("Sending");
                    Transport.send(message);

                } catch (Exception e) {
                    System.out.println(e);
                }
                System.out.println(forgotCode);
                request.setAttribute("mess", "Validation Code has been sent to your email!");
                request.setAttribute("page", 2);
                request.getRequestDispatcher("forget.jsp").forward(request, response);
            }

        } else if (toDo.equals("Verify")) {
            System.out.println(forgotCode);
            int verifycode = Integer.parseInt(request.getParameter("vcode"));
            if (verifycode == forgotCode) {
                request.setAttribute("page", 3);
                request.getRequestDispatcher("forget.jsp").forward(request, response);
            } else {
                request.setAttribute("page", 2);
                request.setAttribute("mess", "Invalid Validation Code!!");
                request.getRequestDispatcher("forget.jsp").forward(request, response);
            }

        } else if (toDo.equals("Change")) {
            String newpass = request.getParameter("unewpass");

            new UserDAO().updatePass(email, newpass);
            request.setAttribute("mess", "Create new password successful!!");
            request.setAttribute("page", 1);
            request.getRequestDispatcher("forget.jsp").forward(request, response);
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
