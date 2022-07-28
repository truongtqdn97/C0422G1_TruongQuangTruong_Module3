package servlet;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        customerList.add(new Customer("Trường", "01/01/1997", "Hà Nội", "https://cdn.pixabay.com/photo/2016/11/05/08/42/facebook-1799690_960_720.png"));
        customerList.add(new Customer("Hùng", "01/01/1997", "Hà Nội", "https://cdn.pixabay.com/photo/2016/11/05/08/42/facebook-1799690_960_720.png"));
        customerList.add(new Customer("Trung", "01/01/1997", "Hà Nội", "https://cdn.pixabay.com/photo/2016/11/05/08/42/facebook-1799690_960_720.png"));
        customerList.add(new Customer("Phú", "01/01/1997", "Hà Nội", "https://cdn.pixabay.com/photo/2016/11/05/08/42/facebook-1799690_960_720.png"));
        customerList.add(new Customer("Thạnh", "01/01/1997", "Hà Nội", "https://cdn.pixabay.com/photo/2016/11/05/08/42/facebook-1799690_960_720.png"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/CustomerList.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
