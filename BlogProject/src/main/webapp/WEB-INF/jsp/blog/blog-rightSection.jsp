<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt"%>
<div>
	<div class="blog-header">블로그 헤더 영역으로 활용하자</div>
	
	<c:choose>
	<c:when test="${not empty posts}">
		<c:forEach items="${posts}" var="post">
			<div class="panel panel-default">
				<div class="panel-heading">
					<span class="pull-left"><strong>${post.title} </strong></span>&nbsp;&nbsp;| 
					<span class="post-category" main_category_id = "${post.main_category_id}" sub_category_id="${post.sub_category_id}">
						<c:choose>
							<c:when test="${empty post.sub_category_name}">
								${post.main_category_name}
							</c:when>
							<c:otherwise>
								${post.sub_category_name}
							</c:otherwise>
						</c:choose>
					</span>
					<span class="pull-right">
						<fmt:formatDate value="${post.create_at}" pattern="yyyy.MM.dd. HH:mm"/>	| 
						<c:if test="${sessionScope.user.id eq user.id}">
							<a href="#" class="label label-warning postEditBtn" post_id="${post.id}" main_category_id="${post.main_category_id}" sub_category_id="${post.sub_category_id}">수정</a> | 
							<a href="#" class="label label-danger postDeleteBtn" post_id="${post.id}" main_category_id="${post.main_category_id}" sub_category_id="${post.sub_category_id}">삭제</a> | 
						</c:if>
						<a href="#" class="label label-primary">전용뷰어</a>
					</span>
				</div>
				<div class="panel-body post-content">
					<div align="right" style="margin-bottom: 20px;">
						<a href="/blog/postview/${user.id}/${post.id}?main_category_id=${post.main_category_id}&sub_category_id=${post.sub_category_id}&currentPage=${page.currentPage}" class="label label-info">www.publicblog.com/blog/postview/${user.id}/${post.id}</a>
					</div>
					<div>
					${post.content}
					</div>					
				</div>
				<div class="panel-footer">
				<div class="post-footer-control clearfix">
					<div class="pull-left">
						<span class="viewCommentBtn closeToggle"><span class="glyphicon glyphicon-triangle-bottom"></span> 댓글보기</span>
					</div>
					<div class="pull-right">
						<span>공유하기</span>
						<span>수정</span>
						<span>삭제</span>
						<span>설정</span>
					</div>
				</div>
				<div class="post-comment-area form-inline" style="display: none; padding-top: 15px;">
					<table class="table table-borderless">
						<tr>
							<td>사용자이름</td>
							<td>날짜</td>
							<td align="right">
								답글 | 수정 | 삭제
							</td>
						</tr>
						<tr>
							<td colspan="4">
								댓글 내용
							</td>
						</tr>
					</table>
					<textarea class="form-control" rows="3" style="width: 88%"></textarea>
					<input type="button" class="btn btn-primary" value="comment"/>
				</div>
			</div>
			</div>
		</c:forEach>
		<div class="well" align="center">
		<c:if test="${search.main_category_id != 0}">
			<c:set var="queryString" value="main_category_id=${search.main_category_id}&"/>
		</c:if>
		<c:if test="${search.sub_category_id != 0}">
			<c:set var="queryString" value="${queryString}sub_category_id=${search.sub_category_id}&"/>
		</c:if>
			<!-- 이전 버튼 -->
			<c:if test="${page.currentPage==page.prevPage}">
			<a class="disabled">이전</a>
			</c:if>
			<c:if test="${page.currentPage!=page.prevPage}">
			<a href="/blog/${user.id}?${queryString}currentPage=${page.prevPage}">이전</a>
			</c:if>
			|
			<!-- 페이지 버튼 5개씩 출력 -->
			<c:forEach begin="${page.firstPage}" end="${page.lastPage}" var="pageIdx">
				<a href="/blog/${user.id}?${queryString}currentPage=${pageIdx}">${pageIdx}</a> | 
			</c:forEach>
				
			<!-- 다음 버튼 -->
			<c:if test="${page.currentPage==page.nextPage}">
				<a class="disabled">다음</a>			
			</c:if>
			<c:if test="${page.currentPage!=page.nextPage}">
				<a href="/blog/${user.id}?${queryString}currentPage=${page.nextPage}">다음</a>
			</c:if>
		</div>
	</c:when>
	<c:when test="${empty post}">
		포스트가 없습니다.
	</c:when>
	<c:otherwise>
		<input type="hidden" id="post_id" value="${post.id}"/>
		<c:if test="${search.main_category_id != 0}">
			<c:set var="queryString" value="?main_category_id=${search.main_category_id}"/>
		</c:if>
		<c:if test="${search.sub_category_id != 0}">
			<c:set var="queryString" value="${queryString}&sub_category_id=${search.sub_category_id}"/>
		</c:if>
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="pull-left" id="post_title"><strong>${post.title} </strong></span>&nbsp;&nbsp;| 
				<span class="post-category" main_category_id = "${post.main_category_id}" sub_category_id="${post.sub_category_id}">
						<c:choose>
							<c:when test="${empty post.sub_category_name}">
								${post.main_category_name}
							</c:when>
							<c:otherwise>
								${post.sub_category_name}
							</c:otherwise>
						</c:choose>
					</span>
				<span class="pull-right">
					<fmt:formatDate value="${post.create_at}" pattern="yyyy.MM.dd. HH:mm"/>	| 
					<c:if test="${sessionScope.user.id eq user.id}">
						<a class="label label-warning postEditBtn" post_id="${post.id}" main_category_id="${post.main_category_id}" sub_category_id="${post.sub_category_id}">수정</a> | 
						<a class="label label-danger postDeleteBtn" post_id="${post.id}" main_category_id="${post.main_category_id}" sub_category_id="${post.sub_category_id}">삭제</a> | 
					</c:if>
					<a href="#" class="label label-primary">전용뷰어</a>
				</span>
			</div>
			<div class="panel-body post-content">
				<div align="right" style="margin-bottom: 20px;">
					<a href="/blog/postview/${user.id}/${post.id}${queryString}&currentPage=${page.currentPage}" class="label label-info">www.publicblog.com/blog/postview/${user.id}/${post.id}</a>
				</div>
				<div>
				${post.content}
				</div>					
			</div>
			<div class="panel-footer">
				<div class="post-footer-control clearfix">
					<div class="pull-left">
						<span class="viewCommentBtn closeToggle"><span class="glyphicon glyphicon-triangle-bottom"></span> 댓글보기</span>
					</div>
					<div class="pull-right">
						<span>공유하기</span>
						<span>수정</span>
						<span>삭제</span>
						<span>설정</span>
					</div>
				</div>
				<div class="post-comment-area form-inline" style="display: none; padding-top: 15px;">
					<table class="table table-borderless">
						<tr>
							<td>사용자이름</td>
							<td>날짜</td>
							<td align="right">
								답글 | 수정 | 삭제
							</td>
						</tr>
						<tr>
							<td colspan="4">
								댓글 내용
							</td>
						</tr>
					</table>
					<textarea class="form-control" rows="3" style="width: 88%"></textarea>
					<input type="button" class="btn btn-primary" value="comment"/>
				</div>
			</div>
		</div>
		<div class="panel panel-default">
		<div class="panel-heading">
		<strong>
				<span class="post-category-area">
					<c:choose>
						<c:when test="${empty post.sub_category_name}">'${post.main_category_name}'</c:when>
						<c:otherwise>'${post.sub_category_name}'</c:otherwise>
					</c:choose>
				</span>
			</strong> 카테고리의 다른 글
		</div>
		<div style="padding-left: 10px; padding-right: 10px">
			<table class="table near-post-area">
				<c:forEach items="${footer}" var="footItem">
					<c:if test="${post.id == footItem.id}"><tr class="success"></c:if>
					<c:if test="${post.id != footItem.id}"><tr></c:if>
						<td align="left">

						<c:if test="${post.id == footItem.id}"><span class="glyphicon glyphicon-ok"></span></c:if>
							<a href="/blog/postview/${user.id}/${footItem.id}${queryString}&currentPage=${page.currentPage}">${footItem.title}</a>
						</td>
						<td align="right">
							<fmt:formatDate value="${footItem.create_at}" pattern="yyyy.MM.dd"/>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="panel-footer">
		<div align="center">
				<!-- Ajax로 요청 날려 다음 페이지 목록 받은 후 위 table을 갱신해야함 -->
				<c:if test="${page.currentPage == 1}">
					<a class="prevPostListBtn disabled" prev_page="${page.prevPage-1}">이전</a>
				</c:if>
				<c:if test="${page.currentPage != 1}">
					<a class="prevPostListBtn" prev_page="${page.currentPage-1}" query_string="${queryString}">이전</a>
				</c:if>
				|
				<c:if test="${page.currentPage == page.totalPage}">
					<a class="nextPostListBtn disabled" next_page="${page.currentPage+1}">다음</a> 
				</c:if>
				<c:if test="${page.currentPage != page.totalPage}">
					<a class="nextPostListBtn" next_page="${page.currentPage+1}" query_string="${queryString}">다음</a> 				
				</c:if>
			</div>
		</div>
		</div>
	</c:otherwise>
	</c:choose>	
</div>


