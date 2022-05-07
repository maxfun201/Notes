package app.servlets;

import app.entities.User;
import app.model.Model;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

public class addServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
//        PrintWriter writer = resp.getWriter();
//        writer.println("Method GET from addServlet");
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("pages/add.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        String name = req.getParameter("name");
        String password = req.getParameter("pass");
        String repPassword = req.getParameter("reppass");
//        String cb_signUp = req.getParameter("cb_signUp");
//        System.out.println(cb_signUp);

        boolean errorFlag = false;

        if(password.equals(repPassword)){
            User user = new User(name, password);
            Model model = Model.getInstance();
            model.add(user);

            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try{
                Class.forName("org.postgresql.Driver");
                connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/NoteServiceUsers?currentSchema=public&user=postgres&password=12345");
                statement = connection.createStatement();
                int usrId = 0;
                resultSet = statement.executeQuery("select * from users");
                while(resultSet.next()){
                    usrId = resultSet.getInt(1);
                }
                usrId++;

                statement.executeUpdate("insert into users values ( " + usrId + ", '" + name + "', '" + password + "')");

            }

            catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            catch (SQLException e) {
                e.printStackTrace();
            }

            req.setAttribute("userName", name);
            req.setAttribute("error", null);
            errorFlag = true;
        }
        else if(!errorFlag) req.setAttribute("error", "error");


        doGet(req, resp);
    }
}
