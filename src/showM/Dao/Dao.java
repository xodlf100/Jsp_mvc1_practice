package showM.Dao;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import showM.Dto.Dto;
import showM.Dto.JoinDto;

public class Dao {
	
	Connection con;
	ResultSet rs;
	PreparedStatement pstmt;
	
	String url = "jdbc:mariadb://localhost:3307/jspdb";
	String id = "jsp";
	String pw = "1234";
	
	
	//디비연결
	public void getCon() {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			con = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<Dto> select() {
		List<Dto> dto = new ArrayList<>();
		getCon();
		
		String sql = "select * from showm";
		try {
			pstmt = con.prepareStatement(sql);
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
			con.close();
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void join(JoinDto joinDto) {
		try {
			getCon();
			String sql = "insert into showM_join values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, joinDto.getId());
			pstmt.setString(2, joinDto.getPassword());
			pstmt.setString(3, joinDto.getName());
			pstmt.setString(4, joinDto.getEmail());
			pstmt.executeUpdate();
			con.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<JoinDto> check() {
		List<JoinDto> jo = new ArrayList<>();   
		try {
			getCon();
			String sql = "select * from showM_join";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				JoinDto j = new JoinDto();
				j.setId(rs.getString(1));
				j.setPassword(rs.getString(2));
				j.setName(rs.getString(3));
				j.setEmail(rs.getString(4));
				jo.add(j);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jo;
	}
	
	public static void main (String[] args) {
		Dao dao = new Dao();
		dao.getCon();
	}
}
