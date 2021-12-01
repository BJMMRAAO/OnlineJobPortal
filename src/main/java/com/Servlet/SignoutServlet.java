package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/signout")
public class SignoutServlet extends HttpServlet {
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		{
			HttpSession session = req.getSession(false);
			
			 // Destroys the session for this user.
			 if (session != null)
			 {
			   session.invalidate();
			   resp.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
			 // Redirects back to the initial page.
			 resp.sendRedirect("login.jsp");
			 return;
			}
		}
	}
}
