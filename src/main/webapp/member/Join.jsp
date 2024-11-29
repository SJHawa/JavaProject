<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>회원가입</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Press+Start+2P&display=swap" rel="stylesheet">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <style>
        body {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            align-items: center;
            background-color: #2c2c2c; /* 어두운 배경 */
            height: 100vh;
            margin: 0;
            font-family: 'Roboto', sans-serif;
        }
        header, footer {
            width: 100%;
            text-align: center;
            background-color: #3b3b3b;
            color: #ffffff;
            padding: 10px 0;
        }
        .signup-container {
            width: 100%;
            max-width: 500px;
            padding: 20px;
            background: #3b3b3b; /* 배경보다 약간 밝은 컨테이너 색 */
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
            color: #ffffff;
        }
        .signup-container h1 {
            text-align: center;
            font-weight: 700;
            margin-bottom: 20px;
        }
        .signup-container .form-label {
            color: #d1d1d1; /* 밝은 회색 라벨 */
        }
        .signup-container .form-control {
            margin-bottom: 15px;
            height: 45px;
            font-size: 1rem;
            background-color: #4d4d4d;
            color: #ffffff;
            border: none;
            border-radius: 5px;
        }
        .signup-container .form-control::placeholder {
            color: #b3b3b3;
        }
        .signup-container .btn-primary {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            font-weight: 700;
            background-color: #ff9800;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .signup-container .btn-primary:hover {
            background-color: #e68900;
        }
        .signup-container .btn-secondary {
            width: 100%;
            padding: 10px;
            font-size: 1rem;
            font-weight: 700;
            background-color: #757575;
            color: #ffffff;
            border: none;
            border-radius: 5px;
        }
        .signup-container .btn-secondary:hover {
            background-color: #616161;
        }
        .signup-container .input-group {
            display: flex;
            align-items: center;
        }
        .signup-container .input-group-text {
            background-color: #4d4d4d;
            color: #ffffff;
            border: none;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <%@ include file="../resource/header.jsp" %>
    </header>

    <!-- Content -->
    <div class="signup-container">
        <h1>회원가입</h1>
        <form name="joinForm" method="get" action="<%=request.getContextPath() %>/join.do">
            <!-- 이름 -->
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력하세요" required>
            </div>

            <!-- 아이디 -->
            <div class="mb-3">
                <label for="id" class="form-label">아이디</label>
                <div class="input-group">
                    <input type="text" name="id" id="id" class="form-control" placeholder="아이디를 입력하세요" required>
                    <button type="button" class="btn btn-secondary ms-2" id="checkId" onclick="openCheckId()">ID 중복확인</button>
                </div>
            </div>

            <!-- 비밀번호 -->
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" name="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요" required>
            </div>

            <!-- 비밀번호 확인 -->
            <div class="mb-3">
                <label for="RePassword" class="form-label">비밀번호 확인</label>
                <input type="password" name="RePassword" id="RePassword" class="form-control" placeholder="비밀번호를 다시 입력하세요" required>
            </div>

            <!-- 전화번호 -->
            <div class="mb-3">
                <label for="phoneNum" class="form-label">전화번호</label>
                <input type="text" name="phoneNum" id="phoneNum" class="form-control" placeholder="'-' 없이 입력하세요">
            </div>

            <!-- 이메일 -->
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" name="email" id="email" class="form-control" placeholder="example@email.com">
            </div>

            <!-- 생년월일 -->
            <div class="mb-3">
                <label for="birth" class="form-label">생년월일 (YYYY/MM/DD)</label>
                <input type="text" name="birth" id="birth" class="form-control">
            </div>

            <!-- 성별 -->
            <div class="mb-3">
                <label class="form-label">성별</label><br />
                <input type="radio" name="sex" value="M"> 남
                <input type="radio" name="sex" value="F"> 여
                <input type="radio" name="sex" value="No"> 선택 안함
            </div>

            <!-- 제출 및 초기화 버튼 -->
            <button type="submit" class="btn btn-primary">확인</button>
            <button type="reset" class="btn btn-secondary mt-2">초기화</button>
        </form>
    </div>
    

    <!-- Footer -->
    <footer>
        <%@ include file="../resource/footer.jsp" %>
    </footer>
</body>
    <!-- JavaScript -->
    <script>
        // 비밀번호 확인 로직
        document.getElementById('RePassword').addEventListener('input', function () {
            const password = document.getElementById('password').value; // 비밀번호 입력 값 가져오기
            const rePassword = this.value; // 비밀번호 확인 입력 값 가져오기

            if (password !== rePassword) {
                this.setCustomValidity("비밀번호가 일치하지 않습니다.");
            } else {
                this.setCustomValidity(""); // 입력값이 일치하면 메시지 초기화
            }
        });
        
        // ID중복 확인 버튼 눌렀을 때 동작 
        function openCheckId() {
            const id = document.getElementById('id').value; // 입력된 아이디 값 가져오기

            if (!id || id.trim() === "") {
                alert("아이디를 입력하세요."); // 아이디가 비어있으면 경고창 표시
                return;
            }

            // 팝업 창 열기
            const popupWidth = 700; // 팝업 창 너비
            const popupHeight = 300; // 팝업 창 높이
            const popupX = (window.screen.width / 2) - (popupWidth / 2); // 화면 중앙 X 좌표
            const popupY = (window.screen.height / 2) - (popupHeight / 2); // 화면 중앙 Y 좌표

            // 팝업 창 열기 (매핑값: /checkId.do, 옵션: 크기 및 위치)
            // 매핑된 URL 호출
            window.open(
                "<%= request.getContextPath() %>/checkId.do?id=" + encodeURIComponent(id),
                "checkId",
                `width=${popupWidth},height=${popupHeight},left=${popupX},top=${popupY}`
            );
        }

        // 전화번호 유효성 검사
        document.getElementById('phoneNum').addEventListener('input', function () {
            const phoneRegex = /^\d{10,11}$/; // 10자리 또는 11자리 숫자만 허용

            // 입력값이 정규식을 만족하지 않으면 경고 메시지 설정
            if (!phoneRegex.test(this.value)) {
                this.setCustomValidity("유효한 전화번호를 입력하세요. ('-' 제외)"); // 유효하지 않은 경우
            } else {
                this.setCustomValidity(""); // 유효한 경우 메시지 초기화
            }
        });

        // 생년월일 유효성 검사
        document.getElementById('birth').addEventListener('input', function () {
            const birthRegex = /^\d{4}\/\d{2}\/\d{2}$/; // YYYY/MM/DD 형식의 정규식
            
         // 입력값이 정규식을 만족하지 않으면 경고 메시지 설정
            if (!birthRegex.test(this.value)) {
                this.setCustomValidity("생년월일 형식은 YYYY/MM/DD입니다."); // 유효하지 않은 경우

            } else { 
                this.setCustomValidity(""); // 유효한 경우 메시지 초기화
            }
        });
    </script>

</html>
