<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #2c2c2c; /* 배경색을 #2c2c2c로 설정 */
            color: #fff;
            font-family: 'Arial', sans-serif;
        }

        .container {
            max-width: 1000px;
            margin-top: 50px;
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
           	height: 700px; /* 세로 길이를 늘림 */
        }

        .header {
            background-color: #5a5a5a;
            padding: 20px;
            color: #fff;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 24px;
            text-align: center;
        }

        .header p {
            font-size: 18px;
            text-align: center;
        }

        .profile-picture {
            background-color: #e4b7c2;
            border-radius: 50%;
            width: 120px;
            height: 120px;
            margin: 0 auto 20px;
            display: block;
        }

        .btn {
            display: block;
            width: 100%;
            margin-bottom: 10px;
            padding: 15px;
            font-size: 16px;
            border-radius: 8px;
            text-align: center;
            text-decoration: none;
        }

        .btn-primary {
            background-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-danger {
            background-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #a71d2a;
        }

        .card {
            background-color: #e9ecef;
            border: none;
            border-radius: 8px;
            padding: 20px;
        }

        .card .card-body {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .card .card-body .btn {
            width: 48%;
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- 헤더 -->
        <div class="header">
            <h1>마이페이지</h1>
            <p>00님, 환영합니다!</p>
        </div>

        <!-- 프로필 이미지 -->
        <div class="profile-picture"></div>

        <!-- 카드들 -->
        <div class="card">
            <div class="card-body">
                <a href="#" class="btn btn-primary">관심 목록</a>
                <a href="#" class="btn btn-primary">작성 댓글</a>
                <a href="#" class="btn btn-primary">내가 쓴 리뷰</a>
                <a href="<%= request.getContextPath() %>/member/InfoEdit.jsp" class="btn btn-primary">정보 수정</a>
                <a href="<%= request.getContextPath() %>/logout.do" class="btn btn-danger">로그아웃</a>
            </div>
        </div>
    </div>

</body>
</html>
