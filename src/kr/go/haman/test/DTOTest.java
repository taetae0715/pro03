package kr.go.haman.test;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.haman.test.MemberDTO;
import kr.go.haman.model.MySQL;

import org.junit.Test;

public class DTOTest {
	public Connection conn = null;
	public PreparedStatement pstmt = null;
	public ResultSet rs = null;
	String sql = "";
	
	ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
	
	public ArrayList<MemberDTO> db(){
		try {
			conn = MySQL.getConnection();
			pstmt = conn.prepareStatement(MySQL.MEMBER_SELECT_ALL);
			rs = pstmt.executeQuery();	
			while(rs.next()){
				MemberDTO mem = new MemberDTO();
				mem.setId(rs.getString("id"));
				mem.setPw(rs.getString("pw"));
				mem.setName(rs.getString("name"));
				memList.add(mem);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} MySQL.close(rs, pstmt, conn);
		return memList;
	}
	
	@Test
	public void test() {
		ArrayList<MemberDTO> testList = db();
		for(MemberDTO mem:testList){
			System.out.println("아이디: "+mem.getId());
			System.out.println("비밀번호: "+mem.getPw());
			System.out.println("이름: "+mem.getName());
			System.out.println(" ");
		}
	}

}
