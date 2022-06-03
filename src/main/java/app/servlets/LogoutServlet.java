package app.servlets;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static app.servlets.AuthFilter.ID;

public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final HttpSession session = req.getSession();

        session.removeAttribute("login");
        session.removeAttribute("password");

        ID = 0;

        ServletContext servletContext = getServletContext();
        String userName = "Unknown";

        servletContext.setAttribute("uName", userName);


        resp.sendRedirect("/");
    }
}
