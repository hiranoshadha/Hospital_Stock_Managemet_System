<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Medicine</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
        }
        
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

        .container {
            width: 60%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        h2 {
            text-align: center;
            color: #2d572c;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-size: 1.1rem;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1rem;
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            background-color: #2d572c;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #3b7d42;
        }

        .dashboard {
            position: absolute;
            top: 20px;
            right: 20px;
        }

        .dashboard a {
            text-decoration: none;
            background-color: #2d572c;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: background-color 0.3s ease;
            font-size: 1.1rem;
        }

        .dashboard a:hover {
            background-color: #3b7d42;
        }

        .dashboard i {
            margin-right: 8px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .error {
            color: red;
            font-size: 0.9rem;
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="sidebar">
        <a href="Home_Page.jsp">
            <i class="fas fa-home"></i> Home
        </a>
    </div>

        <h2>Medicine Details Form</h2>

        <form id="medicineForm" action="Medicines?action=insert" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="medicineName">Medicine Name:</label>
                <input type="text" id="medicineName" name="medicineName" required>
                <span id="medicineNameError" class="error"></span>
            </div>

            <div class="form-group">
                <label for="medicineType">Medicine Type:</label>
                <select id="medicineType" name="medicineType" required>
                    <option value="">Select</option>
                    <option value="tablet">Tablet</option>
                    <option value="capsule">Capsule</option>
                    <option value="syrup">Syrup</option>
                    <option value="injection">Injection</option>
                    <option value="other">Other</option>
                </select>
                <span id="medicineTypeError" class="error"></span>
            </div>

            <div class="form-group">
                <label for="dosage">Dosage:</label>
                <input type="text" id="dosage" name="dosage" required>
                <span id="dosageError" class="error"></span>
            </div>

            <div class="form-group">
                <label for="drugCategory">Drug Category:</label>
                <select id="drugCategory" name="drugCategory" required>
                    <option value="">Select</option>
                    <option value="antibiotic">Antibiotic</option>
                    <option value="analgesic">Analgesic</option>
                    <option value="antihypertensive">Antihypertensive</option>
                    <option value="other">Other</option>
                </select>
                <span id="drugCategoryError" class="error"></span>
            </div>

            <div class="form-group">
                <label for="cost">Cost:</label>
                <input type="number" id="cost" name="cost" step="0.01" min="0" required>
                <span id="costError" class="error"></span>
            </div>

            <div class="form-group">
                <label for="expiryDate">Expiry Date:</label>
                <input type="date" id="expiryDate" name="expiryDate" required>
                <span id="expiryDateError" class="error"></span>
            </div>

            <input type="submit" value="Submit">
        </form>
    </div>

    <!-- FontAwesome icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>

    <!-- JavaScript for Validation -->
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
