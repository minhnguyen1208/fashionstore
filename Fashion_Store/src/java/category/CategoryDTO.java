/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package category;

/**
 *
 * @author tinit
 */
public class CategoryDTO {
    private int id;
    private String categoryName;

    public CategoryDTO() {
    }

    public CategoryDTO(int id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
    }

    public int getId() {
        return id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return "CategoryDTO{" + "id=" + id + ", categoryName=" + categoryName + '}';
    }
    
    
}
