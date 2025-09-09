# e-Hotels Web Application

This project was developed as part of the CSI2132: Databases 1 course at the University of Ottawa by Group 33 (Mahmud Hossain, Sophie Hoang, and Thomas Leggatt).

The goal of this project was to design and implement a full-stack hotel management system backed by a relational database, enabling customers and employees to interact with hotel services through a web application.

## Features

### Customer Portal

* Register and manage customer profiles

* Search for available rooms with advanced filters (capacity, city, price, hotel rating, etc.)

* Book rooms and manage reservations

### Employee Portal

* Manage employee profiles

* Perform check-ins for customer bookings

* Create direct rentals without prior booking

* Manage hotels and rooms (create, update, delete records)

### Database Integration

* PostgreSQL relational schema with entities such as Customers, Employees, Hotels, Rooms, Bookings, and Rentings

* SQL queries for availability search and validation

* Support for views (e.g., available rooms per area)

## Tech Stack

* **Database:** PostgreSQL (managed with pgAdmin 4)

* **Backend:** Java Servlets running on Apache Tomcat 9

* **Frontend:** JSP, HTML, CSS

* **Build Tool:** Maven

* **IDE:** IntelliJ IDEA

## Project Setup

**1.** Restore the provided PostgreSQL database backup (DatabasesProjectV10) into a schema named "ProjectPrototype".

**2.** Update database credentials in ConnectionDB.java.

**3.** Package the project with Maven (mvn clean package).

**4.** Deploy the generated WAR file (eHotels.war) to Apache Tomcat 9.

**5.** Access the application at http://localhost:8080/eHotels.

## Contributors

* **Mahmud Hossain**
* **Sophie Hoang**
* **Thomas Leggatt**
