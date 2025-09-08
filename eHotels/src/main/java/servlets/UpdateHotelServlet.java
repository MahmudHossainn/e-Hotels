package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateHotelServlet")
public class UpdateHotelServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the update form
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        // Fields to update:
        String hotel_name = request.getParameter("hotel_name");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String street_number = request.getParameter("street_number");
        String street_name = request.getParameter("street_name");
        String city = request.getParameter("city");
        String province_state = request.getParameter("province_state");
        String country = request.getParameter("country");
        String ZIP = request.getParameter("ZIP");
        int manager_id = Integer.parseInt(request.getParameter("manager_id"));
        String chain_name = request.getParameter("chain_name");

        // Build SQL update statement:
        String sql = "UPDATE \"ProjectPrototype\".hotel " +
                "SET hotel_name = ?, rating = ?, street_number = ?, street_name = ?, city = ?, \"province/state\" = ?, country = ?, \"ZIP\" = ?, manager_id = ?, chain_name = ? " +
                "WHERE hotel_id = ?;";

        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, hotel_name);
            stmt.setInt(2, rating);
            stmt.setString(3, street_number);
            stmt.setString(4, street_name);
            stmt.setString(5, city);
            stmt.setString(6, province_state);
            stmt.setString(7, country);
            stmt.setString(8, ZIP);
            stmt.setInt(9, manager_id);
            stmt.setString(10, chain_name);
            stmt.setInt(11, hotel_id);

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("hotelsuccess.jsp");
            } else {
                response.getWriter().println("Error: Hotel update failed.");
            }
        } catch(Exception e) {
            throw new ServletException("Error updating hotel: " + e.getMessage());
        }
    }
}
