package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bean.UserBean;
import com.util.DbConnection;

public class UserDao implements IDao<UserBean>{


	// db insert query
	public void addUser(UserBean userBean) {
		try {

			DbConnection dbconnection = new DbConnection();
			Connection con = dbconnection.getConnection();
			PreparedStatement pstmt = con
					.prepareStatement("insert into users (uname,email,password) values (?,?,?)");
			pstmt.setString(1, userBean.getUserName());
			pstmt.setString(2, userBean.getEmail());
			pstmt.setString(3, userBean.getPassword());
			
			pstmt.executeUpdate();// insert

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// if user's credentials is correct -> then return all user detail
	// else return null
	public UserBean authenticate(String email) {
		UserBean userBean=null;
		try {
			DbConnection dbconnection = new DbConnection();
			Connection con = dbconnection.getConnection();
			System.out.println(con);
			
			PreparedStatement pstmt = con.prepareStatement("select * from users where email =?");
			pstmt.setString(1, email);
			System.out.println(email);
			System.out.println(pstmt);
			ResultSet rs = pstmt.executeQuery(); // record
			if (rs.next()) {
				userBean= new UserBean();
				userBean.setUserName(rs.getString("uname"));
				userBean.setEmail(rs.getString("email"));
				userBean.setUserId(rs.getInt("userId"));
				userBean.setPassword(rs.getString("password"));
				System.out.println(userBean.getEmail());

				// true
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userBean;
//		return null;
	}


	
}
