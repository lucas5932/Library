package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class noticeDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password = "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static noticeDAO ndao;
	public static noticeDAO getInstance() {
		if(ndao == null) {
			ndao = new noticeDAO();
		}
		return ndao;
	}
	
	private noticeDAO() {
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
	}
	
	public int insertN(noticeDTO ndto) {
		getConnection();
		String sql = "insert into notice(important, num, title,content) values(?,n_seq.nextval,?,?)";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ndto.getImportant());
			ps.setString(2, ndto.getTitle());
			ps.setString(3, ndto.getContent());
			cnt = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}return cnt;
	}//insertN
	
	public int updateN(noticeDTO ndto) {
		getConnection();
		String sql = "update notice set important = ?, title=?, content=? where num =?";
		int cnt = -1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, ndto.getImportant());
			ps.setString(2, ndto.getTitle());
			ps.setString(3, ndto.getContent());
			ps.setInt(4, ndto.getNum());
			cnt = ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) {
					ps.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}return cnt;
	}
	
	public ArrayList<noticeDTO> getAllN(int startRow, int endRow) {
		getConnection();
		String sql = "select important, num, title, reg_date, readcount from("
				+ " select rownum as rank, important, num, title, reg_date, readcount from("
				+ " select important, num, title, reg_date, readcount from notice order by important, num desc)) where rank between ? and ?";
		ArrayList<noticeDTO> list = new ArrayList<noticeDTO>();
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startRow);
			ps.setInt(2, endRow);
			rs = ps.executeQuery();
			while(rs.next()) {
				noticeDTO ndto = new noticeDTO();
				ndto.setImportant(rs.getInt(1));
				ndto.setNum(rs.getInt(2));
				ndto.setTitle(rs.getString(3));
				ndto.setReg_date(rs.getDate(4));
				ndto.setReadcount(rs.getInt(5));
				
				list.add(ndto);
			}
		}catch (Exception e) {
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}return list;
	}//getAllN
	
	public int countN() {
		getConnection();
		String sql = "select count(*) as cnt from notice";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt("cnt");
			}
		}catch (Exception e) {
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}return 0;
	}//countN
	
	public noticeDTO getNoticeByNo(int num) {
		getConnection();
		String sql = "select * from notice where num =?";
		String sql_u = "update notice set readcount = readcount +1 where num=?";
		noticeDTO ndto = new noticeDTO();
		try {
			ps = conn.prepareStatement(sql_u);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			while(rs.next()) {
				ndto.setImportant(rs.getInt("important"));
				ndto.setTitle(rs.getString("title"));
				ndto.setContent(rs.getString("content"));
				ndto.setReadcount(rs.getInt("readcount"));
			}
		}catch (Exception e) {
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
			}catch(Exception e){
				e.printStackTrace();
			}
		}return ndto;
	}//getNoticeByNo
	
	public ArrayList<noticeDTO> getNotice(){
		getConnection();
		ArrayList<noticeDTO> list = new ArrayList<noticeDTO>();
		String sql = "select num, title from (select rownum as rank, num, title from (select * from notice order by important))"
				+ "where rank between 1 and 5";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				noticeDTO ndto = new noticeDTO();
				ndto.setNum(rs.getInt("num"));
				ndto.setTitle(rs.getString("title"));
				
				list.add(ndto);
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
	}//getNotice
}
