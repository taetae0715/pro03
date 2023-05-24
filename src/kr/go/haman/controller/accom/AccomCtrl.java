package kr.go.haman.controller.accom;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.haman.dto.Accom;
import kr.go.haman.model.AccomDAO;

@WebServlet("/Accom.do")
public class AccomCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		AccomDAO dao = new AccomDAO();
		ArrayList<Accom> accomList = new ArrayList<Accom>();
		accomList = dao.getAccomList();
		request.setAttribute("accomList", accomList);
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/sub4/accom/accom.jsp");
		view.forward(request, response);
	}

}
