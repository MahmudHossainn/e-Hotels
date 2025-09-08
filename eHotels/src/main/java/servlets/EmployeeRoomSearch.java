package servlets;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet(name="employeeRoomSearch", urlPatterns={"/employeeRoomSearch"})
public class EmployeeRoomSearch extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Mandatory date criteria
        String startDate = request.getParameter("start_date");
        Date start_date = java.sql.Date.valueOf(startDate);
        String endDate = request.getParameter("end_date");
        Date end_date = java.sql.Date.valueOf(endDate);

        // Optional criteria
        String capacity = request.getParameter("room_capacity");
        String city = request.getParameter("city");
        String province_state = request.getParameter("province_state");
        String country = request.getParameter("country");
        String hotel_chain = request.getParameter("hotel_chain");
        String rating = request.getParameter("hotel_rating");
        String number_of_rooms = request.getParameter("total_rooms");
        String price = request.getParameter("room_price");

        // Retrieve customer and employee info
        Integer customer_id = Integer.valueOf(request.getParameter("customer_id"));
        String id_type = request.getParameter("id_type");
        Integer employee_id = Integer.valueOf(request.getParameter("employee_id"));

        // Base SQL query (adjust column names as needed)
        String sql = "SELECT room.room_id, room.hotel_id, room.price, room.capacity, room.extendable, " +
                "hotel.hotel_name, hotel.rating, hotel.number_of_rooms, hotel.chain_name, hotel.city, " +
                "hotel.\"province/state\", hotel.country " +
                "FROM \"ProjectPrototype\".room " +
                "LEFT JOIN \"ProjectPrototype\".booking ON booking.room_id = room.room_id " +
                "LEFT JOIN \"ProjectPrototype\".renting ON renting.room_id = room.room_id " +
                "LEFT JOIN \"ProjectPrototype\".hotel ON hotel.hotel_id = room.hotel_id " +
                "WHERE (booking.start_date IS NULL OR booking.end_date IS NULL " +
                "       OR (? < booking.start_date AND ? < booking.start_date) " +
                "       OR (? > booking.end_date AND ? > booking.end_date)) " +
                "AND (renting.start_date IS NULL OR renting.end_date IS NULL " +
                "       OR (? < renting.start_date AND ? < renting.start_date) " +
                "       OR (? > renting.end_date AND ? > renting.end_date)) ";

        if (capacity != null && !capacity.isEmpty()) {
            sql += "AND room.capacity >= ? ";
        }
        if (city != null && !city.isEmpty()) {
            sql += "AND hotel.city = ? ";
        }
        if (province_state != null && !province_state.isEmpty()) {
            sql += "AND hotel.\"province/state\" = ? ";
        }
        if (country != null && !country.isEmpty()) {
            sql += "AND hotel.country = ? ";
        }
        if (hotel_chain != null && !hotel_chain.isEmpty()) {
            sql += "AND hotel.chain_name = ? ";
        }
        if (rating != null && !rating.isEmpty()) {
            sql += "AND hotel.rating = ? ";
        }
        if (number_of_rooms != null && !number_of_rooms.isEmpty()) {
            sql += "AND hotel.number_of_rooms = ? ";
        }
        if (price != null && !price.isEmpty()) {
            sql += "AND room.price <= ? ";  // using ≤ here
        }

        ConnectionDB db = new ConnectionDB();
        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            // Set date parameters for both booking and renting parts
            stmt.setDate(1, start_date);
            stmt.setDate(2, end_date);
            stmt.setDate(3, start_date);
            stmt.setDate(4, end_date);
            stmt.setDate(5, start_date);
            stmt.setDate(6, end_date);
            stmt.setDate(7, start_date);
            stmt.setDate(8, end_date);

            int index = 9;
            if (capacity != null && !capacity.isEmpty()) {
                stmt.setInt(index++, Integer.parseInt(capacity));
            }
            if (city != null && !city.isEmpty()) {
                stmt.setString(index++, city);
            }
            if (province_state != null && !province_state.isEmpty()) {
                stmt.setString(index++, province_state);
            }
            if (country != null && !country.isEmpty()) {
                stmt.setString(index++, country);
            }
            if (hotel_chain != null && !hotel_chain.isEmpty()) {
                stmt.setString(index++, hotel_chain);
            }
            if (rating != null && !rating.isEmpty()) {
                stmt.setInt(index++, Integer.parseInt(rating));
            }
            if (number_of_rooms != null && !number_of_rooms.isEmpty()) {
                stmt.setInt(index++, Integer.parseInt(number_of_rooms));
            }
            if (price != null && !price.isEmpty()) {
                stmt.setDouble(index++, Double.parseDouble(price));
            }

            ResultSet rs = stmt.executeQuery();

            request.setAttribute("roomsList", rs);
            request.setAttribute("customer_id", customer_id);
            request.setAttribute("id_type", id_type);
            request.setAttribute("employee_id", employee_id);
            request.setAttribute("start_date", start_date);
            request.setAttribute("end_date", end_date);

            request.getRequestDispatcher("employeeroomslist.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e.getMessage());
        }
    }
}
