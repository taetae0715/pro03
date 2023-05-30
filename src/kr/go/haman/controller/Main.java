package kr.go.haman.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Notice;
import kr.go.haman.model.NoticeDAO;

public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String author="조태정,김우주";
		//홈 디렉토리 잡기 (application 객체 생성)
		ServletContext application = request.getServletContext();
		
		//경로설정
		String realPath = request.getSession().getServletContext().getRealPath("/");
		application.setAttribute("realPath", realPath);
		
		//메인페이지 포워딩
		//리퀘스트에서 어플리케이션으로 바꿈
		application.setAttribute("author", author);
		//여기서 리퀘스트 디스패쳐를 해야지만 WEB-INF안에 접속가능함
		
		NoticeDAO notdao =new NoticeDAO();
		ArrayList<Notice> notList = new ArrayList<>();
		notList = notdao.getSelectAll();
		
		request.setAttribute("notList", notList );
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/index.jsp");
		view.forward(request, response);
	}
}

