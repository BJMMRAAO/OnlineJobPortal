package com.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBconnect;
import com.dao.ApplyDao;
import com.dto.Apply;

import javazoom.upload.MultipartFormDataRequest;
import javazoom.upload.UploadBean;
import javazoom.upload.UploadParameters;

@WebServlet("/ApplyJob")
public class ApplyJob extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html");
			
			Apply a=new Apply();
			HttpSession session=req.getSession(false);
			
			//To collect multiple types of requests from UI			
			MultipartFormDataRequest nreq=new MultipartFormDataRequest(req);
			
			String firstName=nreq.getParameter("firstName");
			String lastName=nreq.getParameter("lastName");
			String dateOfBirth=nreq.getParameter("dateOfBirth");
			String yearaOfGraduation=nreq.getParameter("yearaOfGraduation");
			String experience=nreq.getParameter("experience");
			String technologiesKnown=req.getParameter("technologiesKnown");
			String phoneNumber=req.getParameter("phoneNumber");
			String alternatePhoneNumber=req.getParameter("alternatePhoneNumber");
			String email=req.getParameter("email");
			
			String collegeName=req.getParameter("collegeName");
			
			 UploadBean upb=new UploadBean();
			 upb.setFolderstore("C:/store");  // folder location in the server machine file location.
			 upb.setOverwrite(false);
			 upb.setFilesizelimit(1024*1024);
			 //complete file Upload process
			 upb.store(nreq);
			
			 Vector<UploadParameters> vector=upb.getHistory();
		       ArrayList<String> filesList=new ArrayList();
		      vector.forEach(up->{
		    	  filesList.add("E:/store/"+up.getFilename());
		      });
			

			ApplyDao dao=new ApplyDao(DBconnect.getconn());
			boolean f=dao.ApplyJob(a);
			if(f)
			{
				session.setAttribute("succMsg", "Files are uploaded Successfully..Apply for more jobs");
				resp.sendRedirect("userFilterJobs.jsp");
			}
			else if(!f){
				session.setAttribute("succMsg1", "Something went wrong..Pls try later");
				resp.sendRedirect("ApplyJob.jsp");
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
