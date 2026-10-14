package org.example.libis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@WebServlet("/catalogue")
public class CatalogueController extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response
    ) throws ServletException, IOException {

        // Retrieve the current session
        HttpSession session = request.getSession(false);

        // Get the authenticated member
        Member member = (Member) session.getAttribute(
                "authenticatedMember"
        );

        // Retrieve all books from application scope
        List<Book> allBooks =
                (List<Book>) getServletContext()
                        .getAttribute("books");

        // Read the search term
        String searchTerm = request.getParameter("search");

        // Prepare the list that will be displayed
        List<Book> resultBooks = new ArrayList<>();

        if (searchTerm == null || searchTerm.isBlank()) {

            // No search term: display all books
            resultBooks.addAll(allBooks);

        } else {

            // Search term supplied: find partial title matches
            String search = searchTerm
                    .trim()
                    .toLowerCase(Locale.ROOT);

            for (Book book : allBooks) {

                String title = book.getTitle()
                        .toLowerCase(Locale.ROOT);

                if (title.contains(search)) {
                    resultBooks.add(book);
                }
            }
        }


        request.setAttribute(
                "username",
                member.getFullName()
        );

        request.setAttribute(
                "books",
                resultBooks
        );

        request.setAttribute(
                "searchTerm",
                searchTerm == null ? "" : searchTerm
        );


        request.getRequestDispatcher(
                "/WEB-INF/views/welcome.jsp"
        ).forward(request, response);
    }
}