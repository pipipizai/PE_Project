import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

@MultipartConfig
@WebServlet(name = "AddItem")
public class AddItem extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String type=request.getParameter("selectAge");
        String title=request.getParameter("title");
        String price=request.getParameter("price");
        String description=request.getParameter("description");
        String contact_information=request.getParameter("contact_information");

        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String dada = sdf.format(d);

        Part image = request.getPart("image");
        InputStream is = image.getInputStream();
        byte[] content = is.readAllBytes();
        if (content.length < 2) {
            response.getWriter().write("12");
            dada = "777";
        } else {
            FileOutputStream fout = new FileOutputStream(
                    request.getServletContext().getRealPath("images/") + dada + ".png");
            fout.write(content);
            fout.close();
            response.getWriter().write("21");
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
            java.util.Date d1=new java.util.Date();
            SimpleDateFormat sdf1=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            String da= sdf1.format(d1);//collect_time
            response.getWriter().write(session.getAttribute("student_id").toString());
            response.getWriter().write("type");
            String sql =
                    "Insert into peproject.item(user_id,catogory_id,picture,title,price,description,contact_information,release_time) \n" +
                            "values('"+session.getAttribute("user_id")+"','"+type+"','"+dada+"','"+title+"','"+price+"','"+description+"','"+contact_information+"','"+da+"');";

            stm.execute(sql);
            response.sendRedirect("Success_sumbmit.jsp");
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }
}
