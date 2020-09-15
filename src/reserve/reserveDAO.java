package reserve;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import admin.bookDAO;

public class reserveDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static reserveDAO rdao;
	public static reserveDAO getInstance() {
		if(rdao == null) {
			rdao = new reserveDAO();
		}
		return rdao;
	}
	
	private reserveDAO() {
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
	
	public ArrayList<reserveDTO> getReserve(String id) {
		getConnection();
		ArrayList<reserveDTO> list = new ArrayList<reserveDTO>();
		String sql = "select * from reserve where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				reserveDTO rdto = new reserveDTO();
				rdto.setId(rs.getString("id"));
				rdto.setTitle(rs.getString("title"));
				
				list.add(rdto);
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
		}return list;
	}//getReserve
	
	
	public int addReserve(String id, String title) {
		getConnection();
		String sql = "insert into reserve values(?,?)";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
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
	}//addReserve
	
	public boolean duplReserve(String id,String title) {
		getConnection();
		String sql = "select * from reserve where id =? and title =?";
		boolean p = false;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
			rs = ps.executeQuery();
			if(rs.next()) {
				p = true;
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
		}return p;
	}//duplReserve
	
	public int delReserve(String id, String title) {
		getConnection();
		int cnt = -1;
		String sql ="delete from reserve where id = ? and title=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
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
	}//delReserve
	
	public int countReserve(String id) {
		getConnection();
		int cnt = 0;
		String sql = "select count(*) as cnt from reserve where id =?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
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
		}return cnt;
	}
}
