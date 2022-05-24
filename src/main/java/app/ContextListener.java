package app;

import app.dao.UserDAO;
import app.entities.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.*;
import java.util.concurrent.atomic.AtomicReference;

import static app.entities.User.ROLE.User;

@WebListener
public class ContextListener implements ServletContextListener {

    private AtomicReference<UserDAO> dao;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

        dao = new AtomicReference<>(new UserDAO());

        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        try {
            Class.forName("org.postgresql.Driver");
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/NoteServiceUsers", "postgres", "12345");
            statement = connection.createStatement();

            resultSet = statement.executeQuery("select * from users");
            while (resultSet.next()) {
                int id = resultSet.getInt("userid");
                String login = resultSet.getString("login");
                String password = resultSet.getString("password");

                dao.get().add(new User(id, login, password, User));
            }
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        dao.get().add(new User(1,"qwe", "12", User));
        final ServletContext servletContext = servletContextEvent.getServletContext();

        servletContext.setAttribute("dao", dao);
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent){

        //ServletContext servletContext = servletContextEvent.getServletContext();
        dao = null;
    }
}
