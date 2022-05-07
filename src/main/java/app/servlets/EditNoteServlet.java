package app.servlets;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class EditNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("pages/EditNote.jsp");
        requestDispatcher.forward(req, resp);
    }
}
