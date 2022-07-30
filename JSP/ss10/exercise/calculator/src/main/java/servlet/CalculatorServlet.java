package servlet;

import service.CalculatorService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", urlPatterns = "/Calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double number1 = Double.parseDouble(request.getParameter("number1"));
        double number2 = Double.parseDouble(request.getParameter("number2"));
        String operator = request.getParameter("operator");
        double result = 0;
        String error=null;
        try {
//            result = String.valueOf((CalculatorService.calculate(number1, number2, operator)));
            result = (CalculatorService.calculate(number1, number2, operator));
        }catch (ArithmeticException e){
            error = e.getMessage();
        }

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
        if (error != null){
            request.setAttribute("error", error);
        }else {
            request.setAttribute("result", result);
        }
        requestDispatcher.forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
