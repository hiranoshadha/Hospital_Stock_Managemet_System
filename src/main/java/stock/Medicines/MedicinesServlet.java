package stock.Medicines;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/MedicinesServlet")
public class MedicinesServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("insert".equals(action)) {
            // Add new medicine
            String name = request.getParameter("medicineName");
            String type = request.getParameter("medicineType");
            String dosage = request.getParameter("dosage");
            String category = request.getParameter("drugCategory");
            double cost = Double.parseDouble(request.getParameter("cost"));
            String expiryDate = request.getParameter("expiryDate");

            Medicines newMedicine = new Medicines(0, name, type, dosage, category, cost, expiryDate);
            MedicinesDBUtil.insertMedicine(newMedicine);

        } else if ("update".equals(action)) {
            // Update existing medicine
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("medicineName");
            String type = request.getParameter("medicineType");
            String dosage = request.getParameter("dosage");
            String category = request.getParameter("drugCategory");
            double cost = Double.parseDouble(request.getParameter("cost"));
            String expiryDate = request.getParameter("expiryDate");

            Medicines updatedMedicine = new Medicines(id, name, type, dosage, category, cost, expiryDate);
            MedicinesDBUtil.updateMedicine(updatedMedicine);

        } else if ("delete".equals(action)) {
            // Delete medicine
            int id = Integer.parseInt(request.getParameter("id"));
            MedicinesDBUtil.deleteMedicine(id);
        }

        response.sendRedirect("MedicinesServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
         // Forward to index.jsp

        if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Medicines medicine = MedicinesDBUtil.getMedicineById(id); // Fetch the medicine by ID
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("UpdateMedicine.jsp").forward(request, response);

        } 
        if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            Medicines medicine = MedicinesDBUtil.getMedicineById(id); // Fetch the medicine by ID
            request.setAttribute("medicine", medicine);
            request.getRequestDispatcher("DeleteMedicine.jsp").forward(request, response);

        } else {
            List<Medicines> allMedicines = MedicinesDBUtil.getAllMedicines();
            request.setAttribute("allsmM", allMedicines);
            request.getRequestDispatcher("StockDetails.jsp").forward(request, response);
        }
    }
    

   

}
