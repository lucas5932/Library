package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oreilly.servlet.MultipartRequest;

public class bookDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static bookDAO bdao;
	public static bookDAO getInstance() {
		if(bdao == null) {
			bdao = new bookDAO();
		}
		return bdao;
	}
	
	private bookDAO() {
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
	
	public int insertBook(MultipartRequest mr) {
		getConnection();
		String sql = "insert into book values(?,?,?,?,?,?,?,?,?,?,'°¡´É')";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("title"));
			ps.setString(2, mr.getParameter("writer"));
			ps.setString(3, mr.getParameter("publisher"));
			ps.setString(4, mr.getParameter("page"));
			ps.setString(5, mr.getParameter("isbn"));
			ps.setString(6, mr.getParameter("p_date"));
			ps.setString(7, mr.getFilesystemName("b_image"));
			ps.setString(8, mr.getParameter("s_code"));
			ps.setString(9, mr.getParameter("h_code"));
			ps.setString(10, mr.getParameter("w_code"));
			
			cnt = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//insertBook
	
	public bookDTO makeNumber(String s_code, String title) {
		getConnection();
		String sql_h = "select max(h_code) as height from book where s_code = ?";
		String sql_w = "select max(w_code) as width from book where s_code=? and h_code=?";
		bookDTO bdto = new bookDTO();
		try {
			ps = conn.prepareStatement(sql_h);
			ps.setString(1, s_code);
			rs = ps.executeQuery();
			if(rs.next()) {
				bdto.setTitle(title);
				bdto.setH_code(rs.getInt("height"));
				ps = conn.prepareStatement(sql_w);
				ps.setString(1, s_code);
				ps.setString(2, String.valueOf(rs.getInt("height")));
				rs = ps.executeQuery();
				if(rs.next()) {
					bdto.setW_code(rs.getInt("width"));
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return bdto;
	}//lastNumber
	
	public void updateCode(String title, int h_code, int w_code) {
		getConnection();
		String sql = "update book set h_code = ?, w_code = ? where title = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, String.valueOf(h_code));
			ps.setString(2, String.valueOf(w_code));
			ps.setString(3, title);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}//updateCode
	
	public int countBook() {
		getConnection();
		String sql = "select count(*) as cnt from book";
		int cnt = 0;
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//countBook
	
	public int countBookBysub(String s_code) {
		getConnection();
		String sql ="select count(*) as cnt from book where s_code = ?";
		int cnt = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_code);
			rs = ps.executeQuery();
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//countBookBysub
	
	public ArrayList<bookDTO> getBook() {
		getConnection();
		String sql = "select * from book";
		ArrayList<bookDTO> list = new ArrayList<bookDTO>();
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO bdto = new bookDTO();
				bdto.setTitle(rs.getString("title"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setPublisher(rs.getString("publisher"));
				bdto.setPage(rs.getString("page"));
				bdto.setIsbn(rs.getString("isbn"));
				bdto.setP_date(rs.getString("p_date"));
				bdto.setB_image(rs.getString("b_image"));
				bdto.setS_code(rs.getString("s_code"));
				bdto.setH_code(rs.getInt("h_code"));
				bdto.setW_code(rs.getInt("w_code"));
			
				list.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return list;
	}//getBook
	
	public ArrayList<bookDTO> getBook(int startRow, int endRow) {
		getConnection();
		String sql = "select title, writer, publisher, page, isbn, p_date, b_image, s_code, h_code, w_code, possible from("
				+ "select rownum as rank, title, writer, publisher, page, isbn, p_date, b_image, s_code, h_code, w_code, possible from("
				+ "select * from book order by title))where rank between ? and ?";
		ArrayList<bookDTO> list = new ArrayList<bookDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO bdto = new bookDTO();
				bdto.setTitle(rs.getString("title"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setPublisher(rs.getString("publisher"));
				bdto.setPage(rs.getString("page"));
				bdto.setIsbn(rs.getString("isbn"));
				bdto.setP_date(rs.getString("p_date"));
				bdto.setB_image(rs.getString("b_image"));
				bdto.setS_code(rs.getString("s_code"));
				bdto.setH_code(rs.getInt("h_code"));
				bdto.setW_code(rs.getInt("w_code"));
				bdto.setPossible(rs.getString("possible"));
			
				list.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return list;
	}//getBook2
	
	public ArrayList<bookDTO> getBookBysub(String s_code) {
		getConnection();
		String sql = "select * from book where s_code = ?";
		ArrayList<bookDTO> list = new ArrayList<bookDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_code);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO bdto = new bookDTO();
				bdto.setTitle(rs.getString(1));
				bdto.setWriter(rs.getString(2));
				bdto.setPublisher(rs.getString(3));
			
				list.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return list;
	}//getBookBysub
	public ArrayList<bookDTO> getBookByTitle(int startRow, int endRow, String title) {
		getConnection();
		String sql = "select title, writer, publisher, page, isbn, p_date, b_image, s_code, h_code, w_code, possible from("
				+ "select rownum as rank, title, writer, publisher, page, isbn, p_date, b_image, s_code, h_code, w_code, possible from("
				+ "select * from book where title like ? order by title))where rank between ? and ?";
		ArrayList<bookDTO> list = new ArrayList<bookDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, '%'+title+'%');
			ps.setInt(2, startRow);
			ps.setInt(3, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				bookDTO bdto = new bookDTO();
				
				bdto.setTitle(rs.getString("title"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setPublisher(rs.getString("publisher"));
				bdto.setPage(rs.getString("page"));
				bdto.setIsbn(rs.getString("isbn"));
				bdto.setP_date(rs.getString("p_date"));
				bdto.setB_image(rs.getString("b_image"));
				bdto.setS_code(rs.getString("s_code"));
				bdto.setH_code(rs.getInt("h_code"));
				bdto.setW_code(rs.getInt("w_code"));
				bdto.setPossible(rs.getString("possible"));
			
				list.add(bdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return list;
	}//getBookByTitle
	
	public bookDTO getBookByTitle(String title) {
		getConnection();
		String sql = "select * from book where title = ?";
		bookDTO bdto = new bookDTO();
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			rs = ps.executeQuery();
			while(rs.next()) {
				
				bdto.setTitle(rs.getString("title"));
				bdto.setWriter(rs.getString("writer"));
				bdto.setPublisher(rs.getString("publisher"));
				bdto.setPage(rs.getString("page"));
				bdto.setIsbn(rs.getString("isbn"));
				bdto.setP_date(rs.getString("p_date"));
				bdto.setB_image(rs.getString("b_image"));
				bdto.setS_code(rs.getString("s_code"));
				bdto.setH_code(rs.getInt("h_code"));
				bdto.setW_code(rs.getInt("w_code"));
				bdto.setPossible(rs.getString("possible"));
			
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return bdto;
	}//getBookByTitle
	
	public String poss(String title) {
		getConnection();
		String sql ="select possible from book where title = ?";
		String p = "";
		try{
			ps = conn.prepareStatement(sql);
			ps.setString(1, title);
			rs = ps.executeQuery();
			while(rs.next()) {
				p = rs.getString("possible");
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return p;
	}//poss
	
	public int updateP(String title, String str) {
		getConnection();
		int cnt = -1;
		String sql = "update book set possible=? where title=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, str);
			ps.setString(2, title);
			cnt = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//updateP
	
	public int countBook(String title) {
		getConnection();
		String sql = "select count(*) as cnt from book where title like ?";
		int cnt = 0;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, '%'+title+'%');
			rs = ps.executeQuery();
			while(rs.next()) {
				cnt = rs.getInt("cnt");
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}return cnt;
	}//countBook
}
