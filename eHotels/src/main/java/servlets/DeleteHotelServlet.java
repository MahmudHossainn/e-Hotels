package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteHotelServlet")
public class DeleteHotelServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        String sql = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "DELETE FROM HOTEL WHERE hotel_id = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, hotel_id);
            int rows = stmt.executeUpdate();
            System.out.println("Hotel deleted, rows affected: " + rows);

            response.sendRedirect("hotelsuccess.jsp");
        } catch(Exception e) {
            throw new ServletException("Error deleting hotel: " + e.getMessage());
        }
    }
}
