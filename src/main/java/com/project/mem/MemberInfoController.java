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

@WebServlet("/memberInfo.do")
public class MemberInfoController extends HttpServlet{

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 요청 파라미터에서 회원 ID 가져오기
        String memberId = request.getParameter("id");

        // DAO 객체 생성 및 회원 정보 조회
        MemberDAO mDao = new MemberDAO();
        MemberDTO memberInfo = mDao.getMemberInfo(memberId); // 회원 정보 조회

        // 조회된 데이터를 request 객체에 저장
        request.setAttribute("memberInfo", memberInfo);

        // memberInfo.jsp로 포워드
        RequestDispatcher dispatcher = request.getRequestDispatcher("member/memberInfo.jsp");
        dispatcher.forward(request, response);
    }
}
