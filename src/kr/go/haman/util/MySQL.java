package kr.go.haman.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySQL {
	static String DRIVER = "com.mysql.cj.jdbc.Driver";
	static String URL = "jdbc:mysql://localhost:3306/haman?serverTimezone=Asia/Seoul";
	static String USER = "root";
	static String PASS = "1234";
	
	public static String MEMBER_SELECT_ALL = "select * from member";

	//DB 연결
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		Connection conn = DriverManager.getConnection(URL, USER, PASS);
		return conn; }
	
	public static void close(PreparedStatement pstmt, Connection conn){
		if(pstmt!=null){
			try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if(conn!=null){
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } } }
	
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection conn){
		if(rs!=null){
			try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if(pstmt!=null){
			try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } }
		if(conn!=null){
			try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } } }
}
