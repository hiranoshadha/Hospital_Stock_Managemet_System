package stock.Medicines;

public class Medicines {
    private int id;
    private String medicineName;
    private String medicineType;
    private String dosage;
    private String drugCategory;
    private double cost;
    private String expiryDate;

    // Constructor with all fields
    public Medicines(int id, String medicineName, String medicineType, String dosage, String drugCategory, double cost, String expiryDate) {
        this.id = id;
        this.medicineName = medicineName;
        this.medicineType = medicineType;
        this.dosage = dosage;
        this.drugCategory = drugCategory;
        this.cost = cost;
        this.expiryDate = expiryDate;
    }

    // Getters and Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMedicineName() {
        return medicineName;
    }

    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    public String getMedicineType() {
        return medicineType;
    }

    public void setMedicineType(String medicineType) {
        this.medicineType = medicineType;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getDrugCategory() {
        return drugCategory;
    }

    public void setDrugCategory(String drugCategory) {
        this.drugCategory = drugCategory;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }
}
