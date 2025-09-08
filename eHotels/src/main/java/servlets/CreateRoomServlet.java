package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/CreateRoomServlet")
public class CreateRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        int price = Integer.parseInt(request.getParameter("price"));
        int capacity = Integer.parseInt(request.getParameter("capacity"));
        String view = request.getParameter("view");
        boolean extendable = request.getParameter("extendable") != null;
        int room_number = Integer.parseInt(request.getParameter("room_number"));

        String sql = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "INSERT INTO ROOM (hotel_id, price, capacity, view, extendable, room_number) VALUES (?, ?, ?, ?, ?, ?)";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, hotel_id);
            stmt.setInt(2, price);
            stmt.setInt(3, capacity);
            stmt.setString(4, view);
            stmt.setBoolean(5, extendable);
            stmt.setInt(6, room_number);
            int rows = stmt.executeUpdate();
            System.out.println("Room inserted, rows affected: " + rows);

            response.sendRedirect("roomsuccess.jsp");
        } catch(Exception e) {
            throw new ServletException("Error creating room: " + e.getMessage());
        }
    }
}
