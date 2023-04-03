package net.entity;

import java.util.ArrayList;
import java.util.Date;

public class Order {
	private String orderId;
    private Date orderDate;
    private String customerId;
    private double loanAmount;
    private double paidAmount;
    private ArrayList <OrderDetails> orderDetails;
    
    public Order() {
    }
    
    public Order(String orderId, Date orderDate, String customerId, double loanAmount, 
    		double paidAmount){
        this.setOrderId(orderId);
        this.setOrderDate(orderDate);
        this.setCustomerId(customerId);
        this.setLoanAmount(loanAmount);
        this.setPaidAmount(paidAmount);
    }
    
    public Order(String orderId, Date orderDate, String customerId, double loanAmount, 
    		double paidAmount,  ArrayList<OrderDetails> orderDetails) {
        this.setOrderId(orderId);
        this.setOrderDate(orderDate);
        this.setCustomerId(customerId);
        this.setLoanAmount(loanAmount);
        this.setPaidAmount(paidAmount);
        this.setOrderDetails(orderDetails);
    }

    public String getOrderId() {
		return orderId;
	}

    public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

    public Date getOrderDate() {
		return orderDate;
	}

    public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

    public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public double getLoanAmount() {
		return loanAmount;
	}

	public void setLoanAmount(double loanAmount) {
		this.loanAmount = loanAmount;
	}

	public double getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(double paidAmount) {
		this.paidAmount = paidAmount;
	}

	public ArrayList <OrderDetails> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(ArrayList <OrderDetails> orderDetails) {
		this.orderDetails = orderDetails;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderDate=" + orderDate + ", customerId=" + customerId + ", loanAmount="
				+ loanAmount + ", paidAmount=" + paidAmount + ", orderDetails="
				+ orderDetails + "]";
	}
	
}
