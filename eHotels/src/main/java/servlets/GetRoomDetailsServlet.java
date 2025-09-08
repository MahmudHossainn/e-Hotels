package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/GetRoomDetailsServlet")
public class GetRoomDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        ConnectionDB db = new ConnectionDB();
        String sql = "SELECT * " +
                "FROM \"ProjectPrototype\".room WHERE room_id = ?";
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, room_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("room_id", rs.getInt("room_id"));
                request.setAttribute("hotel_id", rs.getInt("hotel_id"));
                request.setAttribute("price", rs.getInt("price"));
                request.setAttribute("capacity", rs.getInt("capacity"));
                request.setAttribute("view", rs.getString("view"));
                request.setAttribute("extendable", rs.getBoolean("extendable"));
                request.setAttribute("room_number", rs.getInt("room_number"));
            }
            rs.close();
            request.getRequestDispatcher("updateroom.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException("Error retrieving room details: " + e.getMessage());
        }
    }
}
