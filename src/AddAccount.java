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



@WebServlet(name = "AddAccount")
public class AddAccount extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String student_id=request.getParameter("student_id");

        String password=request.getParameter("password");

        String nickname=request.getParameter("nickname");

        String email=request.getParameter("email");

        String wechat=request.getParameter("wechat");
        String whatsapp=request.getParameter("whatsapp");
        String qq=request.getParameter("qq");
        if(student_id.equals("")||password.equals("")){    response.setHeader("refresh", "3;url=register.jsp");       }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            java.util.Date d=new java.util.Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String da= sdf.format(d);//register_time
            String sql =
                    "Insert into peproject.user(student_id,password,nickname,email,wechat,whatsapp,qq,register_date) \n" +
                    "values('"+ student_id+"','"+password+"','"+nickname+"','"+email+"','"+wechat+"','"+whatsapp+"','"+qq+"','"+da+"');";
            stm.execute(sql);
            response.sendRedirect("login.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
