package com.project.mem;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class LogoutController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 무효화 (로그아웃 처리) 
		HttpSession session = request.getSession();   // 현재 세션을 가져
		session.invalidate();                         // 세션 무효화 
		
		// 로그아웃 후, 메인 페이지로 이동 
		RequestDispatcher dispatcher = request.getRequestDispatcher("resource/Main.jsp");
		dispatcher.forward(request, response);
		  
	}

}
