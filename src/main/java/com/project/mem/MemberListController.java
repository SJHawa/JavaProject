package com.project.mem;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// Admin.jsp -> memberList.jsp (회원목록 나타내기)에서 사용  
@WebServlet("/memberList.do")
public class MemberListController extends HttpServlet{
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // DAO 객체 생성
        MemberDAO mDao = new MemberDAO();
        
        // 회원 목록 데이터 조회
        List<MemberDTO> memberList = mDao.getAllMembers();
        
        // 데이터 request 객체에 담기
        request.setAttribute("memberList", memberList);
        
        // memberList.jsp로 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher("member/memberList.jsp");
        dispatcher.forward(request, response);
    }
	
}
