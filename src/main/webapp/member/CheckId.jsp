<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>ID 중복 확인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
        }
        .result {
            margin-top: 20px;
            font-size: 18px;
        }
        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <% 
        // 결과 가져오기
        Boolean isAvailable = (Boolean) request.getAttribute("isAvailable");
        if (isAvailable != null) {
            if (isAvailable) {
    %>
                <p style="color: green;">사용 가능한 ID입니다.</p>
    <%
            } else {
    %>
                <p style="color: red;">이미 사용 중인 ID입니다.</p>
    <%
            }
        } else {
    %>
            <p style="color: orange;">ID를 입력하세요.</p>
    <%
        }
    %>
    <button onclick="window.close()">닫기</button>
</body>
</html>
