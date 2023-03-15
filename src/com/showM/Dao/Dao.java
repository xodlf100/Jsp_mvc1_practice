package com.showM.Dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.showM.Dto.Dto;

public class Dao {
	
	Connection conn;
	ResultSet rs;
	PreparedStatement pstmt;
	
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String id = "jsp";
	String pw = "1234";
	
	
	//디비연결
	public void getCon() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Dto> select() {
		List<Dto> dto = new ArrayList<>();
		getCon();
		
		String sql = "select * from showm";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Dto dtoo = new Dto();
				dtoo.setIdx(rs.getInt(1));
				dtoo.setPicture(rs.getString(2));
				dtoo.setTitle(rs.getString(3));
				dtoo.setContents(rs.getString(4));
				dtoo.setPrice(rs.getInt(5));
				
				dto.add(dtoo);
			}
			conn.close();
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public static void main (String[] args) {
		Dao dao = new Dao();
		dao.getCon();
	}
}
