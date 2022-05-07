package net.javaguides.registration.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.registration.dao.CustomerDao;
import net.javaguides.registration.model.Customer;

@WebServlet("/register")
public class CustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CustomerDao customerDao;

    public void init() {
    	customerDao = new CustomerDao();
    }
    
    protected void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
    	response.getWriter().append("Served at:").append(request.getContextPath());
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customerregister.jsp");
    	dispatcher.forward(request,response);
    }
    
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");

        Customer customer = new Customer();
        customer.setFirstName(firstName);
        customer.setLastName(lastName);
        customer.setUsername(username);
        customer.setPassword(password);
        customer.setContact(contact);
        customer.setAddress(address);

        try {
        	customerDao.registerEmployee(customer);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/customerdetails.jsp");
    	dispatcher.forward(request,response);
    }
}