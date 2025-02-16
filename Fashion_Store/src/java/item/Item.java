/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package item;

import product.ProductDTO;

/**
 *
 * @author tinit
 */
public class Item {
    private ProductDTO product;
    private String img;
    private int quantity;
    private double price;

    public Item() {
    }
    
    

    public Item(ProductDTO product, int quantity, double price, String img) {
        this.product = product;
        this.quantity = quantity;
        this.price = price;
        this.img = img;
    }

    public ProductDTO getProduct() {
        return product;
    }

    public void setProduct(ProductDTO product) {
        this.product = product;
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
    
    
}
