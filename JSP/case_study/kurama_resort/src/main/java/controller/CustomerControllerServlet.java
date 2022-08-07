package controller;

import model.Customer;
import model.CustomerType;
import service.customer.ICustomerService;
import service.customer.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerControllerServlet", urlPatterns = {"/customer"})
public class CustomerControllerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action==null){
            action = "";
        }
        switch (action){
            case "create":
                showCreateForm(request, response);
                break;
            case "update":
                break;
            default:
                displayCustomerList(request, response);
                break;
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void displayCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypeList = customerService.selectCustomerType();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
