package kr.go.haman.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.junit.Test;

@WebServlet("/JSONTest3.do")
public class JSONTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String msg = "";
    JSONObject json = new JSONObject();
    JSONArray json2 = new JSONArray();
	MemberDAO dao = new MemberDAO();
	ArrayList<MemberDTO> memList = new ArrayList<MemberDTO>();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		
        jsonTest3(request, response);
	}
	
	public void jsonTest3() throws IOException{
		memList = dao.getMemberList();
		
		for(int i=0;i<memList.size();i++){
			JSONObject obj = new JSONObject();
			MemberDTO mem = memList.get(i); 
			obj.put(i+"",mem);
			json2.put(obj);
		}
	}
	
	public void jsonTest3(HttpServletRequest request, HttpServletResponse response) throws IOException{	
		ArrayList<MemberDTO> data = dao.getMemberList();

		PrintWriter out = response.getWriter();
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.clear();
		map.put("data", data);
		
		net.sf.json.JSONObject json3 = new net.sf.json.JSONObject();
		json3.clear();
		json3.putAll(map);
		out.println(json3.toString());	
	}
	
	@Test
	public void test() throws IOException {
		System.out.println("JSON Test3");
		jsonTest3();
		
		ArrayList<MemberDTO> mList = new ArrayList<MemberDTO>();
		for(int i=0;i<memList.size();i++){
			JSONObject obj = new JSONObject();
			obj = (JSONObject) json2.get(i);
			MemberDTO m = (MemberDTO) obj.get(i+"");

			System.out.println("아이디 : "+m.getId());
			System.out.println("비밀번호 : "+m.getPw());
			System.out.println("이름 : "+m.getName());
			System.out.println("*************************");
			mList.add(m);
		}
	}
}
