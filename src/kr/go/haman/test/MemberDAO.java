package kr.go.haman.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import kr.go.haman.model.MySQL;

public class MemberDAO {
		public Connection conn = null;
		public PreparedStatement pstmt = null;
		public ResultSet rs = null;
		String sql = "";
		ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
		
		//샘플 목록 전체
		public ArrayList<MemberDTO> getMemberList(){
			try {
				conn = MySQL.getConnection();
				pstmt = conn.prepareStatement(MySQL.MEMBER_SELECT_ALL);
				rs = pstmt.executeQuery();
				while(rs.next()){
					MemberDTO m = new MemberDTO();
					m.setId(rs.getString("id"));
					m.setPw(rs.getString("pw"));
					m.setName(rs.getString("name"));
					memList.add(m);
				}
			} catch(Exception e){
				System.out.println("데이터베이스 연동 실패");
				e.printStackTrace();
			}
			return memList;
		}
		
		//샘플 레코드 하나
		public MemberDTO getMember(String id){
			MemberDTO m = new MemberDTO();
			try {
				conn = MySQL.getConnection();
				pstmt = conn.prepareStatement(MySQL.MEMBER_SELECT_ONE);
				pstmt.setString(1, id);
				rs = pstmt.executeQuery();
				if(rs.next()){
					m.setId(rs.getString("id"));
					m.setPw(rs.getString("pw"));
					m.setName(rs.getString("name"));
				}
			} catch(Exception e){
				System.out.println("데이터베이스 연동 실패");
				e.printStackTrace();
			}
			return m;
		}
		
		//샘플 추가
		public int addMember(MemberDTO m){
			int cnt = 0;
			try {
				conn = MySQL.getConnection();
				pstmt = conn.prepareStatement(MySQL.MEMBER_INSERT);
				pstmt.setString(1, m.getId());
				pstmt.setString(2, m.getPw());
				pstmt.setString(3, m.getName());
				cnt = pstmt.executeUpdate();
			} catch(Exception e){
				System.out.println("데이터베이스 연동 실패");
				e.printStackTrace();
			}
			return cnt;
		}
		
		//샘플 변경
		public int updateMember(MemberDTO m){
			int cnt = 0;
			try {
				conn = MySQL.getConnection();
				pstmt = conn.prepareStatement(MySQL.MEMBER_UPDATE);
				pstmt.setString(1, m.getPw());
				pstmt.setString(2, m.getId());
				cnt = pstmt.executeUpdate();
			} catch(Exception e){
				System.out.println("데이터베이스 연동 실패");
				e.printStackTrace();
			}
			return cnt;
		}
		
		//샘플 삭제
		public int deleteMember(String id){
			int cnt = 0;
			try {
				conn = MySQL.getConnection();
				pstmt = conn.prepareStatement(MySQL.MEMBER_DELETE);
				pstmt.setString(1, id);
				cnt = pstmt.executeUpdate();
			} catch(Exception e){
				System.out.println("데이터베이스 연동 실패");
				e.printStackTrace();
			}
			return cnt;
		}
	}
