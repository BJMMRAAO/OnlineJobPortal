package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.JobDao;
import com.dto.Jobs;

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
			HttpSession session=req.getSession(false);
			String name = (String)session.getAttribute("name");
			
//			ServletContext sc = getServletContext();
			//String name = (String)sc.getAttribute("name");
			
			
			j.setTitle(title);
			j.setLocation(location);
			j.setCategory(category);
			j.setStatus(status);
			j.setDescription(desc);
			j.setName(name);
			

			JobDao dao=new JobDao(DBconnect.getconn());
			boolean f=dao.postJobs(j);
			if(f)
			{
				session.setAttribute("succMsg", "Job Requirement Posted Successfully..");
				resp.sendRedirect("postjob.jsp");
			}
			else if(name!=null){
				session.setAttribute("succMsg1", "Something went wrong..Pls try later");
				resp.sendRedirect("postjob.jsp");
			}
			else {
				session.setAttribute("succMsg1", "Session timed out, pls login again");
				resp.sendRedirect("login.jsp");
			}
			
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	

}
