package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.dao.BrandDao;
import net.entity.Brand;
import net.utils.JDBCUtils;

public class BrandDaoImpl implements BrandDao{

	// Insert New Brand
	@Override
	public boolean saveBrand(Brand b){
		try (Connection connection = JDBCUtils.getConnection();
			// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO Brand (brandId,brandName) VALUES (?,?);")) {
				preparedStatement.setString(1, b.getBrandId());
				preparedStatement.setString(2, b.getBrandName());
				
				System.out.println(preparedStatement);
				//  Execute the query or update query
				if( preparedStatement.executeUpdate()>0)return true;
			} catch (SQLException e) {
				// process sql exception
				JDBCUtils.printSQLException(e);
			}
			return false;
	}

	// Update Brand
	@Override
	public boolean updateBrand(Brand b) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("UPDATE Brand SET brandName=? WHERE brandId=?;")) {
			preparedStatement.setString(1, b.getBrandName());
			preparedStatement.setString(2, b.getBrandId());		
			System.out.println(preparedStatement);
			//  Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	// Delete Brand
	@Override
	public boolean deleteBrand(String id) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("DELETE from Brand where brandId=?")) {
			preparedStatement.setString(1, id);
			
			System.out.println(preparedStatement);
			//  Execute the query or update query
			if( preparedStatement.executeUpdate()>0)return true;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return false;
	}

	// View Brand on table
	@Override
	public List<Brand> getBrandDetails() {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Brand")) {
			ResultSet rst = preparedStatement.executeQuery();
			List<Brand>brands = new ArrayList<>();
			while(rst.next()) {
				brands.add(new Brand(rst.getString(1),rst.getString(2)));
			}
			System.out.println(preparedStatement);
			//  Execute the query or update query
			return brands;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	// Search Brand
	@Override
	public Brand searchBrandByName(String name) {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Brand WHERE brandName=?")) {
			preparedStatement.setString(1, name); 
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				return new Brand(rst.getString(1),rst.getString(2));
			}
			System.out.println(preparedStatement);
			//  Execute the query or update query
			return null;
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

	// Generate Brand Id
	@Override
	public String generateBrandId() {
		try (Connection connection = JDBCUtils.getConnection();
				// Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("SELECT brandId from Brand order by brandId DESC LIMIT 1")) {
			System.out.println(preparedStatement);
			ResultSet rst = preparedStatement.executeQuery();
			if(rst.next()) {
				int temp = Integer.parseInt(rst.getString(1).split("-")[1]);
				temp = temp+1;
				if(temp<=9) {
					System.out.println("C-00"+temp);
					return "B-00"+temp;
				}else if(temp<=99) {
					System.out.println("C-0"+temp);
					return "B-0"+temp;
				}else {
					System.out.println("C-"+temp);
					return "B-"+temp;
				}
			}else {
				return "B-001";
			}
			//  Execute the query or update query
		} catch (SQLException e) {
			// process sql exception
			JDBCUtils.printSQLException(e);
		}
		return null;
	}

}
