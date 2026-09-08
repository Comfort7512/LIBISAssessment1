package org.example.libis;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "memberValidate", value = "/member-validate")
public class MemberValidate extends HelloServlet {

    public static List<Member> members = new ArrayList<>();

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

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        System.out.println(email + "\n"+ password);

        if(email != null && password != null ){
            for(Member member:members){
                if(member.getEmail().equalsIgnoreCase(email) && member.getPassword().equalsIgnoreCase(password)){
                    resp.sendRedirect(req.getContextPath() + "/Welcome.jsp");
                    return;
                }
                else {
                    PrintWriter out = resp.getWriter();
                    out.println("Enter valid credentials");
                    break;
                }
            }
        }
    }
}
