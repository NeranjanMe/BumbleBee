package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.dao.CustomerDao;
import net.entity.Customer;
import net.utils.JDBCUtils;

public class CustomerDAOImpl implements CustomerDao{

	// Function use to Generate New Customer ID in Register Page
			@Override
			public String generateCustomerId() {
				try (Connection connection = JDBCUtils.getConnection();
						// Create a statement using connection object
					PreparedStatement preparedStatement = connection.prepareStatement("SELECT customerId from Customer order by customerId DESC LIMIT 1")) {
					System.out.println(preparedStatement);
					ResultSet rst = preparedStatement.executeQuery();
					if(rst.next()) {
						int temp = Integer.parseInt(rst.getString(1).split("-")[1]);
						temp = temp+1;
						if(temp<=9) {
							System.out.println("C-00"+temp);
							return "C-00"+temp;
						}else if(temp<=99) {
							System.out.println("C-0"+temp);
							return "C-0"+temp;
						}else {
							System.out.println("C-"+temp);
							return "C-"+temp;
						}
					}else {
						return "C-001";
					}
					// Execute the query or update query
				} catch (SQLException e) {
					// process sql exception
					JDBCUtils.printSQLException(e);
				}
				return null;
			}
			
	// Function use to Register Customer
	@Override
	public boolean saveCustomer(Customer c) throws ClassNotFoundException {
			String INSERT_USERS_SQL = "INSERT INTO Customer"
					+ "  (customerId,customerName,customerDOB,customerContactNumber,customerUserName,password,customerAddress) VALUES "
					+ " (?,?,?,?,?,?,?);";
			try (Connection connection = JDBCUtils.getConnection();
					// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
				preparedStatement.setString(1, c.getSignUpId());
				preparedStatement.setString(2, c.getSignUpName());
				preparedStatement.setString(3, c.getSignUpDob());
				preparedStatement.setString(4, c.getSignUpContactNo());
				preparedStatement.setString(5, c.getSignUpUserName());
				preparedStatement.setString(6, c.getSignUpPassword());
				preparedStatement.setString(7, c.getSignUpAddress());
				

				System.out.println(preparedStatement);
				// Execute the query or update query
				if( preparedStatement.executeUpdate()>0)return true;
			} catch (SQLException e) {
				// process sql exception
				JDBCUtils.printSQLException(e);
			}
			return false;
	}
	
	// Function use to Login Customer
	@Override
	public boolean checkCustomerByUserNameAndPassword(String userName, String password) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Customer WHERE customerUserName=? AND password=?")) {
			preparedStatement.setString(1, userName);
			preparedStatement.setString(2, password);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				return true;
			}
			System.out.println(preparedStatement);
			// Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	// Function use to Update Customer
	@Override
	public boolean updateCustomer(Customer c) throws ClassNotFoundException {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Customer SET customerName=?,customerDOB=?,customerContactNumber=?,customerUserName=?,password=?,customerAddress=?,loanStatus=?,loanAmount=? WHERE customerId=?")) {
				preparedStatement.setString(1, c.getSignUpName());
				preparedStatement.setString(2, c.getSignUpDob());
				preparedStatement.setString(3, c.getSignUpContactNo());
				preparedStatement.setString(4, c.getSignUpUserName());
				preparedStatement.setString(5, c.getSignUpPassword());
				preparedStatement.setString(6, c.getSignUpAddress());
				preparedStatement.setInt(7, Integer.parseInt(c.getLoanStatus()));
				preparedStatement.setDouble(8, Double.parseDouble(c.getLoanAmount()));
				preparedStatement.setString(9, c.getSignUpId());		
	
				System.out.println(preparedStatement);
				// Execute the query or update query
				if( preparedStatement.executeUpdate()>0)return true;
			} catch (SQLException e) {
				// process sql exception
				JDBCUtils.printSQLException(e);
			}
			return false;
	}

	// Function use to Delete Customer
	@Override
	public boolean deleteCustomer(String id) throws ClassNotFoundException {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE Customer WHERE customerId=?")) {
			preparedStatement.setString(1, id);
			
			System.out.println(preparedStatement);
			// Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}
	

	@Override
	public List<Customer> getAllCustomers() {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Customer")) {
			ResultSet rst = preparedStatement.executeQuery();
			List<Customer>customers = new ArrayList<>();
			while(rst.next()) {
				customers.add(new Customer(rst.getString(1),rst.getString(2),rst.getString(3),rst.getString(4),rst.getString(5),rst.getString(6),rst.getString(7)));
			}
			System.out.println("Customer List = "+customers.toString());
			System.out.println(preparedStatement);
			// Execute the query or update query
			return customers;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	@Override
	public Customer searchCustomer(String userName) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Customer WHERE customerUserName=?")) {
			preparedStatement.setString(1, userName);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				System.out.println("Customer = "+ new Customer(rst.getString(1),rst.getString(2),rst.getString(5),rst.getString(4),rst.getString(6),rst.getString(7),rst.getString(3)).toString());
				return new Customer(rst.getString(1),rst.getString(2),rst.getString(5),rst.getString(4),rst.getString(6),rst.getString(7),rst.getString(3));
			}
			
			System.out.println(preparedStatement);
			// Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	

	
	@Override
	public Customer searchCustomerById(String id) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Customer WHERE customerId=?")) {
			preparedStatement.setString(1, id);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				System.out.println("Customer = "+ new Customer(rst.getString(1),rst.getString(2),rst.getString(5),rst.getString(4),rst.getString(6),rst.getString(7),rst.getString(3)).toString());
				return new Customer(rst.getString(1),rst.getString(2),rst.getString(5),rst.getString(4),rst.getString(6),rst.getString(7),rst.getString(3));
			}
			
			System.out.println(preparedStatement);
			// Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}
	
	

}
