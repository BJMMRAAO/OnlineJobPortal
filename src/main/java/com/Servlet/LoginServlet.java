package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.entity.Registration;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static String name = null;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String em = req.getParameter("email");
			String ps = req.getParameter("password");
			Registration r = new Registration();
			HttpSession session = req.getSession();
			PrintWriter pw = res.getWriter();

			Connection con = DBconnect.getconn();
			PreparedStatement pstmt = con.prepareStatement(
					"select NAME,ROLE,QUALIFICATION,DESIGNATION from JOBPORTAL_REGISTRATIONDETAILS where email=? and password=?");

			pstmt.setString(1, em);
			pstmt.setString(2, ps);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next() && rs.getString(2).equals("Admin")) {
				session.setAttribute("userobj", r);
				r.setName(rs.getString(1));
				r.setRole(rs.getString(2));
				r.setQualification(rs.getString(3));
				r.setDesignation(rs.getString(4));
				//name = rs.getString(1);
				res.sendRedirect("admin.jsp");
				

			}

			else if (rs.getString(2).equals("User")) {
				session.setAttribute("userobj", r);
				r.setName(rs.getString(1));
				r.setRole(rs.getString(2));
				r.setQualification(rs.getString(3));
				r.setDesignation(rs.getString(4));
				//name = rs.getString(1);
				res.sendRedirect("user.jsp");
			}

			else {
				pw.println("Invalid Username/Password");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*
	 * public String getAdminName() {
	 * 
	 * return name;
	 * 
	 * }
	 */

}
