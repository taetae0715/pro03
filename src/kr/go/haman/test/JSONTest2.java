package kr.go.haman.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.test.MemberDTO;

import org.json.*;
import org.junit.Test;

@WebServlet("/JSONTest2.do")
public class JSONTest2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String msg = "";
    JSONObject json = new JSONObject();
	MemberDAO dao = new MemberDAO();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
		
        jsonTest2(request, response);
	}
	
	public void jsonTest2(String id) throws IOException{
		MemberDTO result = dao.getMember(id);
				
		json.put("id", result.getId());
		json.put("pw", result.getPw());
		json.put("name", result.getName());
	}
	
	public void jsonTest2(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id = request.getParameter("id");
		
		MemberDTO result = dao.getMember(id);
				
		json.put("id", result.getId());
		json.put("pw", result.getPw());
		json.put("name", result.getName());
		PrintWriter out = response.getWriter();
		out.println(json.toString());	
	}
	
	@Test
	public void test() throws IOException {
		System.out.println("JSON Test2");
		jsonTest2("admin");
		System.out.println("아이디 : "+json.get("id"));
		System.out.println("비밀번호 : "+json.get("pw"));
		System.out.println("이름 : "+json.get("name"));
	}

}
