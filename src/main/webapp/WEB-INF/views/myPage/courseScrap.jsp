<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arTchive / 마이페이지 - 코스 스크랩</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/tools/reset.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/common.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/css/myPage/courseScrap.css'/>" />
<script src="https://kit.fontawesome.com/50d21a2bed.js"
	crossorigin="anonymous"></script>
<script src="<c:url value='/tools/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/myPage/bookMarkCourse.js'/>"></script>

</head>
<body>
	<div class="wrapper">
		<c:import url="/WEB-INF/views/layout/top.jsp" />

		<section>

			<main id="course-container">
				<div class="course-box main-title-box">
					<h1 class="h1">MyPage</h1>

				</div>
				<div class="course-box guide-box">
					<nav>
						<ul class="tabMenu">
							<li><a href="<c:url value='/myPage/home'/>"><i class="fa-solid fa-house"></i> 홈</a></li>
							<li><a href="<c:url value='/myPage/myGallery'/>"><i class="fa-solid fa-photo-film"></i> 내 전시</a></li>
							<li><a href="<c:url value='/myPage/myCourse'/>"><i class="fa-solid fa-route"></i> 내 코스</a></li>
							<li><a href="<c:url value='/myPage/recmd'/>"> <i class="fa-solid fa-thumbs-up"></i> 추천 콘텐츠</a></li>
							<li><a href="<c:url value='/myPage/post'/>"><i class="fa-solid fa-pen"></i> 활동 내역</a></li>
							<li><a href="<c:url value='/myPage/review'/>"><i class="fa-solid fa-star"></i> 전시 리뷰</a></li>
							<li><a href="<c:url value='/myPage/check'/>"><i class="fa-solid fa-gears"></i> 개인정보 수정</a></li>
							<li><a href="<c:url value='/myPage/check2'/>"><i class="fa-solid fa-unlock-keyhole"></i> 비밀번호 설정</a></li>
							<li><a href="<c:url value='/myPage/withdraw'/>"><i class="fa-solid fa-right-from-bracket"></i> 회원 탈퇴</a></li>
						</ul>
					</nav>

					<div class="myPageBox">

						<h2>내 전시</h2>
						<p class="line">
						<div class="titleBox">
							<a href="<c:url value='/myPage/myCourse'/>">작성한 코스</a> 
							<a href="<c:url value='/myPage/courseScrap'/>">스크랩</a> 
							<a href="<c:url value='/myPage/courseComment'/>">댓글</a>
						</div>
						<!-- titleBox -->

						<div class="tableBox">
							<table>
								<thead>
									<tr>
										<th>제목</th>
										<th>등록일</th>
										<th>상태</th>
									</tr>

								</thead>

								<tbody>
									<c:choose>

										<c:when test="${empty bookMarkCourseList}">
											<tr>
												<td colspan="3">관심 등록한 코스가 없습니다.</td>
											</tr>
										</c:when>

										<c:otherwise>
											<c:forEach items="${bookMarkCourseList}" var="bookmarkCourse"
												varStatus="status">
												<tr>
													<td><a
														href="<c:url value='/course/${bookmarkCourse.courseId}'/>">${bookmarkCourse.courseTitle}</a></td>
													<td><fmt:formatDate value="${bookmarkCourse.bookMarkCourseDate}"
															pattern="yyyy-MM-dd" /></td>
													<td><input type="button"
														class="deleteBookMarkBtn white-btn"
														onclick="deleteBookMarkCourse(${bookmarkCourse.bookMarkCourseId})"
														value="삭제"></td>
												</tr>
											</c:forEach>
										</c:otherwise>

									</c:choose>
								</tbody>

							</table>
						</div>
						<!--tableBox -->

					</div>
					<!-- myPageBox -->
				</div>
			</main>

		</section>
	</div>
	<!-- wrapper -->
	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
</body>
</html>