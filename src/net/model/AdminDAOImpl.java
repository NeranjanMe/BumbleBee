package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.dao.AdminDao;
import net.entity.Admin;
import net.utils.JDBCUtils;

public class AdminDAOImpl {

	
	// Function use to Login Customer
		public boolean checkAdminByUserNameAndPassword(String userName, String password) {
			try (Connection connection = JDBCUtils.getConnection();
					// Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM Admin WHERE adminName=? AND password=?")) {
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
		
}
