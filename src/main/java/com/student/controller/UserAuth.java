package com.student.controller;

import java.io.*;
import java.util.List;

import com.student.domain.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
@WebServlet( "/ValidUser")
public class UserAuth extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmPassword");

            if (firstName == null || lastName.trim().isEmpty()) {
                response.getWriter().write("Please enter Both First address");
                return;
            }
            else if (password == null || password.trim().isEmpty() || password.length() < 6) {
                response.getWriter().write("Please enter a valid password with atleast 8 characters");
                return;
            } else if (password.length() != confirmPassword.length()) {
                response.getWriter().write("Password Not Matching");
                return;
            }
            else{
                request.setAttribute("message", "Registration successful!");

                request.getRequestDispatcher("HandleSignup.jsp").forward(request, response);
            }


        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }



    public void destroy() {
    }
}