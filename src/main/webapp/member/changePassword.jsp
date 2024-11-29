<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>비밀번호 변경</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #2c2c2c;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .btn {
            width: 100%;
            margin-top: 10px;
        }

        .cancel-btn {
            background-color: #ccc;
        }

        .cancel-btn:hover {
            background-color: #aaa;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>비밀번호 변경</h1>
        <form method="post" action="<%= request.getContextPath() %>/changePassword.do">
            <div class="form-group">
                <label for="currentPassword">현재 비밀번호</label>
                <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">새 비밀번호</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">새 비밀번호 확인</label>
                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                <button type="button" class="btn cancel-btn" onClick="location.href='<%= request.getContextPath() %>/member/MyPage.jsp'">취소</button>
            </div>
        </form>
    </div>

</body>
</html>
