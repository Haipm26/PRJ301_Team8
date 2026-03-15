OCTATECH Laptop Shop – E-commerce Web Application

OCTATECH Laptop Shop is a web-based e-commerce platform developed for the PRJ301 – Java Web Application Development course at FPT University.

The system allows users to browse, search, and purchase laptop products online. It also provides administrative features to manage products, users, and orders efficiently.

The project follows the MVC (Model – View – Controller) architecture and demonstrates core Java Web development concepts such as authentication, CRUD operations, session management, and database integration.

Table of Contents

Technologies Used

Installation

Usage

Database Setup

Contributing

License

Technologies Used
Backend

Java

JSP

Servlet

JDBC

Frontend

HTML

CSS

JavaScript

Bootstrap

Database

Microsoft SQL Server

Web Server

Apache Tomcat

Development Tools

NetBeans IDE

JDK 8 / JDK 11

Architecture

MVC (Model – View – Controller)

Installation

To run the OCTATECH Laptop Shop project locally, follow these steps:

Setup Your Environment

Install the following software:

JDK 8 or higher

Apache Tomcat

Microsoft SQL Server

NetBeans IDE (recommended)

Libraries Required

Ensure the following libraries are included in the project:

sqljdbc.jar (SQL Server JDBC Driver)

jstl.jar

standard.jar

These libraries are usually located in the WEB-INF/lib folder.

Configure the Database
Create Database

Create a new database in SQL Server:

LaptopShopDB
Run SQL Scripts

Run the provided SQL script to create tables and sample data.

Tables included in the system:

Users

Laptops

Orders

OrderDetails

Database Relationships
Users (1) ------ (N) Orders
Orders (1) ----- (N) OrderDetails
Laptops (1) ---- (N) OrderDetails
Configure Database Connection

Open the database connection file (for example DBContext.java) and update the connection settings:

jdbc:sqlserver://localhost:1433;databaseName=LaptopShopDB
username: sa
password: your_password

Make sure the credentials match your SQL Server configuration.

Build and Deploy the Project

Open the project in NetBeans IDE

Build the project

Deploy the project to Apache Tomcat

Start the Tomcat server

Access the Application

After deployment, open your browser and access:

http://localhost:8080/LaptopStore
Usage
For Customers

Users can perform the following actions:

Register a new account

Login / Logout

Browse laptop products

Search for laptops

View product details

Add products to cart

Checkout and place orders

Manage personal profile

For Admins

Administrators have additional management features:

Manage laptop products (Add / Edit / Delete)

Manage users

Manage orders

View system statistics and dashboard

Database Setup
SQL Server Setup

Open SQL Server Management Studio

Create database:

LaptopShopDB

Run SQL scripts to create tables and insert sample data.

Ensure the database connection in the project is correctly configured.
