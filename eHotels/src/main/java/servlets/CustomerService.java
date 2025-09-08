package servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerService {

    public String createCustomer(Customer customer) throws Exception {
        String message = "";
        Connection con = null;

        // connection object
        ConnectionDB db = new ConnectionDB();
        System.out.println(customer.getCustomer_id());

        // sql query
        String insertCustomerQuery = "INSERT INTO \"ProjectPrototype\".customer (customer_id, id_type, first_name, last_name, street_number, street_name, \"ZIP\", city, \"province/state\", country, \"date_of_regestration\") OVERRIDING SYSTEM VALUE VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        // try connect to database, catch any exceptions
        try {
            con = db.getConnection(); //get Connection

            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertCustomerQuery);

            // set every ? of statement
            stmt.setInt(1, customer.getCustomer_id());
            stmt.setString(2, customer.getId_type());
            stmt.setString(3, customer.getFirst_name());
            stmt.setString(4, customer.getLast_name());
            stmt.setString(5, customer.getStreet_number());
            stmt.setString(6, customer.getStreet_name());
            stmt.setString(7, customer.getZip());
            stmt.setString(8, customer.getCity());
            stmt.setString(9, customer.getProvince_state());
            stmt.setString(10, customer.getCountry());
            stmt.setDate(11, customer.getDate_of_registration());

            // execute the query
            int output = stmt.executeUpdate();
            System.out.println(output);

            // close the statement
            stmt.close();
            // close the connection
            db.close();
        } catch (Exception e) {
            message = "Error while inserting customer: " + e.getMessage();
        } finally {
            if (con != null) // if connection is still open, then close.
                con.close();
            if (message.equals("")) message = "Customer successfully inserted!";

        }

        // return respective message
        return message;
    }

    public Customer getCustomer(Integer customer_id, String id_type) throws Exception {
        Customer customer = null;
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String selectQuery = "SELECT customer_id, id_type, first_name, last_name, street_number, street_name, \"ZIP\", city, \"province/state\", country, \"date_of_regestration\" " +
                "FROM \"ProjectPrototype\".customer " +
                "WHERE customer_id = ? AND id_type = ?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(selectQuery);
            stmt.setInt(1, customer_id);
            stmt.setString(2, id_type);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                int custId = rs.getInt("customer_id");
                String idType = rs.getString("id_type");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String streetNumber = rs.getString("street_number");
                String streetName = rs.getString("street_name");
                String zip = rs.getString("ZIP");
                String city = rs.getString("city");
                String provinceState = rs.getString("province/state");
                String country = rs.getString("country");
                java.sql.Date dateReg = rs.getDate("date_of_regestration");

                customer = new Customer(custId, idType, firstName, lastName, streetNumber, streetName, zip, city, provinceState, country, dateReg);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            throw new Exception("Error fetching customer: " + e.getMessage());
        } finally {
            if (con != null)
                con.close();
        }
        return customer;
    }

    public Customer deleteCustomer(Integer customer_id, String id_type) throws Exception {
        // First retrieve the customer so we can return it after deletion
        Customer customer = getCustomer(customer_id, id_type);
        if (customer == null) {
            throw new Exception("Customer not found for deletion");
        }
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String deleteQuery = "DELETE FROM \"ProjectPrototype\".customer WHERE customer_id = ? AND id_type = ?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(deleteQuery);
            stmt.setInt(1, customer_id);
            stmt.setString(2, id_type);
            int output = stmt.executeUpdate();
            System.out.println("Deleted rows: " + output);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("Error deleting customer: " + e.getMessage());
        } finally {
            if (con != null)
                con.close();
        }
        return customer;
    }

    public void updateCustomer(Customer customer) throws Exception {
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String updateQuery = "UPDATE \"ProjectPrototype\".customer SET first_name = ?, last_name = ?, street_number = ?, street_name = ?, \"ZIP\" = ?, city = ?, \"province/state\" = ?, country = ?, \"date_of_regestration\" = ? " +
                "WHERE customer_id = ? AND id_type = ?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);
            stmt.setString(1, customer.getFirst_name());
            stmt.setString(2, customer.getLast_name());
            stmt.setString(3, customer.getStreet_number());
            stmt.setString(4, customer.getStreet_name());
            stmt.setString(5, customer.getZip());
            stmt.setString(6, customer.getCity());
            stmt.setString(7, customer.getProvince_state());
            stmt.setString(8, customer.getCountry());
            stmt.setDate(9, customer.getDate_of_registration());
            stmt.setInt(10, customer.getCustomer_id());
            stmt.setString(11, customer.getId_type());

            int output = stmt.executeUpdate();
            System.out.println("Updated rows: " + output);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("Error updating customer: " + e.getMessage());
        } finally {
            if (con != null)
                con.close();
        }
    }
}
