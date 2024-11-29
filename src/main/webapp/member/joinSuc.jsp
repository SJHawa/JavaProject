<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 회원가입 성공 시 view 페이지 -->
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    < <!-- 헤더 포함 -->
    <title>회원가입 성공</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            background-color: #2c2c2c;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .success-container {
            text-align: center;
            padding: 30px;
            background-color: #4d4d4d;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            width: 100%;
            max-width: 500px;
        }

        .success-container h1 {
            font-size: 2.5rem;
            color: #ffffff;
            margin-bottom: 20px;
        }

        .success-container p {
            font-size: 1.2rem;
            color: #6c757d;
            margin-bottom: 30px;
        }

        .btn-custom {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            font-weight: 700;
            background-color: #ff9800; /* 밝은 주황색 버튼 */
            color: #ffffff; /* 흰색 글자 */
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-custom:hover {
            background-color: #e68900; /* 버튼 hover 색상 */
        }

        /* 푸터 스타일 */
        footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            text-align: center;
            background-color: #2c2c2c;
            color: #fff;
            padding: 10px;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h1>회원가입 성공!</h1>
        <p>회원가입이 완료되었습니다.</p>
        <button type="button" class="btn-custom" onclick="location.href='<%= request.getContextPath() %>/member/Login.jsp'">로그인하러 가기</button>
    </div>

    <%@ include file="../resource/footer.jsp" %> <!-- 푸터 포함 -->
</body>
</html>
