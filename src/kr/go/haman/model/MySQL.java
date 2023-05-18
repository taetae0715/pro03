package kr.go.haman.model;

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
	
	public final static String MEMBER_SELECT_ALL = "select * from member";
	public final static String MEMBER_SELECT_ONE = "select * from member where id=?";
	public final static String MEMBER_INSERT = "insert into member values(?,?,?)";
	public final static String MEMBER_UPDATE = "update member set pw=? where id=?";
	public final static String MEMBER_DELETE = "delete from member where id=?";

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
