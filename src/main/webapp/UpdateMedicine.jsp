<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Update Medicine</title>
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

        label {
            font-weight: bold;
            color: #2d572c;
            display: block;
            margin-top: 10px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
        }

        input[type="submit"] {
            background-color: #2d572c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #3b7d42;
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
        <h2>Update Medicine</h2>

        <form action="MedicinesServlet?action=update" method="post" onsubmit="return validateForm()">
            <input type="hidden" id="id" name="id" value="${medicine.id}">

            <label for="medicineName">Medicine Name:</label>
            <input type="text" id="medicineName" name="medicineName" value="${medicine.medicineName}" required>
            <div id="medicineNameError" style="color: red;"></div>

            <label for="medicineType">Medicine Type:</label>
            <input type="text" id="medicineType" name="medicineType" value="${medicine.medicineType}" required>
            <div id="medicineTypeError" style="color: red;"></div>

            <label for="dosage">Dosage:</label>
            <input type="text" id="dosage" name="dosage" value="${medicine.dosage}" required>
            <div id="dosageError" style="color: red;"></div>

            <label for="drugCategory">Drug Category:</label>
            <input type="text" id="drugCategory" name="drugCategory" value="${medicine.drugCategory}" required>
            <div id="drugCategoryError" style="color: red;"></div>

            <label for="cost">Cost:</label>
            <input type="number" id="cost" name="cost" step="0.01" value="${medicine.cost}" required>
            <div id="costError" style="color: red;"></div>

            <label for="expiryDate">Expiry Date:</label>
            <input type="date" id="expiryDate" name="expiryDate" value="${medicine.expiryDate}" required>
            <div id="expiryDateError" style="color: red;"></div>

            <input type="submit" value="Update">
        </form>
    </div>

    <!-- FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <script>
        function validateForm() {
            let isValid = true;

            // Validate Medicine Name
            const medicineName = document.getElementById("medicineName").value;
            if (medicineName.trim() === "") {
                document.getElementById("medicineNameError").innerText = "Medicine Name is required.";
                isValid = false;
            } else {
                document.getElementById("medicineNameError").innerText = "";
            }

            // Validate Medicine Type
            const medicineType = document.getElementById("medicineType").value;
            if (medicineType.trim() === "") {
                document.getElementById("medicineTypeError").innerText = "Medicine Type is required.";
                isValid = false;
            } else {
                document.getElementById("medicineTypeError").innerText = "";
            }

            // Validate Dosage (assuming it should not be empty)
            const dosage = document.getElementById("dosage").value;
            if (dosage.trim() === "") {
                document.getElementById("dosageError").innerText = "Dosage is required.";
                isValid = false;
            } else {
                document.getElementById("dosageError").innerText = "";
            }

            // Validate Drug Category
            const drugCategory = document.getElementById("drugCategory").value;
            if (drugCategory.trim() === "") {
                document.getElementById("drugCategoryError").innerText = "Drug Category is required.";
                isValid = false;
            } else {
                document.getElementById("drugCategoryError").innerText = "";
            }

            // Validate Cost (must be positive)
            const cost = document.getElementById("cost").value;
            if (isNaN(cost) || cost <= 0) {
                document.getElementById("costError").innerText = "Cost must be a positive number.";
                isValid = false;
            } else {
                document.getElementById("costError").innerText = "";
            }

            // Validate Expiry Date (it should not be in the past)
            const expiryDate = document.getElementById("expiryDate").value;
            const currentDate = new Date().toISOString().split('T')[0];
            if (expiryDate < currentDate) {
                document.getElementById("expiryDateError").innerText = "Expiry Date must be in the future.";
                isValid = false;
            } else {
                document.getElementById("expiryDateError").innerText = "";
            }

            return isValid;
        }
    </script>

</body>

</html>
