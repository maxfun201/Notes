package app.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

import static app.servlets.AuthFilter.USERNAME;

public class EditNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("pages/EditNote.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String name = req.getParameter("eNoteName");
        String text = req.getParameter("eNoteText");
        String color = req.getParameter("eColor");

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/NoteServiceUsers", "postgres", "12345");
            statement = connection.createStatement();

            statement.executeUpdate("insert into " + USERNAME + " values ( '" + name + "', '" + text + "', '" + color + "')");
            System.out.println(USERNAME);

            connection.close();
        }

        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        catch (SQLException e) {
            e.printStackTrace();
        }

        doGet(req, resp);
    }
}
