package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/bookRoom")
public class BookRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve booking parameters from the request
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        Date start_date = Date.valueOf(request.getParameter("start_date"));
        Date end_date = Date.valueOf(request.getParameter("end_date"));
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        String id_type = request.getParameter("id_type");

        // SQL to insert booking record
        String insertBookingQuery = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "INSERT INTO BOOKING (room_id, hotel_id, start_date, end_date, customer_id) \n" +
                "VALUES (?, ?, ?, ?, ?)";

        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(insertBookingQuery)) {

            stmt.setInt(1, room_id);
            stmt.setInt(2, hotel_id);
            stmt.setDate(3, start_date);
            stmt.setDate(4, end_date);
            stmt.setInt(5, customer_id);

            int output = stmt.executeUpdate();
            System.out.println("Booking inserted, rows affected: " + output);

            // Redirect to a booking success page
            response.sendRedirect("bookingsuccess.jsp");
        } catch (Exception e) {
            throw new ServletException("Error creating booking: " + e.getMessage());
        }
    }
}
