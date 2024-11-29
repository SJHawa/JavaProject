package com.project.mem;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/editMember.do")
public class EditMemController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	
	    // 1. 세션에서 사용자 ID 가져오기
	    HttpSession session = request.getSession();
	    String userId = (String) session.getAttribute("userId");
	
	    // 2. JSP 폼에서 입력된 값 가져오기
	    String newPassword = request.getParameter("newPassword"); // 새 비밀번호
	    String email = request.getParameter("email");
	    String phoneNum = request.getParameter("phoneNum");
	    String sex = request.getParameter("sex");
	
	    // 3. DTO에 사용자 데이터를 담기
	    MemberDTO mDto = new MemberDTO();
	    mDto.setId(userId); // 사용자 ID 설정
	    mDto.setNewPassword(newPassword); // 새 비밀번호 (비어 있을 수도 있음)
	    mDto.setEmail(email);
	    mDto.setPhoneNum(phoneNum);
	    mDto.setSex(sex);
	
	    // 4. DAO를 호출하여 정보 업데이트
	    MemberDAO mDao = new MemberDAO();
	    boolean isUpdated = mDao.updateMemberInfo(mDto); // 업데이트 수행
	
	    if (isUpdated) {
	        // 5. 세션에 수정된 정보 반영
	        session.setAttribute("email", mDto.getEmail());
	        session.setAttribute("phoneNum", mDto.getPhoneNum());
	        session.setAttribute("sex", mDto.getSex());
	        // 비밀번호는 세션에 저장하지 않음
	
	        // 6. 성공적으로 업데이트된 경우 마이페이지로 이동
	        response.sendRedirect("member/MyPage.jsp");
	    } else {
	        // 7. 업데이트 실패 시 정보 수정 페이지로 리다이렉트
	        response.sendRedirect("member/InfoEdit.jsp?error=updateFailed");
	    }
	}
}
	
