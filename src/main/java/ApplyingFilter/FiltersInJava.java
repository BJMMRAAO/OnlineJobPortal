package ApplyingFilter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebFilter("/*")
public class FiltersInJava extends HttpFilter {
    
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
		
		PrintWriter pw= resp.getWriter();
		  String browser=req.getHeader("user-agent"); 
		  if(browser.contains("Chrome")) {
			  System.out.println(browser);
		  chain.doFilter(req, resp);
		  } else {
			  System.out.println("in else");
		  pw.println("<b>Pls give the request through chrome browser</b>");
		  }
		 
	}

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	
	

}
