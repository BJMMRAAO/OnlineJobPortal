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
import com.dto.Jobs;

@WebServlet("/update")
public class UpdateJobservlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String title = req.getParameter("title");
			String location = req.getParameter("location");
			String category = req.getParameter("category");
			String status = req.getParameter("status");
			String desc = req.getParameter("desc");

			Jobs j = new Jobs();
			j.setId(id);
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);

			HttpSession session = req.getSession(false);

			JobDao dao = new JobDao(DBconnect.getconn());
			boolean f = dao.updateJob(j);
			if (f) {
				session.setAttribute("succMsg", "Job Updated Successfully..");
				resp.sendRedirect("viewjobs.jsp");
			} else {
				session.setAttribute("succMsg1", "Something went wrong..Pls try later");
				resp.sendRedirect("viewjobs.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
