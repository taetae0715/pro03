package kr.go.haman.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.go.haman.model.MySQL;

import org.junit.Test;

public class MySQLTest {
	public Connection conn = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	String sql = "";

	@Test
	public void test() {
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.MEMBER_SELECT_ALL);
			rs = pstmt.executeQuery();	
			while(rs.next()){
				System.out.println(rs.getString("id"));
				System.out.println(rs.getString("pw"));
				System.out.println(rs.getString("name"));
				System.out.println("----------------------------");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		MySQL.close(rs, pstmt, conn);
	}
	

}
