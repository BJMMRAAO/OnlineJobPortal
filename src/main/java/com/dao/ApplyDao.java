package com.dao;

/*CREATE TABLE "SYSTEM"."JOBPORTAL_APPLYJOB" 
(	"ID" NUMBER NOT NULL ENABLE, 
	"FIRSTNAME" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"LASTNAME" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"DATEOFBIRTH" DATE NOT NULL ENABLE, 
	"YEAROFGRADUATION" DATE NOT NULL ENABLE, 
	"EXPERIENCE" NUMBER NOT NULL ENABLE, 
	"TECHNOLOGIESKNOWN" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"PHONENUMBER" NUMBER(14,0) NOT NULL ENABLE, 
	"ALTERNATEPHNUMBER" NUMBER(14,0) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(40 BYTE) NOT NULL ENABLE, 
	"RESUME" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"PHOTO" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"ADDRESS" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"ROLE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"COLLEGENAME" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "JOBPORTAL_APPLYJOB_PK" PRIMARY KEY ("ID"))*/
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.dto.Apply;

public class ApplyDao {
	public static final String QUERY_1 = "INSERT INTO JOBPORTAL_APPLYJOB(FIRSTNAME,LASTNAME,DATEOFBIRTH,YEAROFGRADUATION,EXPERIENCE,TECHNOLOGIESKNOWN,"
										+ "PHONENUMBER,ALTERNATEPHNUMBER,EMAIL,RESUME,PHOTO,ADDRESS,ROLE,COLLEGENAME) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private Connection conn;

	public ApplyDao(Connection conn) {
		this.conn = conn;
	}
	
	public boolean ApplyJob(Apply a) {
		boolean f = false;
		try {
			PreparedStatement ps = conn.prepareStatement(QUERY_1);
			ps.setString(1, a.getFirstName());
			ps.setString(2, a.getLastName());
			ps.setString(3, a.getDateOfBirth());	
			ps.setString(4, a.getYearaOfGraduation());	
			ps.setInt(5, a.getExperience());
			ps.setString(6, a.getTechnologiesKnown());
			ps.setInt(7, a.getPhoneNumber());
			ps.setInt(8, a.getAlternatePhoneNumber());
			ps.setString(9, a.getEmail());
			ps.setString(10, a.getResume());
			ps.setString(11, a.getPhoto());
			ps.setInt(12, a.getAddress());
			ps.setInt(13, a.getRole());
			ps.setString(14, a.getCollegeName());
			
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
