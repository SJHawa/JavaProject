package com.project.mem;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/join.do")
public class JoinController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 요청 파라미터를 받기
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String phn = request.getParameter("phoneNum");
		String email = request.getParameter("email");
		String birth = request.getParameter("birth");
		String sex = request.getParameter("sex");

		// DTO 객체 생성 후 값 설정
		MemberDTO mDto = new MemberDTO();
		mDto.setName(name);	
		mDto.setId(id);
		mDto.setPassword(pw);
		mDto.setPhoneNum(phn);
		mDto.setEmail(email);
		mDto.setBirth(birth);
		mDto.setSex(sex);
		
		// DAO 객체를 통해 데이터베이스에 회원 정보 삽입
		MemberDAO mDao = new MemberDAO();	
		boolean insertCheck = mDao.memberInsert(mDto);  //insertCheck은 성공 여부를 true/false로 저

		// 회원가입 성공 여부에 따라 다른 페이지로 이동
	    if(insertCheck){
	    	request.setAttribute("joinResult", insertCheck);
			HttpSession session = request.getSession();
			session.setAttribute("idKey", id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/joinSuc.jsp");
			dispatcher.forward(request, response);

		}else{
	    	request.setAttribute("joinResult", 0);
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/Join.jsp");
			dispatcher.forward(request, response);
		}
	}

}