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
import com.entity.Jobs;

@WebServlet("/addJob")
public class PostJobServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String title=req.getParameter("title");
			String location=req.getParameter("location");
			String category=req.getParameter("category");
			String status=req.getParameter("status");
			String desc=req.getParameter("desc");
			
			Jobs j=new Jobs();
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);
			
			HttpSession session=req.getSession();
			
			JobDao dao=new JobDao(DBconnect.getconn());
			boolean f=dao.postJobs(j);
			if(f)
			{
				session.setAttribute("succMsg", "Job Requirement Posted Successfully..");
				resp.sendRedirect("postjob.jsp");
			}else {
				session.setAttribute("succMsg", "Somethng went wrong..Pls try later");
				resp.sendRedirect("postjob.jsp");
			}
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
