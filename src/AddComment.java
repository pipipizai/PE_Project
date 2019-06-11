import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.*;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.sql.Statement;
import java.sql.DriverManager;


@WebServlet(name = "AddComment")
public class AddComment extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String iid = request.getParameter("item_id");
        String content = request.getParameter("content");
        HttpSession session = request.getSession();
        response.getWriter().write("item_id");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.util.Date d=new java.util.Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String da= sdf.format(d);//collect_time
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            String sql = "insert into peproject.comment(item_id,content,user_id,sender_id,time) \n" +
                    "values('"+ iid+"','"+ content +"','" + session.getAttribute("user_id") +"','"+iid+"','"+da+"')";
            response.getWriter().println(sql);
            stm.execute(sql);
            response.sendRedirect("item_information.jsp?item_id="+iid);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        return;
    }

}


