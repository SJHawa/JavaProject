<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지 </title>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Press+Start+2P&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS (include Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom CSS -->
<style>
    
    body {
        background-color: #2c2c2c;
        margin: 0;
        display: flex;
        flex-direction: column;
        height: 100vh;
        justify-content: center;
        align-items: center;
    }
    h1 {
        text-align: center;
        color: #ffffff;
    }
    hr {
        border-color: #ff9800;
        margin-bottom: 20px;
    }
    .login-container {
        width: 100%;
        max-width: 400px;
        padding: 20px;
        background: #3b3b3b;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
    }
    .login-container table {
        width: 100%;
        border-collapse: collapse;
    }
    .login-container td {
        padding: 10px;
        color: #ffffff;
    }
    .login-container input[type="text"], 
    .login-container input[type="password"] {
        width: 90%;
        height: 35px;
        background-color: #4d4d4d;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        padding-left: 10px;
    }
    .login-container input[type="submit"], 
    .login-container input[type="reset"] {
        width: 48%;
        padding: 10px;
        font-size: 1rem;
        font-weight: 700;
        background-color: #ff9800;
        color: #ffffff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin: 5px 1%;
    }
    .login-container input[type="submit"]:hover, 
    .login-container input[type="reset"]:hover {
        background-color: #e68900;
    }
    .error-message {
        text-align: center;
        color: red;
        font-weight: bold;
        margin-top: 10px;
        font-size: 0.9rem;
    }
</style>

</head>
<body>

<div class="login-container">
<h1>로그인 </h1>


   <!-- 로그인 폼 -->
    <form method="get" action="<%= request.getContextPath()%>/login.do">
        <table>
            <tr>
                <td align="center">아이디</td>
                <td align="center">
                    <input type="text" name="id" placeholder="아이디" required>
                </td>
            </tr>
            <tr>
                <td align="center">비밀번호</td>
                <td align="center">
                    <input type="password" name="password" placeholder="비밀번호" required>
                </td>
            </tr>
            
            <!-- 에러 메시지 출력 -->
		    <% 
		        //JSP에서는 기본적으로 session 객체를 제공하므로 다시 선언할 필요 없음
		        String errorMessage = (String) session.getAttribute("errorMessage");
		        if (errorMessage != null) { 
		    %>
		        <p class="error-message"><%= errorMessage %></p>
		    <% 
		        session.removeAttribute("errorMessage"); 
		        } 
		    %>
            
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="로그인">
                    <input type="reset" value="다시 입력">
                </td>
			</tr>
		</table>
	</form>
</div>



</body>
</html>