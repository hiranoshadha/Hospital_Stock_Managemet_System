<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="ISO-8859-1">
    <title>Medicine Stock</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
        }

        /* Sidebar Dashboard Home Button */
        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2d572c;
            position: fixed;
            left: 0;
            top: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            font-size: 1.3rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .sidebar a:hover {
            text-decoration: underline;
        }

        .sidebar i {
            margin-right: 10px;
        }

        /* Main content */
        .content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }

        h2 {
            color: #2d572c;
        }

        .add-medicine-btn {
            background-color: #2d572c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .add-medicine-btn:hover {
            background-color: #3b7d42;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 30px;
            background-color: #fff;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #2d572c;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        td a {
            color: #2d572c;
            text-decoration: none;
            font-weight: bold;
        }

        td a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <!-- Sidebar Dashboard Home Button -->
    <div class="sidebar">
        <a href="Home_Page.jsp">
            <i class="fas fa-home"></i> Home
        </a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h2>Medicine Stock List</h2>

        <a href="AddMedicines.jsp">
            <button class="add-medicine-btn">Add Medicine</button>
        </a>

        <table>
            <tr>
                <th>ID</th>
                <th>Medicine Name</th>
                <th>Medicine Type</th>
                <th>Dosage</th>
                <th>Drug Category</th>
                <th>Exp Date</th>
                <th>Cost</th>
                <th>Actions</th>
            </tr>

            <c:forEach var="medicine" items="${allsmM}">
                <tr>
                    <td>${medicine.id}</td>
                    <td>${medicine.medicineName}</td>
                    <td>${medicine.medicineType}</td>
                    <td>${medicine.dosage}</td>
                    <td>${medicine.drugCategory}</td>
                    <td>${medicine.expiryDate}</td>
                    <td>${medicine.cost}</td>
                    <td>
                        <a href="MedicinesServlet?action=update&id=${medicine.id}">Update</a> |
                        <a href="MedicinesServlet?action=delete&id=${medicine.id}">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>
