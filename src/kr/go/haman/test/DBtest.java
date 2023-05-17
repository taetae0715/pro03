package kr.go.haman.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.haman.dto.Member;
import kr.go.haman.util.MySQL;

import org.junit.Test;


public class DBtest {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public ArrayList<Member> memberList(){
		ArrayList<Member> memberList = new ArrayList<Member>();
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.MEMBER_SELECT_ALL);
			rs = pstmt.executeQuery();	
			while(rs.next()){
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPw(rs.getString("pw"));
				m.setName(rs.getString("name"));
				memberList.add(m);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		MySQL.close(rs, pstmt, conn);
		return memberList();
	}

	@Test
	public void test2() {
		ArrayList<Member> testList = new ArrayList<Member>();
		testList = memberList();
		for(Member m:testList){
		System.out.println(m);
		}
	}
}
