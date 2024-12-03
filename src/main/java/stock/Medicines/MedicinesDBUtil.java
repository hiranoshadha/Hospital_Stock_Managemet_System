package stock.Medicines;

import stock.DBConnect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MedicinesDBUtil {
    
    public static boolean insertMedicine(Medicines medicine) {
        boolean isSuccess = false;
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "INSERT INTO medicines (medicineName, medicineType, dosage, drugCategory, cost, expiryDate) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, medicine.getMedicineName());
            ps.setString(2, medicine.getMedicineType());
            ps.setString(3, medicine.getDosage());
            ps.setString(4, medicine.getDrugCategory());
            ps.setDouble(5, medicine.getCost());
            ps.setString(6, medicine.getExpiryDate());

            int result = ps.executeUpdate();
            isSuccess = result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static List<Medicines> getAllMedicines() {
        List<Medicines> medicines = new ArrayList<>();
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT * FROM medicines";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Medicines medicine = new Medicines(rs.getInt("id"), rs.getString("medicineName"), rs.getString("medicineType"), rs.getString("dosage"), rs.getString("drugCategory"), rs.getDouble("cost"), rs.getString("expiryDate"));
                medicines.add(medicine);
            }
            //System.out.println("Medicines from DB: " + medicines); // Debugging line
        } catch (Exception e) {
            e.printStackTrace();
        }
        return medicines;
    }


    public static boolean updateMedicine(Medicines medicine) {
        boolean isSuccess = false;
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "UPDATE medicines SET medicineName=?, medicineType=?, dosage=?, drugCategory=?, cost=?, expiryDate=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, medicine.getMedicineName());
            ps.setString(2, medicine.getMedicineType());
            ps.setString(3, medicine.getDosage());
            ps.setString(4, medicine.getDrugCategory());
            ps.setDouble(5, medicine.getCost());
            ps.setString(6, medicine.getExpiryDate());
            ps.setInt(7, medicine.getId());

            int result = ps.executeUpdate();
            isSuccess = result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }

    public static boolean deleteMedicine(int id) {
        boolean isSuccess = false;
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "DELETE FROM medicines WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int result = ps.executeUpdate();
            isSuccess = result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isSuccess;
    }
    
    public static Medicines getMedicineById(int id) {
        Medicines medicine = null;
        try {
            Connection conn = DBConnect.getConnection();
            String sql = "SELECT * FROM medicines WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                medicine = new Medicines(rs.getInt("id"), rs.getString("medicineName"), rs.getString("medicineType"), rs.getString("dosage"), rs.getString("drugCategory"), rs.getDouble("cost"), rs.getString("expiryDate"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return medicine;
    }

}
