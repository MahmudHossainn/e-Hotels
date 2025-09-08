package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/checkInBooking")
public class CheckInBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        String startDateStr = request.getParameter("start_date");
        Date start_date = Date.valueOf(startDateStr);
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));

        // SQL to retrieve the booking record (adjust column/table names as needed)
        String sql = "SELECT * " +
                "FROM \"ProjectPrototype\".booking " +
                "WHERE hotel_id = ? AND room_id = ? AND start_date = ?;";

        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, hotel_id);
            stmt.setInt(2, room_id);
            stmt.setDate(3, start_date);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Retrieve booking details
                int booking_room_id = rs.getInt("room_id");
                int booking_hotel_id = rs.getInt("hotel_id");
                Date booking_start_date = rs.getDate("start_date");
                Date booking_end_date = rs.getDate("end_date");
                int customer_id = rs.getInt("customer_id");

                // Set attributes to forward to the details page
                request.setAttribute("booking_room_id", booking_room_id);
                request.setAttribute("booking_hotel_id", booking_hotel_id);
                request.setAttribute("booking_start_date", booking_start_date);
                request.setAttribute("booking_end_date", booking_end_date);
                request.setAttribute("customer_id", customer_id);
                request.setAttribute("employee_id", employee_id);

                request.getRequestDispatcher("checkinbookingdetails.jsp").forward(request, response);
            } else {
                response.getWriter().println("No booking record found for the given details.");
            }
            rs.close();
        } catch (Exception e) {
            throw new ServletException("Error retrieving booking: " + e.getMessage());
        }
    }
}
