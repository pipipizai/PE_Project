import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import static java.lang.Class.forName;
import static java.lang.System.out;

@WebServlet(name = "Login")
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String student_id=request.getParameter("student_id");
        student_id=student_id.replace("\'","");
        String password=request.getParameter("password");
        password=password.replace("\'","");
        try {
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            String sql = "select *\n" +
                    "from peproject.user\n" +
                    "where student_id='"+student_id+"' and password='"+password+"'";
            ResultSet rs = stm.executeQuery(sql);
            if (rs.next()) {
                session.setAttribute("student_id", student_id);
                session.setAttribute("user_id", rs.getString("user_id"));
                response.sendRedirect("homepage.jsp");
            }
            else
            {out.print("failure");
                response.sendRedirect("404.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
