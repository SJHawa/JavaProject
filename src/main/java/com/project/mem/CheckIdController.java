package com.project.mem;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//ID 중복 확인 서블릿 
@WebServlet("/checkId.do")
public class CheckIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 1. 클라이언트로부터 입력받은 ID 가져오기
	    String id = request.getParameter("id");

	    // 2. ID 중복 여부 결과를 저장할 변수
	    boolean isAvailable = false; // 기본값: 사용 불가능

	    // 3. ID 값이 비어있지 않은지 확인
	    if (id != null && !id.trim().isEmpty()) {           //trim() -> 사용자가 입력한 값에서 공백 없앰 
	        // 4. DAO 객체 생성
	        MemberDAO dao = new MemberDAO();

	        // 5. DAO 메서드를 호출하여 ID 중복 여부 확인
	        boolean isDuplicate = dao.isIdDuplicate(id); // true: 중복, false: 사용 가능

	        // 6. 중복 여부에 따라 사용 가능 여부 설정
	        if (isDuplicate) {
	            isAvailable = false; // 중복된 ID인 경우
	        } else {
	            isAvailable = true; // 사용 가능한 ID인 경우
	        }
	    }

	    // 7. 결과를 request 객체에 저장
	    request.setAttribute("isAvailable", isAvailable);

	    // 8. checkId.jsp로 결과를 전달하고 포워딩
	    RequestDispatcher dispatcher = request.getRequestDispatcher("member/CheckId.jsp");
	    dispatcher.forward(request, response);
	}
}
