package net.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import net.dao.OrderDetailsDao;
import net.entity.OrderDetails;
import net.utils.JDBCUtils;

public class OrderDetailsDaoImpl implements OrderDetailsDao{

	@Override
	public boolean saveOrderDetails(OrderDetails od) {
		try (Connection connection = JDBCUtils.getConnection();
				// Step 2:Create a statement using connection object
			PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO orderdetails VALUES(?,?,?,?)")) {
			preparedStatement.setString(1,od.getProductId());
			preparedStatement.setString(2, od.getOrderId());
			preparedStatement.setInt(3,od.getOrderQty());
			preparedStatement.setDouble(4,od.getTotalPrice());
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

}
