package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dto.Jobs;
import com.dto.Registration;

public class UserDao {
	public static final String QUERY_8 = "SELECT * FROM JOBPORTAL_JOBVIEWDETAILS WHERE CATEGORY=? AND LOCATION=?";

	private Connection conn;

	public UserDao(Connection conn) {

		this.conn = conn;
	}

	public List<Jobs> filterJobs(Jobs j) {
		List<Jobs> list = new ArrayList<Jobs>();

		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_8);
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
				list.add(j);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
 
