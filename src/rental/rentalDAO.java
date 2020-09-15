package rental;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class rentalDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static rentalDAO rdao;
	public static rentalDAO getInstance() {
		if(rdao == null) {
			rdao = new rentalDAO();
		}
		return rdao;
	}
	
	private rentalDAO() {
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
	
	public ArrayList<rentalDTO> getRental(String id) {
		getConnection();
		ArrayList<rentalDTO> list = new ArrayList<rentalDTO>();
		String sql ="select * from rental where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			while(rs.next()) {
				rentalDTO rdto = new rentalDTO();
				rdto.setId(rs.getString("id"));
				rdto.setTitle(rs.getString("title"));
				rdto.setRental_d(rs.getDate("rental_d"));
				rdto.setReturn_d(rs.getDate("return_d"));
				rdto.setReturn_ex(rs.getInt("return_ex"));
				
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
	}//getRetal
	
	public rentalDTO getDataByTitle(String id, String title) {
		getConnection();
		String sql ="select * from rental where id = ? and title =?";
		rentalDTO rdto = new rentalDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, title);
			rs = ps.executeQuery();
			if(rs.next()) {
				rdto.setId(rs.getString("id"));
				rdto.setTitle(rs.getString("title"));
				rdto.setRental_d(rs.getDate("rental_d"));
				rdto.setReturn_d(rs.getDate("return_d"));
				rdto.setReturn_ex(rs.getInt("return_ex"));
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
		}return rdto;
	}//getDataByTitle
	
	public int  rentExt(String id, String title, int opt) {
		int cnt = -1;
		getConnection();
		String sql  = "update rental set return_d = return_d +?, return_ex = return_ex +1 where id=? and title=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, opt);
			ps.setString(2, id);
			ps.setString(3, title);
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
	}//rentExt
	
	public int delData(String id, String title) {
		int cnt = -1;
		getConnection();
		String sql = "delete from rental where id = ? and title =?";
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
	}//delData
	
	public int addRental(String id, String title) {
		getConnection();
		String sql = "insert into rental(id, title) values(?, ?)";
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
	}//addRental
	
	public int countRentById(String id) {
		int cnt = 0;
		getConnection();
		String sql = "select count(*) as cnt from rental where id =?";
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
		}
		return cnt; 
	}//countRentById
}
