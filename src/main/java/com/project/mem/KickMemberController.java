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

// 관리자 페이지 - 회원 상세 정보 페이지 -> [강퇴] 기능  
@WebServlet("/kickMember.do")
public class KickMemberController extends HttpServlet{
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 요청 파라미터에서 회원 ID 가져오기
        String memberId = request.getParameter("id");

        // DAO를 사용해 회원 삭제
        MemberDAO mDao = new MemberDAO();
        boolean isDeleted = mDao.deleteMember(memberId);

        if (isDeleted) {
            // 강퇴 성공 시 회원 목록으로 리다이렉트
            response.sendRedirect(request.getContextPath() + "/memberList.do?success=kick");
        } else {
            // 강퇴 실패 시 에러 페이지로 이동 (추후 구현)
            response.sendRedirect(request.getContextPath() + "/kickErrorPage.jsp");
        }
    }
	
}
