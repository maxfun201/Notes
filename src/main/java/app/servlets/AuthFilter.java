package app.servlets;

import app.dao.UserDAO;
import app.entities.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.concurrent.atomic.AtomicReference;

import static java.util.Objects.nonNull;

public class AuthFilter implements Filter {

    @Override
    public void init(FilterConfig fConfig) throws ServletException {

    }

    @Override
    public void doFilter(final ServletRequest request, final ServletResponse response, final FilterChain chain) throws ServletException, IOException{

        final HttpServletRequest req = (HttpServletRequest) request;
        final HttpServletResponse resp = (HttpServletResponse) response;

        final String login = req.getParameter("log_name");
        final String password = req.getParameter("log_pass");
        int user_id = 0;

        //получение объекта
        @SuppressWarnings("unchecked")
        final AtomicReference<UserDAO> dao = (AtomicReference<UserDAO>) req.getServletContext().getAttribute("dao");
//        Connection connection = null;
//        Statement statement = null;
//        ResultSet resultSet = null;
//        try{
//            Class.forName("org.postgresql.Driver");
//            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/NoteServiceUsers", "postgres", "12345");
//            statement = connection.createStatement();
//
//            resultSet = statement.executeQuery("select * from users");
//            while(resultSet.next()){
//                String currentName = resultSet.getString("login");
//                if(currentName.equals(login)){
//                    String currentPassword = resultSet.getString("password");
//                    if(currentPassword.equals(password)){
//                        req.setAttribute("login", "true");
//                        user_id = resultSet.getInt("userid");
//                        System.out.println(user_id);
//                        break;
//                    }
//                }
//            }
//        }
//        catch (ClassNotFoundException e){
//            e.printStackTrace();
//        }
//        catch(SQLException e){
//            e.printStackTrace();
//        }
//        finally {
//            try {
//                connection.close();
//            } catch (SQLException e) {
//                e.printStackTrace();
//            }
//        }

        final HttpSession session = req.getSession();

        if(nonNull(session) && nonNull(session.getAttribute("log_name")) && nonNull(session.getAttribute("log_pass"))) {

            final User.ROLE role = (User.ROLE) session.getAttribute("role");

            moveToNotes(req, resp, role);
        }
        else if (dao.get().userIsExist(login, password)) {
            final User.ROLE role = dao.get().getRoleByLoginPassword(login, password);

            req.getSession().setAttribute("password", password);
            req.getSession().setAttribute("login", login);
            req.getSession().setAttribute("role", role);

            moveToNotes(req, resp, role);
        }
        else moveToNotes(req, resp, User.ROLE.Guest);
    }

    private void moveToNotes(final HttpServletRequest req, HttpServletResponse resp, final User.ROLE role) throws ServletException, IOException{
        if(role.equals(User.ROLE.User)){
            req.getRequestDispatcher("/pages/Notes.jsp").forward(req, resp);
        }
        else if(role.equals(User.ROLE.Guest)){
            req.getRequestDispatcher("/pages/LogIn.jsp").forward(req, resp);
        }
    }

    @Override
    public void destroy(){

    }
}
