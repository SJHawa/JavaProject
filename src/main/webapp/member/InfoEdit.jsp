<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
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
            max-width: 600px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .btn-group button {
            width: 100%;
            margin-top: 10px;
        }

        .cancel-btn {
            background-color: #ccc;
        }

        .cancel-btn:hover {
            background-color: #aaa;
        }
        /* 버튼 그룹 간격 */
    	.btn-group {
        	display: flex;
        	flex-direction: column; /* 세로로 배치 */
        	gap: 10px; /* 버튼들 사이에 간격 추가 */
    	}

    	.btn-group .btn {
        	width: 100%; /* 버튼들 크기 맞춤 */
    	}
    </style>

    <script>
        function toggleEditMode() {
            // 읽기 모드 (read-only)와 수정 모드 (editable)를 전환합니다.
            var readOnlyFields = document.querySelectorAll('.read-only'); // 읽기 전용 필드
            var editableFields = document.querySelectorAll('.editable'); // 수정 가능한 필드
            var editButton = document.getElementById('editButton'); // [정보 수정하기] 버튼
            var saveButton = document.getElementById('saveButton'); // [저장] 버튼

            // 읽기 전용 필드와 수정 가능한 필드의 표시 상태를 전환합니다.
            readOnlyFields.forEach(function(field) {
                field.style.display = field.style.display === 'none' ? 'table-row' : 'none';
            });

            editableFields.forEach(function(field) {
                field.style.display = field.style.display === 'none' ? 'table-row' : 'none';
            });

            // 버튼의 표시 상태를 전환합니다.
            if (editButton.style.display === 'none') {
                editButton.style.display = 'inline-block'; // [정보 수정하기] 버튼 표시
                saveButton.style.display = 'none'; // [저장] 버튼 숨기기
            } else {
                editButton.style.display = 'none'; // [정보 수정하기] 버튼 숨기기
                saveButton.style.display = 'inline-block'; // [저장] 버튼 표시
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>회원 정보</h1>
        <form method="post" action="<%= request.getContextPath() %>/editMember.do">
            <table class="table">
                <!-- 읽기 모드 (수정 불가능한 상태) -->
                <tr class="read-only">
                    <td>아이디:</td>
                    <td><%= session.getAttribute("userId") != null ? session.getAttribute("userId") : "정보 없음" %></td>
                </tr>
                <tr class="read-only">
                    <td>생일:</td>
                    <td><%= session.getAttribute("birth") != null ? session.getAttribute("birth") : "정보 없음" %></td>
                </tr>
                <tr class="read-only">
                    <td>이메일:</td>
                    <td><%= session.getAttribute("email") != null ? session.getAttribute("email") : "정보 없음" %></td>
                </tr>
                <tr class="read-only">
                    <td>전화번호:</td>
                    <td><%= session.getAttribute("phoneNum") != null ? session.getAttribute("phoneNum") : "정보 없음" %></td>
                </tr>
                <tr class="read-only">
                    <td>성별:</td>
                    <td><%= session.getAttribute("sexLabel") != null ? session.getAttribute("sexLabel") : "정보 없음" %></td>
                </tr>

                <!-- 수정 모드 (필드가 입력 가능해짐) -->
                <tr class="editable" style="display: none;">
                    <td>아이디:</td>
                    <td><input type="text" name="id" value="<%= session.getAttribute("userId") != null ? session.getAttribute("userId") : "" %>" class="form-control" readonly></td>
                </tr>
                <tr class="editable" style="display: none;">
                    <td>생일:</td>
                    <td><input type="text" name="birth" value="<%= session.getAttribute("birth") != null ? session.getAttribute("birth") : "" %>" class="form-control" readonly></td>
                </tr>
                <tr class="editable" style="display: none;">
                    <td>이메일:</td>
                    <td><input type="email" name="email" value="<%= session.getAttribute("email") != null ? session.getAttribute("email") : "" %>" class="form-control"></td>
                </tr>
                <tr class="editable" style="display: none;">
                    <td>전화번호:</td>
                    <td><input type="text" name="phoneNum" value="<%= session.getAttribute("phoneNum") != null ? session.getAttribute("phoneNum") : "" %>" class="form-control"></td>
                </tr>
                <tr class="editable" style="display: none;">
                    <td>성별:</td>
                    <td>
                        <input type="radio" name="sex" value="M" <% if ("M".equals(session.getAttribute("sex"))) { %>checked<% } %>> 남
                        <input type="radio" name="sex" value="F" <% if ("F".equals(session.getAttribute("sex"))) { %>checked<% } %>> 여
                        <input type="radio" name="sex" value="No" <% if ("No".equals(session.getAttribute("sex"))) { %>checked<% } %>> 선택 안함
                    </td>
                </tr>
            </table>

            <div class="btn-group">
                <!-- [비밀번호 변경하기] 버튼 -->
                <button type="button" class="btn btn-secondary" onclick="location.href='<%= request.getContextPath() %>/member/changePassword.jsp'">비밀번호 변경하기</button>
                <!-- [정보 수정하기] 버튼 -->
                <button type="button" class="btn btn-primary" id="editButton" onclick="toggleEditMode()">정보 수정하기</button>
                <!-- [저장] 버튼 (처음에는 숨겨져 있음) -->
                <button type="submit" class="btn btn-success" id="saveButton" style="display: none;">저장</button>
                <!-- [취소] 버튼 -->
                <button type="button" class="btn cancel-btn" onclick="location.href='<%= request.getContextPath() %>/member/MyPage.jsp'">취소</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS, Popper.js 추가 -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
