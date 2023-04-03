package net.dao;

import java.util.List;

import net.entity.Order;

public interface OrderDao {
	public String generateOrderId();
	public boolean placeOrder(Order order);
	public int countOrders();
	public double totalIncome();
	public List<Order>getOrders();
}
