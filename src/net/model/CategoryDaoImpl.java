package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.dao.CategoryDao;
import net.entity.Brand;
import net.entity.Category;
import net.utils.JDBCUtils;

public class CategoryDaoImpl implements CategoryDao{
	
	// Insert New Category
	@Override
	public boolean saveCategory(Category c){
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Category (categoryId,categoryName) VALUES (?,?);")) {
			preparedStatement.setString(1, c.getCategoryId());
			preparedStatement.setString(2, c.getCategoryName());
			
			System.out.println(preparedStatement);
			// Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	// Update Category
	@Override
	public boolean updateCategory(Category c) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Category SET categoryName=? WHERE categoryId=?;")) {
			preparedStatement.setString(1, c.getCategoryName());
			preparedStatement.setString(2, c.getCategoryId());		
			System.out.println(preparedStatement);
			// Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	// Delete Category
	@Override
	public boolean deleteCategory(String id) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE from Category where categoryId=?")) {
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

	// View Category on Table
	@Override
	public List<Category> getCategoryDetails() {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Category")) {
			ResultSet rst = preparedStatement.executeQuery();
			List<Category>category = new ArrayList<>();
			while(rst.next()) {
				category.add(new Category(rst.getString(1),rst.getString(2)));
			}
			System.out.println(preparedStatement);
			// Execute the query or update query
			return category;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	// Search Category by Name
	@Override
	public Category searchCategoryByName(String name) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Category WHERE categoryName=?")) {
			preparedStatement.setString(1, name); 
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				return new Category(rst.getString(1),rst.getString(2));
			}
			System.out.println(preparedStatement);
			// Execute the query or update query
			return null;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	// Generate Category
	@Override
	public String generateCategoryCode() {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT categoryId from Category order by categoryId DESC LIMIT 1")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				int temp = Integer.parseInt(rst.getString(1).split("-")[1]);
				temp = temp+1;
				if(temp<=9) {
					System.out.println("C-00"+temp);
					return "CAT-00"+temp;
				}else if(temp<=99) {
					System.out.println("C-0"+temp);
					return "CAT-0"+temp;
				}else {
					System.out.println("C-"+temp);
					return "CAT-"+temp;
				}
			}else {
				return "CAT-001";
			}
			// Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}
}
