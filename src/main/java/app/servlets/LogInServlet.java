package app.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class LogInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("pages/LogIn.jsp");
        requestDispatcher.forward(req, resp);



    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String name = req.getParameter("log_name");
        String password = req.getParameter("log_pass");

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        boolean log_flag = false;

        String db_url = "jdbc:postgresql://ec2-52-212-228-71.eu-west-1.compute.amazonaws.com:5432/d86odmf8u87ddm";
        String db_name = "kvwxohwlyxngbt";
        String db_pass = "c0d032437b3a159f707b4eb1a214f1b9202d7c218951272d5a69b16967e2ee01";

        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection(db_url, db_name, db_pass);
            statement = connection.createStatement();

            resultSet = statement.executeQuery("select * from users");


            connection.close();
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        }
        catch(SQLException e){
            e.printStackTrace();
        }

        doGet(req, resp);
    }
}
