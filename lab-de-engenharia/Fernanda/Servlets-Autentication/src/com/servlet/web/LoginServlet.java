package com.servlet.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.servlet.LoginBean;
import com.servlet.db.LoginDao;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

    	response.setContentType("text/html;charset=UTF-8");
    	
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        try {
            if (loginDao.validate(username, password)) {
            	RequestDispatcher rs = request.getRequestDispatcher("welcome.jsp");
                rs.forward(request, response);
                //HttpSession session = request.getSession();
                // session.setAttribute("username",username);
                //response.sendRedirect("welcome.jsp");
            } else {
                HttpSession session = request.getSession();
                //session.setAttribute("user", username);
                response.sendRedirect("autentication.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
