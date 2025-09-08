package servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name="roomsCapacityHotel",urlPatterns={"/roomsCapacityHotel"})
public class RoomsCapacityHotel extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // sql query
        String sql = "SELECT * FROM \"ProjectPrototype\".hotel_room_capacity;";
        // database connection object
        ConnectionDB db = new ConnectionDB();

        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);

            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            request.setAttribute("roomsCapacityHotel", rs);
            request.getRequestDispatcher("roomscapacityhotel.jsp").forward(request, response);
        } catch (Exception e) {
            // throw any errors occurred
            throw new ServletException(e.getMessage());
        }


    }
}
