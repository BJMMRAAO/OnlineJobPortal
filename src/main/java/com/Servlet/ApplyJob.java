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

@WebServlet("/Apply")
public class ApplyJob extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			resp.setContentType("text/html");

			System.out.println("******************** In APPLY SRVLET");
			// To collect multiple types of requests from UI
			MultipartFormDataRequest nreq = new MultipartFormDataRequest(req);

			String firstName = nreq.getParameter("fname");
			String lastName = nreq.getParameter("lname");
			String dateOfBirth = nreq.getParameter("dob");
			String yearOfGraduation = nreq.getParameter("yog");
			int experience = Integer.parseInt(nreq.getParameter("exp"));
			String technologiesKnown = req.getParameter("tech");
			int phoneNumber = Integer.parseInt(req.getParameter("phone"));
			int alternatePhoneNumber = Integer.parseInt(req.getParameter("altphone"));
			String email = req.getParameter("email");
			String role = req.getParameter("role");
			String address =req.getParameter("add");
			String collegeName = req.getParameter("cname");

			UploadBean upb = new UploadBean();
			upb.setFolderstore("C:/store"); // folder location in the server machine file location.
			upb.setOverwrite(false);
			upb.setFilesizelimit(1024 * 1024);
			// complete file Upload process
			upb.store(nreq);

			
			  Vector<UploadParameters> vect=upb.getHistory(); ArrayList<String>
			  filesList=new ArrayList();
			  for(UploadParameters up:vect)
			  {
			  filesList.add("C:/store/"+up.getFilename()); 
			  }
			  Apply a = new Apply();
			  HttpSession session = req.getSession(false);
			  
			  a.setFirstName(firstName);
			  a.setLastName(lastName);
			  a.setDateOfBirth(dateOfBirth);
			  a.setYearOfGraduation(yearOfGraduation);
			  a.setExperience(experience);
			  a.setTechnologiesKnown(technologiesKnown);
			  a.setPhoneNumber(phoneNumber);
			  a.setAlternatePhoneNumber(alternatePhoneNumber);
			  a.setEmail(email);
			  a.setCollegeName(collegeName);
			  a.setResume(filesList.get(0));
			  a.setPhoto(filesList.get(1));
			 
			ApplyDao dao = new ApplyDao(DBconnect.getconn());
			boolean f = dao.ApplyJob(a);
			if (f) {
				session.setAttribute("succMsg", "Files are uploaded Successfully..Apply for more jobs");
				resp.sendRedirect("userFilterJobs.jsp");
			} else if (!f) {
				session.setAttribute("succMsg1", "Something went wrong..Pls try later");
				resp.sendRedirect("ApplyJob.jsp");
			} else {
				session.setAttribute("succMsg1", "Session timed out, pls login again");
				resp.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
