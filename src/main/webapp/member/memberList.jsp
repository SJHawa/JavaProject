<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.project.mem.MemberDTO" %>

<!-- Admin.jsp (관리자 페이지 안에 들어가는) 회원 목록 띄우기 페이지  -->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 목록</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        
        /* 테이블 행에 마우스를 올렸을 때 색상을 변경 */
	    tr:hover {
	        background-color: #f2f2f2;
	        cursor: pointer; /* 마우스 커서를 손가락 모양으로 변경 */
	    }
    </style>
    
    <!-- 회원 상세 정보로 넘어가게 하는 js문법  -->
    <script>
    // 행을 클릭했을 때 상세보기 페이지로 이동하는 함수
    function goToMemberInfo(memberId) {
        location.href = '<%= request.getContextPath() %>/memberInfo.do?id=' + memberId;
    }
	</script>
    
    
</head>
<body>
    <h1>회원 목록</h1>
    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>성별</th>
                <th>연락처</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Controller에서 전달된 memberList 가져오기
                List<MemberDTO> memberList = (List<MemberDTO>) request.getAttribute("memberList");
                if (memberList != null && !memberList.isEmpty()) {
                    int index = 1; // 번호를 위한 변수
                    for (MemberDTO member : memberList) {
            %>
            <tr onclick="goToMemberInfo('<%= member.getId() %>')">
                <td><%= index++ %></td>
                <td><%= member.getId() %></td>
                <td><%= member.getName() %></td>
                <td><%= member.getBirth() %></td>
                <!-- 성별은 value값에 따라 띄울 문자열 if문 통해 지정  -->
                <td>
			    <%
			        String sex = member.getSex();
			        if ("M".equals(sex)) {
			            out.print("남");
			        } else if ("F".equals(sex)) {
			            out.print("여");
			        } else {
			            out.print("선택 안함");
			        }
			    %>
			   </td>
			   <td><%= member.getPhoneNum() %></td>
			                
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="6">회원 데이터가 없습니다.</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
