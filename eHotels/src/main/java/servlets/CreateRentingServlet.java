package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/createRenting")
public class CreateRentingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int room_id = Integer.parseInt(request.getParameter("room_id"));
        int hotel_id = Integer.parseInt(request.getParameter("hotel_id"));
        Date start_date = Date.valueOf(request.getParameter("start_date"));
        Date end_date = Date.valueOf(request.getParameter("end_date"));
        int customer_id = Integer.parseInt(request.getParameter("customer_id"));
        int employee_id = Integer.parseInt(request.getParameter("employee_id"));
        String payment_info = request.getParameter("payment_info");

        // SQL to insert into renting table
        String insertRentingQuery = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "INSERT INTO RENTING (room_id, hotel_id, start_date, end_date, employee_id, customer_id, payment_info) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?);";
        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(insertRentingQuery)) {

            stmt.setInt(1, room_id);
            stmt.setInt(2, hotel_id);
            stmt.setDate(3, start_date);
            stmt.setDate(4, end_date);
            stmt.setInt(5, employee_id);
            stmt.setInt(6, customer_id);
            stmt.setString(7, payment_info);

            int output = stmt.executeUpdate();
            System.out.println("Renting inserted, rows affected: " + output);

            // Redirect to a success page
            response.sendRedirect("checkinbookingsuccess.jsp");
        } catch (Exception e) {
            throw new ServletException("Error creating renting: " + e.getMessage());
        }
    }
}
