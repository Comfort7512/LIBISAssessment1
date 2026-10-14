package org.example.libis;



import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

import java.util.ArrayList;
import java.util.List;

@WebListener
public class LibraryDataListener implements ServletContextListener {


    @Override
    public void contextInitialized(ServletContextEvent event) {

        ServletContext context = event.getServletContext();

        // Create the member list
        List<Member> members = new ArrayList<>();

        members.add(new Member(
                1, "Henry", "Kago",
                "hen@gmail.com", "password1234"
        ));

        members.add(new Member(
                2, "Kgotso", "Theo",
                "kgo@gmail.com", "password123"
        ));

        members.add(new Member(
                3, "John", "John",
                "john@gmail.com", "password12"
        ));

        members.add(new Member(
                4, "Kisto", "Mothusi",
                "kitso@gmail.com", "password1"
        ));

        members.add(new Member(
                5, "Dayana", "Motuti",
                "dayanan@gmail.com", "password"
        ));

        // Create the book list
        List<Book> books = new ArrayList<>();

        books.add(new Book(
                1,
                "Things Fall Apart",
                "Chinua Achebe",
                "Historical Fiction",
                "A story about Okonkwo and the impact of colonialism on his Igbo community.",
                true
        ));

        books.add(new Book(
                2,
                "The Great Gatsby",
                "F. Scott Fitzgerald",
                "Classic",
                "A mysterious millionaire pursues the dream of rekindling a lost love.",
                true
        ));

        books.add(new Book(
                3,
                "1984",
                "George Orwell",
                "Dystopian",
                "A man struggles against a totalitarian government that controls every aspect of society.",
                false
        ));

        books.add(new Book(
                4,
                "To Kill a Mockingbird",
                "Harper Lee",
                "Classic",
                "A young girl learns about racism and injustice through her father's defense of an accused man.",
                true
        ));

        books.add(new Book(
                5,
                "The Hobbit",
                "J.R.R. Tolkien",
                "Fantasy",
                "Bilbo Baggins joins a group of dwarves on an adventure to reclaim their homeland.",
                false
        ));

        books.add(new Book(
                6,
                "Animal Farm",
                "George Orwell",
                "Political Fiction",
                "Farm animals overthrow their human owner and attempt to create a society where all animals are equal.",
                true
        ));

        books.add(new Book(
                7,
                "The Alchemist",
                "Paulo Coelho",
                "Adventure",
                "A young shepherd travels in search of a hidden treasure and discovers the importance of following his dreams.",
                true
        ));

        books.add(new Book(
                8,
                "Pride and Prejudice",
                "Jane Austen",
                "Romance",
                "Elizabeth Bennet navigates love, family expectations, and her complicated relationship with Mr. Darcy.",
                false
        ));

        books.add(new Book(
                9,
                "Harry Potter and the Philosopher's Stone",
                "J.K. Rowling",
                "Fantasy",
                "A young boy discovers that he is a wizard and begins his magical education at Hogwarts.",
                true
        ));

        books.add(new Book(
                10,
                "The Catcher in the Rye",
                "J.D. Salinger",
                "Classic",
                "A teenager struggles with growing up and finding his place in a confusing adult world.",
                false
        ));

        // Make both lists available throughout the application
        context.setAttribute("members", members);
        context.setAttribute("books", books);
    }
}
