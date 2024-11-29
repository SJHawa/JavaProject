package com.project.mem;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 1. 요청 데이터의 문자 인코딩 설정

        // 2. 클라이언트에서 입력받은 ID와 비밀번호 가져오기
        String id = request.getParameter("id");
        String pw = request.getParameter("password");

        // 3. DAO 객체 생성
        MemberDAO mDao = new MemberDAO();

        // 4. 로그인 검증
        boolean loginResult = mDao.login(id, pw);

        // 5. 세션 객체 선언
        HttpSession session = request.getSession();

        if (loginResult) {
            // 6. 로그인 성공 시 사용자 정보를 데이터베이스에서 가져오기
            MemberDTO memberInfo = mDao.getMemberInfo(id); // 사용자 정보 조회 메서드 호출

            if (memberInfo != null) {
                // 7. 세션에 사용자 정보 저장
                session.setAttribute("userId", memberInfo.getId());
                session.setAttribute("email", memberInfo.getEmail());
                session.setAttribute("phoneNum", memberInfo.getPhoneNum());
                session.setAttribute("sex", memberInfo.getSex());
                session.setAttribute("birth", memberInfo.getBirth());
            }

            // 8. 메인 페이지로 리다이렉트
            response.sendRedirect("resource/Main.jsp");
        } else {
            // 9. 로그인 실패 시 에러 메시지를 세션에 저장하고 로그인 페이지로 포워드
            session.setAttribute("errorMessage", "아이디 또는 비밀번호가 잘못되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("member/Login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
