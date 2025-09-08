package servlets;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployeeService {

    // Retrieve an employee by primary keys (employee_id and hotel_id)
    public Employee getEmployee(Integer employee_id) throws Exception {
        Employee employee = null;
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String selectQuery = "SELECT employee_id, hotel_id, first_name, last_name, street_number, street_name, \"ZIP\", city, \"province/state\", country " +
                "FROM \"ProjectPrototype\".employee " +
                "WHERE employee_id = ?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(selectQuery);
            stmt.setInt(1, employee_id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Integer empId = rs.getInt("employee_id");
                Integer hId = rs.getInt("hotel_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                String streetNumber = rs.getString("street_number");
                String streetName = rs.getString("street_name");
                String zip = rs.getString("ZIP");
                String city = rs.getString("city");
                String provinceState = rs.getString("province/state");
                String country = rs.getString("country");

                employee = new Employee(empId, hId, firstName, lastName, streetNumber, streetName, zip, city, provinceState, country);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            throw new Exception("Error fetching employee: " + e.getMessage());
        } finally {
            if (con != null)
                con.close();
        }
        return employee;
    }

    // Update employee details in the database
    public void updateEmployee(Employee employee) throws Exception {
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String updateQuery = "UPDATE \"ProjectPrototype\".employee SET hotel_id = ?, first_name = ?, last_name = ?, street_number = ?, street_name = ?, \"ZIP\" = ?, city = ?, \"province/state\" = ?, country = ? " +
                "WHERE employee_id = ?";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(updateQuery);
            stmt.setInt(1, employee.getHotel_id());
            stmt.setString(2, employee.getFirst_name());
            stmt.setString(3, employee.getLast_name());
            stmt.setString(4, employee.getStreet_number());
            stmt.setString(5, employee.getStreet_name());
            stmt.setString(6, employee.getZip());
            stmt.setString(7, employee.getCity());
            stmt.setString(8, employee.getProvince_state());
            stmt.setString(9, employee.getCountry());
            stmt.setInt(10, employee.getEmployee_id());

            int output = stmt.executeUpdate();
            System.out.println("Updated rows: " + output);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("Error updating employee: " + e.getMessage());
        } finally {
            if (con != null)
                con.close();
        }
    }

    // Delete an employee from the database and return the deleted employee object
    public Employee deleteEmployee(Integer employee_id) throws Exception {
        // First, retrieve the employee so that we can return it after deletion
        Employee employee = getEmployee(employee_id);
        if (employee == null) {
            throw new Exception("Employee not found for deletion");
        }
        Connection con = null;
        ConnectionDB db = new ConnectionDB();
        String deleteQuery = "SET search_path = \"ProjectPrototype\";\n" +
                "\n" +
                "DELETE FROM EMPLOYEE WHERE employee_id = ?;";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(deleteQuery);
            stmt.setInt(1, employee_id);
            int output = stmt.executeUpdate();
            System.out.println("Deleted rows: " + output);
            stmt.close();
        } catch (Exception e) {
            throw new Exception("Error deleting employee: " + e.getMessage());
        } finally {
            if (con != null)
                con.close();
        }
        return employee;
    }
}
