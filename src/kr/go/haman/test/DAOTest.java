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

public class DAOTest {
	
	MemberDAO dao = new MemberDAO();		

	@Test
	public void getList() {
		System.out.println("1.목록 데이터");
		ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
		memList = dao.getMemberList();
		for(MemberDTO m:memList){
			System.out.println("아이디 : "+m.getId());
			System.out.println("비밀번호 : "+m.getPw());
			System.out.println("이름 : "+m.getName());
			System.out.println();
		}
	}
	
	@Test
	public void getRecord() {
		System.out.println("\n2.레코드 검색");
		MemberDTO m = new MemberDTO();
		m = dao.getMember("jws");
		if(m!=null){
			System.out.println("아이디 : "+m.getId());
			System.out.println("비밀번호 : "+m.getPw());
			System.out.println("이름 : "+m.getName());
			System.out.println();
		}
	}
	
	@Test
	public void addTest() {
		System.out.println("\n3.레코드 추가");
		MemberDTO m = new MemberDTO();
		m.setId("smj");
		m.setPw("0000");
		m.setName("선민정");
		int cnt = dao.addMember(m);
		if(cnt>0){
			System.out.println("레코드 추가 성공");
		}
	}

	@Test
	public void updateTest() {
		System.out.println("\n4.레코드 변경");
		MemberDTO m = new MemberDTO();
		m.setPw("8403");
		m.setName("조대바리");
		m.setId("jdw");
		int cnt = dao.updateMember(m);
		if(cnt>0){
			System.out.println("레코드 수정 성공");
		}
	} 
	
	@Test
	public void deleteTest() {
		System.out.println("5.레코드 삭제");
		int cnt = dao.deleteMember("jdw");
		if(cnt>0){
			System.out.println("레코드 삭제 성공");
		}
	}
}