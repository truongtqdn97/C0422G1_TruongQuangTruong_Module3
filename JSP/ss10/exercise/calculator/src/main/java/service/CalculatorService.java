package service;

public class CalculatorService {
    public static double calculate(double firstNumber, double secondNumber, String operator){
        switch (operator){
            case "+":
                return firstNumber + secondNumber;
            case "-":
                return firstNumber - secondNumber;
            case "*":
                return firstNumber * secondNumber;
            case "/":
                if (secondNumber != 0)
                return firstNumber/secondNumber;
                else throw new ArithmeticException("The divisor is not equal to 0");
            default:
                throw new ArithmeticException("Wrong Operator!");
        }
    }
}
