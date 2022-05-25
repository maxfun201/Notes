package app.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import static app.servlets.AuthFilter.ID;

public class NotesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("pages/Notes.jsp");
        requestDispatcher.forward(req, resp);

        ServletContext servletContext = getServletContext();
        String userName = null;

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/NoteServiceUsers", "postgres", "12345");
            statement = connection.createStatement();

            req.setAttribute("error", null);
            resultSet = statement.executeQuery("select * from users");
            while(resultSet.next()){
                int tmp_id = resultSet.getInt("userid");
                if(tmp_id == ID) {
                    userName = resultSet.getString("login");
                    servletContext.setAttribute("uName", userName);
                    break;
                }
            }
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally {
            try {
                connection.close();

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println(ID);

        getServletContext().getRequestDispatcher("/pages/Notes.jsp").forward(req, resp);
    }

    //int user_id = ID;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //later
    }
}
