<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>오류 발생</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .error-container {
            text-align: center;
            padding: 30px;
            border: 1px solid #f5c6cb;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn {
            background-color: #dc3545;
            color: white;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #a71d2a;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>오류가 발생했습니다</h1>
        <p>강퇴 처리가 실패하였습니다. 다시 시도해주세요.</p>
        <p>문제가 계속 발생하면 관리자에게 문의하시기 바랍니다.</p>
        <a href="<%= request.getContextPath() %>/memberList.do" class="btn">회원 목록으로 돌아가기</a>
    </div>

</body>
</html>
