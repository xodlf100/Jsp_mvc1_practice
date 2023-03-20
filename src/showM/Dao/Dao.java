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

	String url = "jdbc:mariadb://localhost:3306/xodlf100";
	String id = "xodlf100";
	String pw = "roshadk12";
	
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
			while (rs.next()) {
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
			String sql = "insert into showm_join values(?,?,?,?)";
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
			String sql = "select * from showm_join";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				JoinDto j = new JoinDto();
				j.setId(rs.getString(1));
				j.setPassword(rs.getString(2));
				j.setName(rs.getString(3));
				j.setEmail(rs.getString(4));
				jo.add(j);
			}
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jo;
	}
	
	public int login(String id, String password) {
		int result = 0;
		getCon(); //드라이버연결
		try {
			//쿼리문작성
			String SQL = "select count(*) from showm_join where id = ? and password = ?";
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			//여러개 -while //한개 - if
			if(rs.next()) {
				result = rs.getInt(1);
			con.close();
			pstmt.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public JoinDto getMember(String id) {
		getCon();
		JoinDto dto = null; //객체 레퍼런스 생성
		//왜 null인가? 정보가 생성되는 시점은 rs에 있을때이다.
		//따라서 rs가 없을땐 굳이 만들필요가 없다.
		try {
			String sql = "select * from showm_join where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new JoinDto();
				dto.setId(rs.getString(1));
				dto.setPassword(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}
	
	public void myUpdate(JoinDto dto) {
		try {
			getCon();
			String sql = "update showm_join set password = ?, name = ?, email = ? where id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getPassword());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(4, dto.getId());
			pstmt.executeUpdate(); // 정보를 전송만 하면 되므로 rs 그릇이 필요 없다.
		} catch(Exception e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		Dao dao = new Dao();
//		dao.getCon();
	}
}
