package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GetHotelDetailsServlet")
public class GetHotelDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(
                     "SELECT * " +
                             "FROM \"ProjectPrototype\".hotel WHERE hotel_id = ?")) {

            stmt.setInt(1, hotel_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("hotel_id", rs.getInt("hotel_id"));
                request.setAttribute("hotel_name", rs.getString("hotel_name"));
                request.setAttribute("rating", rs.getInt("rating"));
                request.setAttribute("number_of_rooms", rs.getInt("number_of_rooms"));  // read-only display if needed
                request.setAttribute("street_number", rs.getString("street_number"));
                request.setAttribute("street_name", rs.getString("street_name"));
                request.setAttribute("city", rs.getString("city"));
                request.setAttribute("province_state", rs.getString("province/state"));
                request.setAttribute("country", rs.getString("country"));
                request.setAttribute("ZIP", rs.getString("ZIP"));
                request.setAttribute("manager_id", rs.getInt("manager_id"));
                request.setAttribute("chain_name", rs.getString("chain_name"));
            }
            rs.close();
            request.getRequestDispatcher("updatehotel.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving hotel details: " + e.getMessage());
        }
    }
}
