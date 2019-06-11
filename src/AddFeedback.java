import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;

@WebServlet(name = "AddFeedback")
public class AddFeedback extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();//use session to know item_id and user_id
        String type=request.getParameter("selectAge");
        String description =request.getParameter("description");
        String student_id=session.getAttribute("student_id").toString();
        response.getWriter().write(session.getAttribute("student_id").toString());

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            java.util.Date d=new java.util.Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String da= sdf.format(d);//collect_time
            String sql =
                    "Insert into feedback(user_id,type,description,release_time)\n" +
                            "values('"+session.getAttribute("user_id")+"','"+type+"','"+description+"', '"+da+"')";
            stm.execute(sql);
            response.sendRedirect("Feedback_successful.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
