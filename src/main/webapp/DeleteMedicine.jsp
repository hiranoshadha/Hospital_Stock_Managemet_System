<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Delete Medicine</title>
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

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 500px;
            margin: 0 auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #2d572c;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            background-color: #d9534f;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
        }

        a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #5bc0de;
            color: white;
            border-radius: 5px;
            margin-left: 10px;
            font-size: 1rem;
        }

        a:hover {
            background-color: #31b0d5;
        }

        p {
            font-size: 1.2rem;
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
        <h2>Delete Medicine</h2>

        <form action="MedicinesServlet?action=delete" method="post">
            <input type="hidden" name="id" value="${medicine.id}">

            <p>Are you sure you want to delete the following medicine?</p>

            <table>
                <tr>
                    <th>ID</th>
                    <td>${medicine.id}</td>
                </tr>
                <tr>
                    <th>Medicine Name</th>
                    <td>${medicine.medicineName}</td>
                </tr>
                <tr>
                    <th>Medicine Type</th>
                    <td>${medicine.medicineType}</td>
                </tr>
                <tr>
                    <th>Dosage</th>
                    <td>${medicine.dosage}</td>
                </tr>
                <tr>
                    <th>Drug Category</th>
                    <td>${medicine.drugCategory}</td>
                </tr>
                <tr>
                    <th>Cost</th>
                    <td>${medicine.cost}</td>
                </tr>
                <tr>
                    <th>Expiry Date</th>
                    <td>${medicine.expiryDate}</td>
                </tr>
            </table>

            <br>

            <input type="submit" value="Yes, Delete">
            <a href="StockDetails.jsp">Cancel</a>
        </form>
    </div>

    <!-- FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>
