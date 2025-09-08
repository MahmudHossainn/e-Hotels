package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        String sql = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "DELETE FROM ROOM WHERE room_id = ? AND hotel_id = ?";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, room_id);
            stmt.setInt(2, hotel_id);
            int rows = stmt.executeUpdate();
            System.out.println("Room deleted, rows affected: " + rows);

            response.sendRedirect("roomsuccess.jsp");
        } catch(Exception e) {
            throw new ServletException("Error deleting room: " + e.getMessage());
        }
    }
}
