package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.dao.ItemDao;
import net.entity.Item;
import net.utils.JDBCUtils;

public class ItemDaoImpl implements ItemDao{

	@Override
	public boolean saveItem(Item i) throws ClassNotFoundException{
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Product (productId,productName,qtyOnHand,unitPrice,productStatus,productCategory,productBrand) VALUES (?,?,?,?,?,?,?);")) {
			preparedStatement.setString(1, i.getId());
			preparedStatement.setString(2, i.getName());
			preparedStatement.setInt(3, i.getQty());
			preparedStatement.setDouble(4, i.getUnitPrice());
			preparedStatement.setInt(5, i.getStatus());
			preparedStatement.setString(6, i.getCategory());
			preparedStatement.setString(7, i.getBrand());
			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	@Override
	public boolean updateItem(Item i) throws ClassNotFoundException {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Product SET productName=?,qtyOnHand=?,unitPrice=?,productStatus=?,productCategory=?,productBrand=? WHERE productId=?;")) {
			preparedStatement.setString(1, i.getName());
			preparedStatement.setInt(2, i.getQty());
			preparedStatement.setDouble(3, i.getUnitPrice());
			preparedStatement.setInt(4, i.getStatus());
			preparedStatement.setString(5, i.getCategory());
			preparedStatement.setString(6, i.getBrand());
			preparedStatement.setString(7, i.getId());
			
			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	@Override
	public boolean deleteItem(String itemId) throws ClassNotFoundException {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE from Product where productId=?")) {
			preparedStatement.setString(1, itemId);
			
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	@Override
	public List<Item> getAllItems() {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Product")) {
			ResultSet rst = preparedStatement.executeQuery();
			List<Item>items = new ArrayList<>();
			while(rst.next()) {
				items.add(new Item(rst.getString(1),rst.getString(2),rst.getInt(3),rst.getDouble(4),rst.getInt(5),rst.getString(6),rst.getString(7)));
			}
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			return items;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	@Override
	public Item searchItem(String id) {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Product WHERE productId=?")) {
			preparedStatement.setString(1, id);	
			ResultSet rst = preparedStatement.executeQuery();
			
			while(rst.next()) {
				return new Item(rst.getString(1),rst.getString(2),rst.getInt(3),rst.getDouble(4),rst.getInt(5),rst.getString(6),rst.getString(7));
			}
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			return null;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	@Override
	public String generateItemCode() {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT productId from Product order by productId DESC LIMIT 1")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				int temp = Integer.parseInt(rst.getString(1).split("-")[1]);
				temp = temp+1;
				if(temp<=9) {
					System.out.println("C-00"+temp);
					return "P-00"+temp;
				}else if(temp<=99) {
					System.out.println("C-0"+temp);
					return "P-0"+temp;
				}else {
					System.out.println("C-"+temp);
					return "P-"+temp;
				}
			}else {
				return "P-001";
			}
			// Step 3: Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

}
