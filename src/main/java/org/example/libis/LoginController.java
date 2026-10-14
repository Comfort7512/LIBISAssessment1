package org.example.libis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        // Display the login page
        request.getRequestDispatcher(
                "/WEB-INF/views/login.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Read the submitted credentials
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Retrieve the existing member list
        List<Member> members =
                (List<Member>) getServletContext()
                        .getAttribute("members");

        Member matchedMember = null;

        // Search for a matching member
        if (email != null && password != null) {

            for (Member member : members) {

                if (member.getEmail().equalsIgnoreCase(email)
                        && member.getPassword().equals(password)) {

                    matchedMember = member;
                    break;
                }
            }
        }

        // Handle unsuccessful login
        if (matchedMember == null) {

            request.setAttribute(
                    "error",
                    "Invalid email or password."
            );

            request.getRequestDispatcher(
                    "/WEB-INF/views/login.jsp"
            ).forward(request, response);

            return;
        }

        // Avoid reusing the previous session after authentication
        HttpSession oldSession = request.getSession(false);

        if (oldSession != null) {
            oldSession.invalidate();
        }

        // Create a fresh authenticated session
        HttpSession session = request.getSession(true);

        session.setAttribute(
                "authenticatedMember",
                matchedMember
        );

        // Redirect the browser to the catalogue controller
        response.sendRedirect(
                request.getContextPath() + "/catalogue"
        );
    }
}