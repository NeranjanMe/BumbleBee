package net.dao;

import java.util.List;

import net.entity.Customer;

public interface CustomerDao {

	public boolean saveCustomer(Customer c) throws ClassNotFoundException; // Register Customer
	public boolean updateCustomer(Customer c) throws ClassNotFoundException; // Update Customer
	public boolean deleteCustomer(String id) throws ClassNotFoundException; // Delete Customer
	public List<Customer> getAllCustomers();
	public Customer searchCustomer(String userName);
	public Customer searchCustomerById(String id);
	public boolean checkCustomerByUserNameAndPassword(String userName,String password);
	public String generateCustomerId();
}
