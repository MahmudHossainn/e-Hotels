package servlets;

public class Employee {

    private Integer employee_id;
    private Integer hotel_id;
    private String first_name;
    private String last_name;
    private String street_number;
    private String street_name;
    private String zip;
    private String city;
    private String province_state;
    private String country;


    // Constructor
    public Employee(Integer employee_id, Integer hotel_id, String first_name, String last_name,
                    String street_number, String street_name, String zip, String city,
                    String province_state, String country) {
        this.employee_id = employee_id;
        this.hotel_id = hotel_id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.zip = zip;
        this.city = city;
        this.province_state = province_state;
        this.country = country;
    }

    // Getters
    public Integer getEmployee_id() {
        return employee_id;
    }

    public Integer getHotel_id() {
        return hotel_id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public String getStreet_number() {
        return street_number;
    }

    public String getStreet_name() {
        return street_name;
    }

    public String getZip() {
        return zip;
    }

    public String getCity() {
        return city;
    }

    public String getProvince_state() {
        return province_state;
    }

    public String getCountry() {
        return country;
    }

    // Setters
    public void setEmployee_id(Integer employee_id) {
        this.employee_id = employee_id;
    }

    public void setHotel_id(Integer hotel_id) {
        this.hotel_id = hotel_id;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public void setStreet_number(String street_number) {
        this.street_number = street_number;
    }

    public void setStreet_name(String street_name) {
        this.street_name = street_name;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setProvince_state(String province_state) {
        this.province_state = province_state;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
