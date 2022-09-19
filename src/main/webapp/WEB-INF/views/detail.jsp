<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>arTchive / ${exhbn.exhbnTitle}</title>
		<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/detail.js'/>"></script>
		<script src="<c:url value='/js/note/detail.js'/>"></script>
		<!-- icon-kit -->
		<script src="https://kit.fontawesome.com/50d21a2bed.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/tools/reset.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/exhbn/detail.css'/>"/>
	</head>
	<body>
		<!-- top으로 이동 -->
		<c:import url="/WEB-INF/views/layout/top.jsp" />
		
		<!-- detail main -->
		<main id="detail-wrap">
			<div id="cover-container" class="cover-img" style="background-image : url('${exhbn.exhbnImgUrl}');
			">
				<div class="cover-heading">
					<div class="cover-text">
						<div class="upper-cover">
							<a href="#">
									<span class="upper-cover-text">${exhbn.exhbnType} · ${exhbn.exhbnArea}</span>
							</a>
						</div>
						<div class="cover-header">
							<h1>${exhbn.exhbnTitle}</h1>
						</div>
						<div class="cover-date">
							<span><fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy. MM. dd"/> ~ <fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy. MM. dd"/></span>
						</div>
					</div>
					<!-- .cover-text -->
				</div>
				<!-- .cover-heading -->
			</div>
			<!-- .detail-img-container -->
			
			<div id="contents-container">
				<div class="back" onclick="goBack();">
					<i id="back" class="fa-solid fa-arrow-left fa-2xl"></i>
				</div>
				<div id="summary-container">
					<p>
					${exhbn.exhbnDetail}
					</p>
					<div id="poster-container">
						<div class="poster-box">
							<img class="poster" src="${exhbn.exhbnImgUrl}">
						</div>
					</div>
				</div>
				<div id="context-container">
					<div id="line1">
						<div id="period" class="context-box">
							<div class="context-title">
								<span>기간</span>
							</div>
							<div class="context-content">
								<span><fmt:formatDate value = "${exhbn.exhbnStartDate}" type ="date" pattern="yyyy년 MM월 dd일(E)"/><br/>~ <fmt:formatDate value = "${exhbn.exhbnEndDate}" type ="date" pattern="yyyy년 MM월 dd일(E)"/></span>
							</div>
						</div>
						<div id="pay" class="context-box">
							<div class="context-title">
								<span>관람료</span>
							</div>
							<div class="context-content">
								<span>${exhbn.exhbnPrice}</span>
							</div>
						</div>
						<div id="reservation" class="context-box">
							<div class="context-title">
								<span>예약방법</span>
							</div>
							<div class="context-content">
								<button class="black-btn">예약하기</button>
							</div>
						</div>
					</div>
					<!-- .line1 -->
					<div id="line2">
						<div id="location" class="context-box">
							<div class="context-title">
								<span>장소</span>
							</div>
							<div class="context-content">
								<span>${exhbn.exhbnPlace}<br/>${exhbn.exhbnPlaceAddr}</span>
							</div>
						</div>
						<div id="time" class="context-box">
							<div class="context-title">
								<span>이용시간</span>
							</div>
							<div class="context-content">
								<span>화요일 - 토요일 12:00 ~ 21:00<br/>일요일ᆞ공휴일 12:00 ~ 18:00<br/>매주 월요일 휴관</span>
							</div>
						</div>
						<div id="call" class="context-box">
							<div class="context-title">
								<span>문의</span>
							</div>
							<div class="context-content">
								<span>${exhbn.exhbnPhone}</span>
							</div>
						</div>
					</div>
					<!-- .line2 -->
					
				</div>
				<!-- .context-container -->
				<div id="button-box">
					<div>
						<button class="white-btn-big" onclick="window.open('${exhbn.exhbnUrl}')">자세히 보기</button>
					</div>
					<div>
						<form method="post" action="<c:url value='/insertBookMark' /> ">
							<!-- <button class="white-btn-big" onclick="location.href='#'">관심전시추가</button> -->
							<input type="submit" id="insertBookMark" class="white-btn-big" value="관심전시추가">
							<input type="hidden" id="exhbnId" name="exhbnId" value=${exhbn.exhbnId}>
						</form>
					</div>
					<div>
						<c:if test="${not empty sessionScope.sid}">
							<div><a href="<c:url value='/course/newPost/${exhbn.exhbnId}'/>"><button type="submit" class="black-btn-big">코스 작성하기</button></a></div>
						</c:if>
						<c:if test="${empty sessionScope.sid}">
							<div><button type="submit" class="black-btn-big notLogin" onclick="alert('로그인이 필요한 기능입니다.');">코스 작성하기</button></div>
						</c:if>
					</div>
				</div>
				<div id="map-box">
					<div class="map">
					</div>
				</div>
				<!-- tag -->
				<div class="tag-box">
					<h3>Tag. </h3>
					<ul class="tagList">
						<li class="tagItem">tag1</li>
						<li>tag2</li>
						<li>tag3</li>
					</ul>
				</div>
				<!-- .tag-box -->
			</div>
			<!-- .contents-container -->
			<div class="sub-title">
				<i class="fa-solid fa-chevron-left" id="prevBtn"></i>
				<h2>Reviews</h2>
				<i class="fa-solid fa-chevron-right" id="nextBtn"></i>
				<br>
			</div>
			<div id="review-container">
				<div class="sliding-box animate">
					<article class="review-box">
						<div class="review" style="background-image: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MTlfMTcz%2FMDAxNjU4MjE0MDA5NzA2.RQIp62kBmC4ga2po4F9bPFVv_zU7SvOpq5HEC6YwxwAg.7wg5PGHrpntbSgzPO1QVaYSlZLB9a1icbkV0P1jwTD0g.JPEG.sojinee%2FIMG_3839.jpg&type=sc960_832');">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MDRfNDQg%2FMDAxNjU2ODYxOTc3NzU5.j94kBnRw4XjI4afwSPjBr-SeDkI3oQPggRaSbWiqRXAg.287rvxF364vL5Jh9-LnM1eTTiNycFYuWrMW25FCzflcg.JPEG.tmmoist%2FIMG_8135.jpg&type=sc960_832');">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA3MDRfMTE2%2FMDAxNjU2OTQ2NjYzNTQ4.vVys-ye8ToMlHbcU2E9qPWmNsS7EamggZ4pNZFi8osMg.Q7CtuzauRA-HhsUQEpfll0pPZBhvXNlqWitO3C8waGcg.JPEG.slom0702%2FIMG_8999.jpg&type=sc960_832');">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMDEyMDZfMTk5%2FMDAxNjA3MjQxMjg3NTg4.jDFINP11b1dAvSkZVwaQ_ukzOGseCV5q5JG6GouS39gg.UXiyWlG_w9JHPo134aTLrfAjFaEgeRcqROUlt7f9VFwg.JPEG.tjrdmsgp%2FKakaoTalk_20201206_141123966_21.jpg&type=sc960_832');">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url('https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTEyMjBfMTQy%2FMDAxNjQwMDA0OTA1NjE3.JUUk0eEyaPipy79Fh22TuZ2dVRv2Jmo-V1a-t0-OrAEg.Jau6WVx7C0WPV1h1fbyI2KBhK3sGOCt7ULDKjPpKAMQg.JPEG.subeen__%2FIMG_6669.jpg&type=sc960_832');">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url();">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url();">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url();">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url();">
						</div>
						<div class="post-meta">
						</div>
					</article>
					<article class="review-box">
						<div class="review" style="background-image: url();">
						</div>
						<div class="post-meta">
						</div>
					</article>
				</div>
			</div>
		</main>

		<!-- bottom 이동 -->
		<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	</body>
</html>