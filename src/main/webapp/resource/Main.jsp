<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<!-- Google Fonts 불러오기 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Press+Start+2P&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS (include Popper.js) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

<div class="main-content">
    <!-- 추천 게임 섹션 -->
    <section class="recommended-game">
  <h2>추천 게임</h2>
  
  <div id="carouselExample" class="carousel slide">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="img/Mario.png" class="d-block w-50 game-image" alt="Mario">
        <p class="game-description">Mario & Luigi: Brothership - Now Available</p>
      </div>
      <div class="carousel-item">
        <img src="img/Zelda.png" class="d-block w-50 game-image" alt="Zelda">
        <p class="game-description">The Legend of Zelda: Breath of the Wild - Explore the Kingdom</p>
      </div>
      <div class="carousel-item">
        <img src="img/Sonic.png" class="d-block w-50 game-image" alt="Sonic">
        <p class="game-description">Sonic the Hedgehog - Speed through new adventures</p>
      </div>
    </div>
    
    <!-- Carousel controls -->
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>

<!-- 리뷰 모아보기 섹션 -->
<section class="reviews mt-5">
    <div class="container">
        <h2 class="text-white">Reviews</h2>
        
        <!-- 첫 번째 리뷰 카드 -->
        <div class="card bg-dark text-white mb-4">
            <div class="card-body">
                <h5 class="card-title">Alps and Dangerous Forests 👍</h5>
                <p class="card-text">작성자: Jhames | 8시간 전</p>
                <p class="card-text">이 게임은 정말 흥미진진하고 도전적입니다! 자연 환경이 매우 사실적으로 표현되어 있으며, 플레이어가 탐험할 수 있는 다양한 지역이 있습니다.</p>
                
                <!-- 좋아요 / 싫어요 버튼 -->
                <button class="btn btn-success me-2">👍 0</button>
                <button class="btn btn-danger">👎 0</button>

                <!-- 댓글 작성 -->
                <div class="mt-3">
                    <input type="text" class="form-control" placeholder="Write a reply...">
                </div>
            </div>
        </div>

        <!-- 두 번째 리뷰 카드 -->
        <div class="card bg-dark text-white mb-4">
            <div class="card-body">
                <h5 class="card-title">Dead Space 👍</h5>
                <p class="card-text">작성자: HorizonBZ | 14시간 전</p>
                <p class="card-text">PS5에서 성능 모드가 완벽하지 않지만, 여전히 매우 즐거운 게임입니다. 공포 요소와 몰입감이 뛰어납니다.</p>

                <!-- 좋아요 / 싫어요 버튼 -->
                <button class="btn btn-success me-2">👍 0</button>
                <button class="btn btn-danger">👎 0</button>

                <!-- 댓글 작성 -->
                <div class="mt-3">
                    <input type="text" class="form-control" placeholder="Write a reply...">
                </div>
            </div>
        </div>

        <!-- 세 번째 리뷰 카드 -->
        <div class="card bg-dark text-white mb-4">
            <div class="card-body">
                <h5 class="card-title">The Legend of Zelda: Breath of the Wild 👍</h5>
                <p class="card-text">작성자: ZeldaFan | 1일 전</p>
                <p class="card-text">이 게임은 오픈 월드의 진정한 걸작입니다. 탐험과 자유도가 매우 높고, 그래픽도 훌륭합니다.</p>

                <!-- 좋아요 / 싫어요 버튼 -->
                <button class="btn btn-success me-2">👍 0</button>
                <button class="btn btn-danger">👎 0</button>

                <!-- 댓글 작성 -->
                <div class="mt-3">
                    <input type="text" class="form-control" placeholder="Write a reply...">
                </div>
            </div>
        </div>

    </div>
</section>

</div>
<%@ include file="footer.jsp" %>
<!-- CSS 스타일 추가 -->
<style>
 	body {
        background-color: #2c2c2c; /* 검은색 배경 */
        color: #FFFFFF; /* 흰색 글씨 */
        font-family: Arial, sans-serif; /* 기본 폰트 설정 */
    }

/*      h1, h2, p {
        margin: 20px;
    } */
        
    .header nav ul {
        display: flex;
        list-style-type: none;
    }
    
    .header nav ul li {
        margin-right: 20px;
    }

    .main-content {
        padding: 20px;
    }

    .recommended-game {
        margin-bottom: 40px;
    }

    .reviews {
        margin-top: 40px;
    }
    .game-image {
        width: 50%; /* 이미지 너비를 50%로 설정 */
        height: auto; /* 비율을 유지하면서 높이 자동 조절 */
        margin: 0 auto; /* 이미지를 가운데 정렬 */
    }
    .game-description {
    	text-align: center;
    	font-family: 'Press Start 2P', cursive;
	}
	.review-card {
            background-color: #333333; /* 리뷰 카드 배경색 */
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
        }
        .review-card h5 {
            color: #FFD700; /* 제목 색상 (금색) */
        }
        .review-card p {
            color: #cccccc; /* 설명 색상 (밝은 회색) */
        }
        .review-card .btn {
            margin-right: 10px;
        }
</style>