package net.javaguides.login.controller;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.javaguides.login.model.LoginModel;
import net.javaguides.login.database.LoginDao;

@WebServlet("/login")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1;
    private LoginDao loginDao;

    public void init() {
        loginDao = new LoginDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        LoginModel loginModel = new LoginModel();
        loginModel.setUsername(username);
        loginModel.setPassword(password);

        try {
            if (loginDao.validate(loginModel)) {
            	
            	response.sendRedirect("/login-mvc-sql/loginsuccess.jsp");
            } else {
                HttpSession session = request.getSession();
//                session.setAttribute("user", username);
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

