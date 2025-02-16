/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package account;

/**
 *
 * @author tinit
 */
public class AccountDTO {

    private int id;
    private String username;
    private String fullName;
    private String email;
    private String password;
    private String address;
    private String phoneNumber;
    private Long role;
    private Long status;

    public AccountDTO() {
    }

    public AccountDTO(int id, String username, String email, String fullName, String password, String address, String phoneNumber, Long role, Long status) {
        this.id = id;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.role = role;
        this.status = status;
    }

    
   
    public AccountDTO(String username, String email, String fullName, String password, String address, String phoneNumber, Long status) {
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.password = password;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.status = status;
    }

    public AccountDTO(int id, String username, String email, String fullName, String address, String phoneNumber, Long status) {
        this.id = id;
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.phoneNumber = phoneNumber;
        this.status = status;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Long getRole() {
        return role;
    }

    public void setRole(Long role) {
        this.role = role;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Long getStatus() {
        return status;
    }

    public void setStatus(Long status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "AccountDTO{" + "id=" + id + ", username=" + username + ", email=" + email + ", password=" + password + ", address=" + address + ", role=" + role + '}';
    }

}
