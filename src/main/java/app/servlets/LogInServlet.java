package app.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
        System.out.println(name);
        System.out.println(password);

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        boolean name_flag = false;
        boolean pass_flag = false;

//        String db_url = "jdbc:postgresql://ec2-52-212-228-71.eu-west-1.compute.amazonaws.com:5432/d86odmf8u87ddm";
//        String db_name = "kvwxohwlyxngbt";
//        String db_pass = "c0d032437b3a159f707b4eb1a214f1b9202d7c218951272d5a69b16967e2ee01";

        try{
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/NoteServiceUsers", "postgres", "12345");
            statement = connection.createStatement();


            req.setAttribute("error", null);
            resultSet = statement.executeQuery("select * from users");
            while(resultSet.next()){
                String currentName = resultSet.getString("login");
                if(currentName.equals(name)){
                    String currentPassword = resultSet.getString("password");
                    name_flag = true;
                    if(currentPassword.equals(password)){
                        req.setAttribute("login", "true");
                        pass_flag = true;
                        break;
                    }
                }

            }
            if(!name_flag) req.setAttribute("name_error", "true");
            if(!pass_flag && name_flag) req.setAttribute("pass_error", "true");
            if(name_flag && pass_flag) req.setAttribute("login", "true");

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
                doGet(req, resp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        doGet(req, resp);

    }
}
