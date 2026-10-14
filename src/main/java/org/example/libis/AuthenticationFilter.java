package org.example.libis;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AuthenticationFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {

    }

    @Override
    public void doFilter(
            ServletRequest request,
            ServletResponse response,
            FilterChain chain
    ) throws IOException, ServletException {

        HttpServletRequest httpRequest =
                (HttpServletRequest) request;

        HttpServletResponse httpResponse =
                (HttpServletResponse) response;

        String contextPath = httpRequest.getContextPath();

        String requestURI = httpRequest.getRequestURI();

        String path = requestURI.substring(
                contextPath.length()
        );

        // Allow login and logout endpoints
        if (path.equals("/login")
                || path.equals("/logout")) {

            chain.doFilter(request, response);
            return;
        }

        // Allow static assets
        if (path.startsWith("/bootstrap-5.0.2-dist/")
                || path.startsWith("/css/")
                || path.startsWith("/js/")
                || path.startsWith("/images/")
                || path.equals("/favicon.ico")) {

            chain.doFilter(request, response);
            return;
        }


        HttpSession session = httpRequest.getSession(false);

        // Check for the authenticated member
        Object authenticatedMember = null;

        if (session != null) {
            authenticatedMember =
                    session.getAttribute("authenticatedMember");
        }

        // Reject requests without an authenticated member
        if (!(authenticatedMember instanceof Member)) {

            httpResponse.sendRedirect(
                    contextPath + "/login"
            );

            return;
        }


        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        // No resources to release
    }
}