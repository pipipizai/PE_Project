import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

@WebServlet(name = "AddMessage")
public class AddMessage extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String content=request.getParameter("content");
        String userid="0";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm1= DriverManager.getConnection("jdbc:mysql://localhost:3306/forum","root","admin").createStatement();
            String sql1 ="select user_id\n" +
                    "from item\n" +
                    "where item_id='"+session.getAttribute("item_id")+"';";

            ResultSet rs1=stm1.executeQuery(sql1);
            if(rs1.next())
            {
                userid=rs1.getString("user_id");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }


        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            java.util.Date d=new java.util.Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String da= sdf.format(d);
            String sql ="Insert into peproject.comment(item_id,content,user_id,sender_id,time) \n" +
                    "values('"+session.getAttribute("item_id")+"','"+content+"','"+userid+"','"+session.getAttribute("sender_id")+"','"+da+"')";

            stm.execute(sql);
            response.sendRedirect("Item_Information.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
