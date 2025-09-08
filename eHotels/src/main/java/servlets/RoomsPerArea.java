package servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name="roomsPerArea",urlPatterns={"/roomsPerArea"})
public class RoomsPerArea extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // sql query
        String sql = "SELECT * FROM \"ProjectPrototype\".available_rooms_per_area;";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            request.setAttribute("roomsPerArea", rs);
            request.getRequestDispatcher("roomsperarea.jsp").forward(request, response);
        } catch (Exception e) {
            // throw any errors occurred
            throw new ServletException(e.getMessage());
        }


    }
}
