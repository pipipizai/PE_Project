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

@WebServlet(name = "UpdatePersonal")
public class UpdatePersonal extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();//use session to know item_id and user_id
        String student_id=session.getAttribute("student_id").toString();
        String user_id=session.getAttribute("user_id").toString();
        String nickname=request.getParameter("nickname");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String wechat=request.getParameter("nickname");
        String whatsapp=request.getParameter("whatsapp");
        String qq=request.getParameter("qq");



        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            String sql =
                    "update user \n" +
                            "set password='"+password+"',nickname='"+nickname+"',email='"+email+"',wechat='"+wechat+"',whatsapp='"+whatsapp+"',qq='"+qq+"' " +
                            "where user_id='"+user_id+"';";
            stm.execute(sql);
            response.sendRedirect("Personal_Information.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }
}
