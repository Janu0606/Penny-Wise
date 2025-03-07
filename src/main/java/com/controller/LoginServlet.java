package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.UserBean;
import com.dao.UserDao;
import com.util.Bcrypt;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		UserDao userDao=new UserDao();
		UserBean userBean=userDao.authenticate(email);
		
		
		if(userBean==null) {
			response.sendRedirect("Login.jsp");
			System.out.println("incorect email");
		}else {
			Bcrypt bcrypt = new Bcrypt();
			
			if(bcrypt.checkPassword(password,userBean.getPassword())){
				response.sendRedirect("Home.jsp");
			}else {
				
				response.sendRedirect("Login.jsp");
				System.out.println("incorrect password");
				
			}
		}
	}

}
