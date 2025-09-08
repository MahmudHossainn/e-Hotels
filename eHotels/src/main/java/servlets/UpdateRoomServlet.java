package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        int price = Integer.parseInt(request.getParameter("price"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String view = request.getParameter("view");
        boolean extendable = request.getParameter("extendable") != null;
        int room_number = Integer.parseInt(request.getParameter("room_number"));

        String sql = "UPDATE \"ProjectPrototype\".room SET price = ?, capacity = ?, view = ?, extendable = ?, room_number = ? WHERE room_id = ? AND hotel_id = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, price);
            stmt.setInt(2, capacity);
            stmt.setString(3, view);
            stmt.setBoolean(4, extendable);
            stmt.setInt(5, room_number);
            stmt.setInt(6, room_id);
            stmt.setInt(7, hotel_id);
            int rows = stmt.executeUpdate();
            if(rows > 0) {
                response.sendRedirect("roomsuccess.jsp");
            } else {
                response.getWriter().println("Error: Room update failed.");
            }
        } catch(Exception e) {
            throw new ServletException("Error updating room: " + e.getMessage());
        }
    }
}
