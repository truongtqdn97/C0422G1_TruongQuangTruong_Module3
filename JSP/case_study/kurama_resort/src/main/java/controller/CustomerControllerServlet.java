package controller;

import model.Customer;
import model.CustomerType;
import service.customer.ICustomerService;
import service.customer.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "CustomerControllerServlet", urlPatterns = {"/customer"})
public class CustomerControllerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "updateCustomer":
                showUpdateCustomerForm(request, response);
                break;
            default:
                displayCustomerList(request, response);
                break;
        }
    }




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createNewCustomer(request, response);
                break;
            case "updateCustomer":
                updateCustomer(request, response);
                break;
            case "removeCustomer":
                removeCustomer(request, response);
                break;
            case "search":
                searchCustomerByName(request, response);
                break;
        }
    }

    private void searchCustomerByName(HttpServletRequest request, HttpServletResponse response) {
        String customerName = request.getParameter("searchName");
        List<Customer> customerList = customerService.searchByName(customerName);
        List<CustomerType> customerTypeList = customerService.selectCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int pId = Integer.parseInt(request.getParameter("pId"));
        String name = request.getParameter("name");
        LocalDate birthday = LocalDate.parse(request.getParameter("birthday"));
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerType = Integer.parseInt(request.getParameter("customerType"));
        Customer customer = new Customer(pId, name, birthday, gender, idCard, phoneNumber, email, customerType, address);
        boolean check = customerService.updateCustomer(customer);
        String message = "";
        if (check){
            message = "Update successfully!";
        }else message = "Can't update!";
        List<Customer> customerList = customerService.selectAllCustomer();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("message", message);
        request.setAttribute("customerList", customerList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateCustomerForm(HttpServletRequest request, HttpServletResponse response) {
        int pId = Integer.parseInt(request.getParameter("pId"));
        List<CustomerType> customerTypeList = customerService.selectCustomerType();
        Customer customer = customerService.selectCustomer(pId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/edit.jsp");
        request.setAttribute("customer", customer);
        request.setAttribute("customerTypeList", customerTypeList);
//        request.setAttribute("pId", pId);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void createNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        LocalDate birthday = LocalDate.parse(request.getParameter("birthday"));
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerType = Integer.parseInt(request.getParameter("customerType"));
        List<Customer> customerList = customerService.selectCustomerIncludeDeleted();
        int pId = customerList.get(customerList.size() - 1).getpId() + 1;
        Customer customer = new Customer(pId, name, birthday, gender, idCard, phoneNumber, email, customerType, address);
        boolean check = customerService.insertCustomer(customer);
        String message = "";
        if (check){
            message = "Create new Customer successfully!";
        }else message = "Can't create new Customer!";
        customerList = customerService.selectAllCustomer();
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/list.jsp");

        request.setAttribute("message", message);
        request.setAttribute("customerList", customerList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("view/customer/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void displayCustomerList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.selectAllCustomer();
        List<CustomerType> customerTypeList = customerService.selectCustomerType();
        request.setAttribute("customerList", customerList);
        request.setAttribute("customerTypeList", customerTypeList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");

        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void removeCustomer(HttpServletRequest request, HttpServletResponse response) {
        int pId = Integer.parseInt(request.getParameter("removeCustomerId"));
        String message = "";
        boolean check = customerService.removeCustomer(pId);
        if (check) {
            message = "Delete completely!";
        } else message = "Can't delete!";
        List<Customer> customerList = customerService.selectAllCustomer();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("message", message);
        request.setAttribute("customerList", customerList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
