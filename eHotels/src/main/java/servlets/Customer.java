package servlets;

import java.sql.Date;

public class Customer {

    private Integer customer_id;
    private String id_type;
    private String first_name;
    private String last_name;
    private String street_number;
    private String street_name;
    private String zip;
    private String city;
    private String province_state;
    private String country;
    private Date date_of_registration;

    public Customer(Integer customer_id, String id_type, String first_name, String last_name, String street_number,String street_name, String zip, String city, String province_state, String country, Date date_of_registration){

        this.customer_id = customer_id;
        this.id_type = id_type;
        this.first_name = first_name;
        this.last_name = last_name;
        this.street_number = street_number;
        this.street_name = street_name;
        this.zip = zip;
        this.city = city;
        this.province_state = province_state;
        this.country = country;
        this.date_of_registration = date_of_registration;
    }

    // Getters
    public Integer getCustomer_id() {
        return customer_id;
    }

    public String getId_type() {
        return id_type;
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

    public Date getDate_of_registration() {
        return date_of_registration;
    }

    // Setters
    public void setCustomer_id(Integer customer_id) {
        this.customer_id = customer_id;
    }

    public void setId_type(String id_type) {
        this.id_type = id_type;
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

    public void setDate_of_registration(Date date_of_registration) {
        this.date_of_registration = date_of_registration;
    }
}
