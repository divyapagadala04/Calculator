package com.calculate.servlet;

public class SimpleCalculator {
	package com.calculate.servlet;

	import jakarta.servlet.ServletException;
	import jakarta.servlet.annotation.WebServlet;
	import jakarta.servlet.http.HttpServlet;
	import jakarta.servlet.http.HttpServletRequest;
	import jakarta.servlet.http.HttpServletResponse;

	import java.io.IOException;

	/**
	 * Servlet implementation class Calculateservlet
	 */
	@WebServlet("/Calculateservlet")
	public class Calculateservlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;

	    /**
	     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	     */
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	            throws ServletException, IOException {

	        try {
	            // Logging the input data
	            String num1Str = request.getParameter("num1");
	            String num2Str = request.getParameter("num2");
	            String operation = request.getParameter("operation");

	            System.out.println("Received num1: " + num1Str);
	            System.out.println("Received num2: " + num2Str);
	            System.out.println("Received operation: " + operation);

	            // Check for missing inputs
	            if (num1Str == null || num2Str == null || operation == null || num1Str.isEmpty() || num2Str.isEmpty()) {
	                request.setAttribute("error", "Please fill in all fields.");
	                request.getRequestDispatcher("index.jsp").forward(request, response);
	                return;
	            }

	            // Parse numbers and calculate result
	            double num1 = Double.parseDouble(num1Str);
	            double num2 = Double.parseDouble(num2Str);
	            double result = 0;

	            switch (operation) {
	                case "+":
	                    result = num1 + num2;
	                    break;
	                case "-":
	                    result = num1 - num2;
	                    break;
	                case "*":
	                    result = num1 * num2;
	                    break;
	                case "/":
	                    if (num2 == 0) {
	                        request.setAttribute("error", "Cannot divide by zero!");
	                        request.getRequestDispatcher("index.jsp").forward(request, response);
	                        return;
	                    }
	                    result = num1 / num2;
	                    break;
	                default:
	                    request.setAttribute("error", "Invalid operation!");
	                    request.getRequestDispatcher("index.jsp").forward(request, response);
	                    return;
	            }

	            // Logging the calculated result
	            System.out.println("Calculated result: " + result);

	            // Set result attribute and forward to JSP
	            request.setAttribute("result", result);
	            request.getRequestDispatcher("index.jsp").forward(request, response);

	        } catch (NumberFormatException e) {
	            // Handle invalid input
	            request.setAttribute("error", "Invalid input! Enter numbers only.");
	            request.getRequestDispatcher("index.jsp").forward(request, response);
	        } catch (Exception e) {
	            // Handle any unexpected errors
	            e.printStackTrace();
	            request.setAttribute("error", "An unexpected error occurred.");
	            request.getRequestDispatcher("index.jsp").forward(request, response);
	        }
	    }
	}

}
