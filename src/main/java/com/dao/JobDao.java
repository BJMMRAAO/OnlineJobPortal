package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dto.Jobs;
import com.dto.Registration;

public class JobDao {
	public static final String QUERY_1 = "INSERT INTO JOBPORTAL_JOBVIEWDETAILS(ID,TITLE,DESCRIPTION,CATEGORY,STATUS,LOCATION,NAME) VALUES(JOBPORTAL_SQ.NEXTVAL,?,?,?,?,?,?)";
	public static final String QUERY_2 = "SELECT * FROM JOBPORTAL_JOBVIEWDETAILS WHERE NAME=?";
	public static final String QUERY_3 = "SELECT * FROM JOBPORTAL_JOBVIEWDETAILS WHERE ID=?";
	public static final String QUERY_4 = "UPDATE JOBPORTAL_JOBVIEWDETAILS SET TITLE=?,DESCRIPTION=?,CATEGORY=?,STATUS=?,LOCATION=? WHERE ID=?";
	public static final String QUERY_5 = "DELETE FROM JOBPORTAL_JOBVIEWDETAILS WHERE ID=?";
	public static final String QUERY_6 = "INSERT INTO JOBPORTAL_REGISTRATIONDETAILS(ID,NAME,EMAIL,PASSWORD,QUALIFICATION,DESIGNATION,ROLE) VALUES(JOBPORTAL_SQ.NEXTVAL,?,?,?,?,?,?)";
	//public static final String QUERY_7 = "SELECT NAME FROM JOBPORTAL_REGISTRATIONDETAILS";
	
	
	private Connection conn;

	public JobDao(Connection conn) {

		this.conn = conn;
	}

	public boolean postJobs(Jobs j) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_1);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			
			ps.setString(6, j.getName());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public List<Jobs> getAllJobs(String name) {
		List<Jobs> list = new ArrayList<Jobs>();
		Jobs j = null;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_2);
	
			ps.setString(1,name);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j=new Jobs();
				System.out.println(rs.getString(2));
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Jobs getJobById(int id) {
		Jobs j = null;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_3);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j = new Jobs();
				j.setId(rs.getInt(1));
				j.setTitle(rs.getString(2));
				j.setDescription(rs.getString(3));
				j.setCategory(rs.getString(4));
				j.setStatus(rs.getString(5));
				j.setLocation(rs.getString(6));
				j.setPdate(rs.getTimestamp(7) + "");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return j;
	}

	public boolean updateJob(Jobs j) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_4);
			ps.setString(1, j.getTitle());
			ps.setString(2, j.getDescription());
			ps.setString(3, j.getCategory());
			ps.setString(4, j.getStatus());
			ps.setString(5, j.getLocation());
			ps.setInt(6, j.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
	public boolean deleteJobs(int id)
	{
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_5);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return f;
		
	}
	public boolean insertRegisrationDetails(Registration j) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_6);
			ps.setString(1, j.getName());
			ps.setString(2, j.getEmail());
			ps.setString(3, j.getPassword());
			ps.setString(4, j.getQualification());
			ps.setString(5, j.getDesignation());
			ps.setString(6, j.getRole());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}
	

}
