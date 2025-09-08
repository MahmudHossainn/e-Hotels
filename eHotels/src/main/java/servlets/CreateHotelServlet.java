package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CreateHotelServlet")
public class CreateHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hotel_name = request.getParameter("hotel_name");
        int rating = Integer.parseInt(request.getParameter("rating"));
        int street_number = Integer.parseInt(request.getParameter("street_number"));
        String street_name = request.getParameter("street_name");
        String city = request.getParameter("city");
        String province_state = request.getParameter("province_state");
        String country = request.getParameter("country");
        String ZIP = request.getParameter("ZIP");
        int manager_id = Integer.parseInt(request.getParameter("manager_id"));
        String chain_name = request.getParameter("chain_name");

        String sql = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "INSERT INTO HOTEL (hotel_name, rating, street_number, street_name, city, \"province/state\", country, \"ZIP\", manager_id, chain_name) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, hotel_name);
            stmt.setInt(2, rating);
            stmt.setInt(3, street_number);
            stmt.setString(4, street_name);
            stmt.setString(5, city);
            stmt.setString(6, province_state);
            stmt.setString(7, country);
            stmt.setString(8, ZIP);
            stmt.setInt(9, manager_id);
            stmt.setString(10, chain_name);
            int rows = stmt.executeUpdate();
            System.out.println("Hotel inserted, rows affected: " + rows);

            response.sendRedirect("hotelsuccess.jsp");
        } catch(Exception e) {
            throw new ServletException("Error creating hotel: " + e.getMessage());
        }
    }
}
