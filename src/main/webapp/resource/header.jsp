<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8">
    <!-- HTML link 태그를 활용한 BootStrap 연동 -->
    <link href="./bootstrap-5.1.3-dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<!-- BootStrap Navigation Bar Sample -->
<header class="p-3 bg-dark text-white">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <!-- 로고 또는 아이콘 추가 가능 -->
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <!-- 기존 header.jsp의 메뉴 항목들을 Bootstrap 네비게이션 바에 통합 -->
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="/home" class="nav-link px-2 text-secondary">HOME</a></li>
          <li><a href="/news" class="nav-link px-2 text-white">NEWS</a></li>
          <li><a href="/reviews" class="nav-link px-2 text-white">REVIEWS</a></li>
          <li><a href="/store" class="nav-link px-2 text-white">MY STORE</a></li>
          <li><a href="/categories" class="nav-link px-2 text-white">CATEGORIES</a></li>
          
        </ul>

        <!-- 검색창 -->
        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
          <input type="search" class="form-control form-control-dark" placeholder="Search..." aria-label="Search">
        </form>

        <!--  로그인 여부에 따른 버튼 출력 -->
        <div class="text-end">
        <%
        	String userId = (String)session.getAttribute("userId"); //세션에서 userId 가져오기 
        	if (userId != null){  //로그인한 경우 
        		
        		if(userId.equals("admin")){ //관리자 아이디로 로그인한 경우 
        %>
          <span><%= userId %> (관리자) 님 </span>
          <button type="button" class="btn btn-outline-light me-2" onClick="location.href='<%= request.getContextPath() %>/member/AdminPage.jsp'"> 관리자 페이지 </button>
          <button type="button" class="btn btn-outline-light me-2" onClick="location.href='<%= request.getContextPath() %>/logout.do'"> 로그아웃 </button>
        
        <%
        		}else{ // 일반회원 header  (관리자 이외의 아이디로 로그인한 경우 )
        %>  
          <span><%= userId %>님 </span>
          <button type="button" class="btn btn-outline-light me-2" onClick="location.href='<%= request.getContextPath() %>/member/MyPage.jsp'"> 마이페이지 </button>
          <button type="button" class="btn btn-outline-light me-2" onClick="location.href='<%= request.getContextPath() %>/logout.do'"> 로그아웃 </button>
        <%
        		}
        %>
        <%
        	}else{   //로그인하지 않은 경우 
        %>
          <button type="button" class="btn btn-outline-light me-2" onClick="location.href='<%= request.getContextPath() %>/member/Login.jsp'">로그인 </button>
          <button type="button" class="btn btn-warning" onClick="location.href='<%= request.getContextPath() %>/member/Join.jsp'">회원가입 </button>
        <%
        	}
        %>
        
        
        </div>
      </div>
    </div>
</header>
