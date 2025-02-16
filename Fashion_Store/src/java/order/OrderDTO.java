/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package order;

import java.sql.Date;

/**
 *
 * @author tinit
 */
public class OrderDTO {
    private Long id;
    private int accountId;
    private double totalMoney;
    private Date date;
    private String status;
    private String username;

    public OrderDTO() {
    }

    public OrderDTO(Long id, int accountId, double totalMoney, Date date, String status, String username) {
        this.id = id;
        this.accountId = accountId;
        this.totalMoney = totalMoney;
        this.date = date;
        this.status = status;
        this.username = username;
    }

    public OrderDTO(Long id, double totalMoney, Date date, String status) {
        this.id = id;
        this.totalMoney = totalMoney;
        this.date = date;
        this.status = status;
    }

    public OrderDTO(Long id, double totalMoney, Date date, String status, String username) {
        this.id = id;
        this.totalMoney = totalMoney;
        this.date = date;
        this.status = status;
        this.username = username;
    }

    public OrderDTO(String status) {
        this.status = status;
    }
  
    
    public Long getId() {
        return id;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public double getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(double totalMoney) {
        this.totalMoney = totalMoney;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    
    
}
