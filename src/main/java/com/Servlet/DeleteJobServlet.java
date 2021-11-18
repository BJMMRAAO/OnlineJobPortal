package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDao;
@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try{
			int id = Integer.parseInt(req.getParameter("id"));
			
			HttpSession session = req.getSession();

			JobDao dao = new JobDao(DBconnect.getconn());
			boolean f = dao.deleteJobs(id);
			if (f) {
				session.setAttribute("succMsg", "Job Deleted Successfully..");
				resp.sendRedirect("viewjobs.jsp");
			} else {
				session.setAttribute("succMsg", "Somethng went wrong..Pls try later");
				resp.sendRedirect("viewjobs.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
