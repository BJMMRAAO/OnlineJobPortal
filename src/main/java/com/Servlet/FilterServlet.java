
package com.Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.entity.Jobs;

@WebServlet("/filter")
public class FilterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static final String QUERY_8= "SELECT TITLE,DESCRIPTION,CATEGORY,STATUS,LOCATION,PDATE FROM JOBPORTAL_JOBVIEWDETAILS WHERE CATEGORY=? AND LOCATION=?";

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String location = req.getParameter("location");			
			String category = req.getParameter("category");
			
			
			HttpSession session = req.getSession(false);
			PrintWriter pw = res.getWriter();

			Connection con = DBconnect.getconn();
			PreparedStatement psmt = con.prepareStatement(QUERY_8);
			
			psmt.setString(2, location);
			psmt.setString(1, category);
			ResultSet rs = psmt.executeQuery();
			
			List<Jobs> list = new ArrayList<Jobs>();
			Jobs j = null;
			
			boolean f=false;
			while (rs.next()) {
				f=true;
				j=new Jobs();
				j.setTitle(rs.getString(1));
				j.setDescription(rs.getString(2));
				j.setCategory(rs.getString(3));
				j.setStatus(rs.getString(4));
				j.setLocation(rs.getString(5));
				j.setPdate(rs.getString(6));
				
				list.add(j);
			}
			if(f) {
				
				session.setAttribute("filterjob", list);
				
				res.sendRedirect("filteredJob.jsp");
			}
			else {
				pw.println("<h3 style='text-align:center; color:red;'>NO Records Found</h3>");
				
				pw.println("<center><a href='userFilterJobs.jsp'>back to search</a></center>");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

