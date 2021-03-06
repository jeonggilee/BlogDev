<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>글쓰기</title>
	</head>
	<body>
		<input type="hidden" id="idRef" value="${id}"/>
		<div class="editor-box" style="margin-top: 30px;">
			<div class="editor-top">
				<div class="pull-left">
				<span class="category-selector">
					<select id="category" class="selectpicker">
						<c:forEach items="${category}" var="mainCategory">
							<option type="main" key="${mainCategory.key.id}">${mainCategory.key.name}</option>
							<c:forEach items="${mainCategory.value}" var="subCategory">
								<option type="sub" main_category_id = "${subCategory.main_category_id}" key="${subCategory.id}">--${subCategory.name}</option>
							</c:forEach>
						</c:forEach>
					</select>
				</span>
				</div>
				<div class="pull-right">
				<a href="${contextPath}/${id}" class="btn btn-danger">돌아가기</a>
				</div>
				<br/><br/><br/>
				<input type="text" name="title" class="form-control"/>
			</div>			
			<div id="editor"></div>
			<div align="right">
				<input type="button" value="미리보기" class="btn btn-warning postPreviewBtn"/>
				<input type="button" value="작성 " class="btn btn-info postWriteBtn"/>
			</div>
		</div>
	</body>
</html>