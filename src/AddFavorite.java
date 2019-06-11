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

@WebServlet(name = "AddFavorite")
public class AddFavorite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();//use session to know item_id and user_id
        String item_id=session.getAttribute("item_id").toString();
        String user_id=session.getAttribute("user_id").toString();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            java.util.Date d=new java.util.Date();
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String da= sdf.format(d);//collect_time
            String sql =
                    "Insert into peproject.favorite(item_id,user_id,collect_time) \n" +
                            "values('" +item_id+"',' "+user_id+"','"+da+"');";
            stm.execute(sql);
            response.sendRedirect("Favorites.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
