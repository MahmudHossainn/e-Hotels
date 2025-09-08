<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%@ page import="servlets.CustomerService" %>
<%@ page import="servlets.Customer" %>
<%@ page import="servlets.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Date" %>

<%
  // get values from the request
  Integer customer_id = Integer.valueOf(request.getParameter("customer_id"));
  String id_type = request.getParameter("id_type");
  String first_name = request.getParameter("first_name");
  String last_name = request.getParameter("last_name");
  String street_number = request.getParameter("street_number");
  String street_name = request.getParameter("street_name");
  String zip = request.getParameter("zip");
  String city = request.getParameter("city");
  String province_state = request.getParameter("province_state");
  String country = request.getParameter("country");
  String dateStr = request.getParameter("date_of_registration");
  Date date_of_registration = java.sql.Date.valueOf(dateStr);


  CustomerService customerService = new CustomerService();
  // create customer object
  Customer customer = new Customer(customer_id, id_type, first_name, last_name, street_number, street_name, zip, city, province_state, country, date_of_registration);

  Message msg;
  try {

    String value = customerService.createCustomer(customer);
    // if the value contains error/Error then this is an error message
    if (value.contains("Error") || value.contains("error")) msg = new Message("error", value);

    else msg = new Message("success", value);
  } catch (Exception e) {
    e.printStackTrace();
    msg = new Message("error", "Something went wrong!");
  }

  // create an arraylist of messages and append the new message
  ArrayList<Message> messages = new ArrayList<>();
  messages.add(msg);

  // set session attribute named messages to messages value
  session.setAttribute("messages", messages);

  response.sendRedirect("customerregistrationsuccess.jsp");
%>
