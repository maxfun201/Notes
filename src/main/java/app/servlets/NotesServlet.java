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
import static app.servlets.AuthFilter.USERNAME;

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

            ServletContext servletContext1 = getServletContext();
            int NoteSum = 0;
            resultSet = statement.executeQuery("select * from " + USERNAME);
            String NoteName = "NoteName" + Integer.toString(NoteSum+1);
            String NoteText = "NoteText" + Integer.toString(NoteSum+1);

                while(resultSet.next()) {
                    String notename = resultSet.getString("notename");
                    String notetext = resultSet.getString("notetext");
                    NoteSum++;
                    servletContext1.setAttribute(NoteName, notename);
                    servletContext1.setAttribute(NoteText, notetext);
                    NoteName = "NoteName" + Integer.toString(NoteSum+1);
                    NoteText = "NoteText" + Integer.toString(NoteSum+1);
                }
                servletContext1.setAttribute("NoteSum", NoteSum);
                NoteSum = 0;



//            String del = req.getParameter("delete");
//            System.out.println(del);
//            statement.executeUpdate("delete from " + USERNAME + " where notename = '" + del + "'");
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

        getServletContext().getRequestDispatcher("pages/Notes.jsp").forward(req, resp);
    }

    //int user_id = ID;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        doGet(req, resp);
    }
}
