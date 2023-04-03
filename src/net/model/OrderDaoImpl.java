package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;

import net.dao.CustomerDao;
import net.dao.ItemDao;
import net.dao.OrderDao;
import net.dao.OrderDetailsDao;
import net.entity.Customer;
import net.entity.Item;
import net.entity.Order;
import net.entity.OrderDetails;
import net.utils.JDBCUtils;

public class OrderDaoImpl implements OrderDao{
	private OrderDetailsDao OrderDetailsDao = new OrderDetailsDaoImpl();
	private ItemDao itemDao = new ItemDaoImpl();
	@Override
	public String generateOrderId() {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT orderId from `order` order by orderId DESC LIMIT 1")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				int temp = Integer.parseInt(rst.getString(1).split("-")[1]);
				temp = temp+1;
				if(temp<=9) {
					System.out.println("O-00"+temp);
					return "O-00"+temp;
				}else if(temp<=99) {
					System.out.println("O-0"+temp);
					return "O-0"+temp;
				}else {
					System.out.println("O-"+temp);
					return "O-"+temp;
				}
			}else {
				return "O-001";
			}
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	@Override
	public boolean placeOrder(Order order) {
		try {
			Connection connection = JDBCUtils.getConnection();
	        boolean exists = checkIfOrderExists(order.getOrderId());
	        if (exists) {
	            return false;
	        }
	        connection.setAutoCommit(false);
	        
	        if (!placeTheOrder(order)) {
	            connection.rollback();
	            connection.setAutoCommit(true);
	            return false;
	        }
	        CustomerDao cusDao = new CustomerDAOImpl();
			Customer c = cusDao.searchCustomerById(order.getCustomerId());
			double loanAmount = order.getLoanAmount();
			if(loanAmount!=0.0) {
				LocalDate dob = LocalDate.parse(c.getSignUpDob());
				LocalDate curDate = LocalDate.now();  
				if ((dob != null) && (curDate != null))   
				{  
				int years = Period.between(dob, curDate).getYears();  
				if(years<18) {
						connection.rollback();
			            connection.setAutoCommit(true);
			            return false;
				}else {
					c.setLoanAmount(String.valueOf(order.getLoanAmount()));	
					c.setLoanStatus("1");
					if (!cusDao.updateCustomer(c)) {
			            connection.rollback();
			            connection.setAutoCommit(true);
			            return false;
			        }
				}
				}  
				
				
			}
	        for (OrderDetails od : order.getOrderDetails()
	        ) {
	            OrderDetails orderDetails = new OrderDetails(od.getProductId(), od.getOrderId(), od.getOrderQty(), od.getTotalPrice());
	            if (!OrderDetailsDao.saveOrderDetails(orderDetails)) {
						connection.rollback();
	                connection.setAutoCommit(true);
	                return false;
	            }
	            Item search = itemDao.searchItem(od.getProductId());
	            search.setQty(search.getQty() - od.getOrderQty());
	            try {
					if (!itemDao.updateItem(search)) {
					    connection.rollback();
					    connection.setAutoCommit(true);
					    return false;
					}
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
	        }
				connection.commit();
				connection.setAutoCommit(true);
	        return true;
		}catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	public boolean placeTheOrder(Order order) {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO `order` VALUES(?,?,?,?,?)")) {
			preparedStatement.setString(1,order.getOrderId());
			preparedStatement.setDate(2, new java.sql.Date(order.getOrderDate().getTime()));
			preparedStatement.setString(3,order.getCustomerId());
			preparedStatement.setDouble(4,order.getLoanAmount());
			preparedStatement.setDouble(5,order.getPaidAmount());
			System.out.println(preparedStatement);
			if(preparedStatement.executeUpdate()>0) {
				return true;
			}else {
				return false;
			}
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}
	public boolean checkIfOrderExists(String orderId) {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT orderId from `order` WHERE orderId=?")) {
			preparedStatement.setString(1,orderId);
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				return true;
			}else {
				return false;
			}
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	@Override
	public int countOrders() {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(orderId) from `order`")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			int count = 0;
			if(rst.next()) {
				count = rst.getInt(1);
			}
			System.out.println("Count = "+count);
			return count;
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return 0;
	}

	@Override
	public double totalIncome() {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT SUM(paidAmount) from `order`")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			double income = 0;
			if(rst.next()) {
				income = rst.getInt(1);
			}
			System.out.println("Income = "+income);
			return income;
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return 0.0;
	}

	@Override
	public List<Order> getOrders() {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * from `order`")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			List<Order>orders = new ArrayList<Order>();
			while(rst.next()) {
				orders.add(new Order(rst.getString(1),rst.getDate(2),rst.getString(3),rst.getDouble(4),rst.getDouble(5)));
			}
			return orders;
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}
}
