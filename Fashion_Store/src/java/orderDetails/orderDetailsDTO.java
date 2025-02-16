/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package orderDetails;

/**
 *
 * @author tinit
 */
public class orderDetailsDTO {
    private int id;
    private int productID;
    private int quantity;
    private String address;
    private String phoneNumber;
    private double price;
    private String productName;
    private String img;
    private String status;

    public orderDetailsDTO() {
    }

    public orderDetailsDTO(int id, int productID, int quantity, String address, String phoneNumber, double price, String productName, String img, String status) {
        this.id = id;
        this.productID = productID;
        this.quantity = quantity;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.price = price;
        this.productName = productName;
        this.img = img;
        this.status = status;
    }

    public orderDetailsDTO(int productID, int quantity, String address, String phoneNumber, double price, String productName, String img, String status) {
        this.productID = productID;
        this.quantity = quantity;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.price = price;
        this.productName = productName;
        this.img = img;
        this.status = status;
    }
    
    

    public int getId() {
        return id;
    }

    public int getProductID() {
        return productID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
   
    

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
    
    
}
