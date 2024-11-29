<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.*, com.project.mem.MemberDTO" %>
    
<!-- Admin.jsp => memberList.jsp => memberInfo.jsp 순서  -->
<!--  회원 상세 정보 (+강퇴 버튼)  -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 상세 정보</title>
</head>
<body>
    <h1>회원 상세 정보</h1>
    <table border="1" width="50%">
        <tr>
            <th>아이디</th>
            <td><%= ((MemberDTO) request.getAttribute("memberInfo")).getId() %></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><%= ((MemberDTO) request.getAttribute("memberInfo")).getName() %></td>
        </tr>
        <tr>
            <th>생년월일</th>
            <td><%= ((MemberDTO) request.getAttribute("memberInfo")).getBirth() %></td>
        </tr>
        <tr>
            <th>성별</th>
            <td>
                <%
                    String sex = ((MemberDTO) request.getAttribute("memberInfo")).getSex();
                    if ("M".equals(sex)) {
                        out.print("남");
                    } else if ("F".equals(sex)) {
                        out.print("여");
                    } else {
                        out.print("선택 안함");
                    }
                %>
            </td>
        </tr>
        <tr>
            <th>전화번호</th>
            <td><%= ((MemberDTO) request.getAttribute("memberInfo")).getPhoneNum() %></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><%= ((MemberDTO) request.getAttribute("memberInfo")).getEmail() %></td>
        </tr>
    </table>
    <br>
    <!-- 버튼 -->
    <button onclick="location.href='<%= request.getContextPath() %>/memberList.do'">목록으로 돌아가기</button>
    <button onclick="if(confirm('정말 강퇴하시겠습니까?')) { location.href='<%= request.getContextPath() %>/kickMember.do?id=<%= ((MemberDTO) request.getAttribute("memberInfo")).getId() %>'; }">강퇴</button>
</body>
</html>
