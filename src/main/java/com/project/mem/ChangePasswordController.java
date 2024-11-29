package com.project.mem;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/changePassword.do")
public class ChangePasswordController extends HttpServlet{
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 1. 요청 데이터의 문자 인코딩 설정

        // 2. 세션에서 로그인된 사용자 ID 가져오기
        HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userId"); // 현재 로그인한 사용자 ID

        // 3. 클라이언트에서 입력된 비밀번호 값 가져오기
        String currentPassword = request.getParameter("currentPassword"); // 현재 비밀번호
        String newPassword = request.getParameter("newPassword"); // 새 비밀번호
        String confirmPassword = request.getParameter("confirmPassword"); // 새 비밀번호 확인

        // 4. 입력 검증: 새 비밀번호와 확인 비밀번호가 일치하는지 확인
        if (!newPassword.equals(confirmPassword)) {
            response.sendRedirect("member/ChangePassword.jsp?error=notMatch"); // 불일치 시 에러 메시지와 함께 돌아감
            return;
        }

        // 5. DAO 호출
        MemberDAO mDao = new MemberDAO();

        // 6. 현재 비밀번호가 올바른지 검증
        boolean isCurrentPasswordValid = mDao.validatePassword(userId, currentPassword);
        if (!isCurrentPasswordValid) {
            // 현재 비밀번호가 틀리면 에러 메시지 전달
            response.sendRedirect("member/ChangePassword.jsp?error=invalidCurrentPassword");
            return;
        }

        // 7. 새 비밀번호로 업데이트
        boolean isUpdated = mDao.updatePassword(userId, newPassword);
        if (isUpdated) {
            // 성공적으로 업데이트된 경우 마이페이지로 이동
            response.sendRedirect("member/MyPage.jsp?success=passwordChanged");
        } else {
            // 업데이트 실패 시 에러 메시지와 함께 돌아감
            response.sendRedirect("member/ChangePassword.jsp?error=updateFailed");
        }
    }
}
