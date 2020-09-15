package login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class memberDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password ="jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static memberDAO rdao;
	public static memberDAO getInstance(){
		if(rdao == null) {
			rdao = new memberDAO();
		}
		return rdao;
	}
	private memberDAO() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}//getConnection
	
	public int insertData(memberDTO rdto) {
		getConnection();
		String sql = "insert into member values(?,?,?,?,?,?)";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, rdto.getId());
			ps.setString(2, rdto.getPwd());
			ps.setString(3, rdto.getName());
			ps.setString(4, rdto.getBirth());
			ps.setString(5, rdto.getGender());
			ps.setString(6, rdto.getPhone());
			cnt = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//insertData
	
	public boolean dupl_check(String userid) {
		getConnection();
		String sql = "select id from member where id = ?";
		boolean check = true;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			while(rs.next()) {
				check = false;//중복된 아이디
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return check;
	}//dupl_check
	
	public boolean getLogin(String id, String pwd) {
		getConnection();
		String sql = "select id, pwd from member where id = ? and pwd = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			rs = ps.executeQuery();
			while(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return false;
	}//getLogin
	
	public String findId(String name, String phone) {
		getConnection();
		String sql = "select id from member where name=? and phone=?";
		String id="";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, phone);
			rs = ps.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return id;
	}
	
	public String findPwd(String id, String phone) {
		getConnection();
		String sql = "select pwd from member where id = ? and phone = ?";
		String pwd = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, phone);
			rs = ps.executeQuery();
			while(rs.next()) {
				pwd = rs.getString("pwd");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return pwd;
	}//findPwd
	
	public memberDTO getData(String id) {
		getConnection();
		String sql = "select * from member where id = ?";
		memberDTO rdto = new memberDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				rdto.setId(rs.getString("id"));
				rdto.setPwd(rs.getString("pwd"));
				rdto.setName(rs.getString("name"));
				rdto.setBirth(rs.getString("birth"));
				rdto.setGender(rs.getString("gender"));
				rdto.setPhone(rs.getString("phone"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return rdto;
	}//getData
	
	public int modifyData(memberDTO rdto) {
		getConnection();
		String sql = "update member set pwd = ?, birth =?, gender=?, phone=? where id =?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, rdto.getPwd());
			ps.setString(2, rdto.getBirth());
			ps.setString(3, rdto.getGender());
			ps.setString(4, rdto.getPhone());
			ps.setString(5, rdto.getId());
			
			cnt = ps.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//modifyData
	
	public ArrayList<memberDTO> getAllData() {
		getConnection();
		ArrayList<memberDTO> list = new ArrayList<memberDTO>();
		String sql = "select * from member";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				memberDTO rdto = new memberDTO();
				rdto.setId(rs.getString("id"));
				rdto.setPwd(rs.getString("pwd"));
				rdto.setName(rs.getString("name"));
				rdto.setBirth(rs.getString("birth"));
				rdto.setGender(rs.getString("gender"));
				rdto.setPhone(rs.getString("phone"));
				
				list.add(rdto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}return list;
	}//getAllData
}
