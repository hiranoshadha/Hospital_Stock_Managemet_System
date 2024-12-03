<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="stock.Medicines.Medicines" %>
<%@ page import="stock.Medicines.MedicinesDBUtil" %>


<%
    // Fetch the list of products from the database
    List<Medicines> medicinesList = MedicinesDBUtil.getAllMedicines();

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
        integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Online Medicine/Drugs Ordering System</title>
    
    <style>
        /* Basic reset and typography */
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            font-size: 2em;
            color: #333;
        }

        .medicine-details {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .medicine-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 250px;
            margin: 15px;
            text-align: center;
            padding: 20px;
            transition: transform 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px);
        }

        .product-card h3 {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 10px;
        }

        .product-card p {
            font-size: 1em;
            color: #666;
            margin: 5px 0;
        }

        .product-card .Price {
            font-size: 1.2em;
            font-weight: bold;
            color: #28a745;
        }

        .product-card .Exp {
            font-size: 0.9em;
            color: #ff6347;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            .product-card {
                width: 45%;
            }
        }

        @media (max-width: 576px) {
            .product-card {
                width: 100%;
            }
        }
    </style>
</head>

<body>
    <div class="main">
        <div class="navbar">
            <div class="icon">
                <img class="i1" src="logo.png" alt="Logo">
            </div>
            <div class="menu">
                <ul>
                    <li class="n1"><a href="index.html">HOME</a></li>
                    <li class="n1"><a href="getinsurance.html">SUPPORT</a></li>
                    <li class="n1"><a href="contactus/contactus.php">CONTACT US</a></li>
                    <li class="n1"><a href="Thirdpartycover.php">SIGNUP</a></li>
                    <li class="n1"><a href="login.jsp">LOGIN</a></li>
                </ul>
            </div>
            <a href="contactus/User.php"><img class="i2" src="userlogo.png" alt="User Icon"></a>
        </div>

        <!-- Medicine Details Section -->
        <div class="medicine-details">
            <h2>Available Medicines</h2>
            <div class="medicine-list">
                <%
                    for (Medicines medicines : medicinesList) {
                %>
                <div class="product-card">
                    <h3><%= medicines.getMedicineName() %></h3>
                    <p class="Type"><strong>Type:</strong> <%= medicines.getMedicineType() %></p>
                    <p class="Dose"><strong>Dosage:</strong> <%= medicines.getDosage() %></p>
                    <p class="Category"><strong>Category:</strong> <%= medicines.getDrugCategory() %></p>
                    <p class="Price"><strong>Price:</strong> Rs.<%= medicines.getCost() %></p>
                    <p class="Exp"><strong>Expiry Date:</strong> <%= medicines.getExpiryDate() %></p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer>
        <div class="container2">
            <div class="background3">
                <form action="https://www.google.com/search" method="get" class="searchbar">
                    <input type="text" placeholder="Search here........" name="q">
                    <button class="btn4" type="submit"><img src="searchimage.png" alt="Search Icon"></button>
                </form>
                <div id="f1">
                    <div class="container3">
                        <div class="footer-content">
                            <p>News & Updates</p>
                            <p>Privacy policy</p>
                            <p>Terms & Conditions</p>
                            <p>Safety</p>
                        </div>
                    </div>
                    <div class="container3">
                        <div class="footer-content">
                            <h2 style="margin-top: 20%;">Secure Payment Online</h2>
                            <ul class="cash-logo">
                                <li><img src="visa.png" alt="Visa"></li>
                                <li><img src="master.png" alt="Mastercard"></li>
                                <li><img src="ez.png" alt="EZ Cash"></li>
                                <li><img src="mcash.png" alt="mCash"></li>
                            </ul>
                        </div>
                    </div>
                    <div class="container3">
                        <div class="footer-content">
                            <h2>Contact With Us</h2>
                            <ul class="weblogo">
                                <i class="fa-brands fa-square-facebook fa-2xl" style="color: #d6d6d6;"></i>
                                <i class="fa-brands fa-linkedin fa-2xl" style="color: #d6d6d6;"></i>
                                <i class="fa-brands fa-square-twitter fa-2xl" style="color: #d6d6d6;"></i>
                                <i class="fa-brands fa-square-instagram fa-2xl" style="color: #d6d6d6;"></i>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</body>

</html>
