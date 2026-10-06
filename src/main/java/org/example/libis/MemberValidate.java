package org.example.libis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "memberValidate", value = "/member-validate")
public class MemberValidate extends HttpServlet {

     List<Member> members = new ArrayList<>();
     List<Book> books = new ArrayList<>();



    @Override
    public void init() {
        Member member1 = new Member(1,"Henry","Kago","hen@gmail.com","password1234");
        Member member2 = new Member(2,"Kgotso","Theo","kgo@gmail.com","password123");
        Member member3 = new Member(3,"John","John","john@gmail.com","password12");
        Member member4 = new Member(4,"Kisto","Mothusi","kitso@gmail.com","password1");
        Member member5 = new Member(5,"Dayana","Motuti","dayanan@gmail.com","password");
        members.add(member1);
        members.add(member2);
        members.add(member3);
        members.add(member4);
        members.add(member5);

        Book book1 = new Book(
                1,
                "Things Fall Apart",
                "Chinua Achebe",
                "Historical Fiction",
                "A story about Okonkwo and the impact of colonialism on his Igbo community.",
                true
        );
        Book book2 = new Book(
                2,
                "The Great Gatsby",
                "F. Scott Fitzgerald",
                "Classic",
                "A mysterious millionaire pursues the dream of rekindling a lost love.",
                true
        );
        Book book3 = new Book(
                3,
                "1984",
                "George Orwell",
                "Dystopian",
                "A man struggles against a totalitarian government that controls every aspect of society.",
                false
        );
        Book book4 = new Book(
                4,
                "To Kill a Mockingbird",
                "Harper Lee",
                "Classic",
                "A young girl learns about racism and injustice through her father's defense of an accused man.",
                true
        );
        Book book5 = new Book(
                5,
                "The Hobbit",
                "J.R.R. Tolkien",
                "Fantasy",
                "Bilbo Baggins joins a group of dwarves on an adventure to reclaim their homeland.",
                false
        );
        Book book6 = new Book(
                6,
                "Animal Farm",
                "George Orwell",
                "Political Fiction",
                "Farm animals overthrow their human owner and attempt to create a society where all animals are equal.",
                true
        );

        Book book7 = new Book(
                7,
                "The Alchemist",
                "Paulo Coelho",
                "Adventure",
                "A young shepherd travels in search of a hidden treasure and discovers the importance of following his dreams.",
                true
        );

        Book book8 = new Book(
                8,
                "Pride and Prejudice",
                "Jane Austen",
                "Romance",
                "Elizabeth Bennet navigates love, family expectations, and her complicated relationship with Mr. Darcy.",
                false
        );

        Book book9 = new Book(
                9,
                "Harry Potter and the Philosopher's Stone",
                "J.K. Rowling",
                "Fantasy",
                "A young boy discovers that he is a wizard and begins his magical education at Hogwarts.",
                true
        );

        Book book10 = new Book(
                10,
                "The Catcher in the Rye",
                "J.D. Salinger",
                "Classic",
                "A teenager struggles with growing up and finding his place in a confusing adult world.",
                false
        );


        books.add(book1);
        books.add(book2);
        books.add(book3);
        books.add(book4);
        books.add(book5);
        books.add(book6);
        books.add(book7);
        books.add(book8);
        books.add(book9);
        books.add(book10);
        getServletContext().setAttribute("books",books);





    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");

        HttpSession session = req.getSession();

        String email = req.getParameter("email");

        String password = req.getParameter("password");

        System.out.println(email + "\n"+ password);
        boolean valid = false;
        if(email != null && password != null ){
            for(Member member:members){
                if(member.getEmail().equalsIgnoreCase(email) && member.getPassword().equalsIgnoreCase(password)){
                    valid = true;
                    session.setAttribute("username",member.getFullName());
                    //getServletContext().setAttribute("username",member.getFullName());

                    break;
                }

            }
        }
        if(valid){
            resp.sendRedirect(req.getContextPath() + "/Welcome.jsp");
        }
        else{
            PrintWriter out = resp.getWriter();
            out.println("Enter valid credentials");
        }
    }
}
