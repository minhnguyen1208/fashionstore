/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;

import item.Item;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tinit
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }
   

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    private Item getItemById(Long id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }
    
    public int getQuantityById(Long id) {
        return getItemById(id).getQuantity();
    }
    
    // Add to cart
    public void addItem(Item item) {
        // Item is existing in cart
        if (getItemById(item.getProduct().getId()) != null) {
            Item i = getItemById(item.getProduct().getId());
            i.setQuantity(i.getQuantity() + item.getQuantity());
        } else {
            items.add(item);
        }
    }
    
    public void removeItem(Long id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }
    
    public void decreaseQuantityById(Long id, int num) {
        Item item = getItemById(id);
        if (item != null) {
            int currentQuantity = item.getQuantity();
            if (currentQuantity > 1) {
                item.setQuantity(currentQuantity - num);
            } else {
                removeItem(id);
            }
        }
    }
    
    public double getTotalMoney() {
        double total = 0;
        for (Item item : items) {
            total += item.getPrice() * item.getQuantity();
        }
        return total;
    }
    
}
