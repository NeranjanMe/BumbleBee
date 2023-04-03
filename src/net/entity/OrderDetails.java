package net.entity;

public class OrderDetails {
	private String productId;
    private String orderId;
    private int orderQty;
    private double totalPrice;
    
    public OrderDetails() {
    }
    
    public OrderDetails(String productId, String orderId, int orderQty, double totalPrice) {
        this.setProductId(productId);
        this.setOrderId(orderId);
        this.setOrderQty(orderQty);
        this.setTotalPrice(totalPrice);
    }

    public String getProductId() {
		return productId;
	}

    public void setProductId(String productId) {
		this.productId = productId;
	}

    public String getOrderId() {
		return orderId;
	}

    public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "OrderDetails [productId=" + productId + ", orderId=" + orderId + ", orderQty=" + orderQty
				+ ", totalPrice=" + totalPrice + "]";
	}
    
    
}
