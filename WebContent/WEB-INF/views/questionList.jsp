<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Petriots! | Q&A 게시판</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/notice_style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/notice_list.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mainpage.css">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
body
{
	padding-top: 100px;
}
a
{
	color: black;
}
</style>
<script type="text/javascript">
function sendIt()
{
	var f = document.searchForm;
	
	// 검색 키워드에 대한 유효성 검사 코드 활용 가능
	f.action = "<%=cp%>/questionlist.action";
	f.submit();
}
</script>
</head>
<c:import url="navigationBar.jsp"></c:import>
<body>
<div id="bbsList">
	<div id="bbsList_title" style="border-color:#6cc9fb">
 		Q / A 게시판
	</div>
	
	<div id="bbsList_header">
		<div id ="leftHeader">
			<form name ="searchForm" method="get">
				<select name="searchKey" class="selectField">
					<option value="q_subject">제목</option>
					<option value="userId">작성자</option>
					<option value="maintext">내용</option>
				</select>
				<input type="text" name="searchValue" class="textField" style="height: 20px;">
				<input type="button" value="검색" class="btn btn-info btn-sm" onclick="sendIt()"> 
			</form>
		</div><!-- "leftHeader" -->	
		
		<c:if test="${!empty sessionScope.login.userId }">		
			<div id ="rightHeader">
				<input type="button" value="글올리기" class="btn btn-info btn-sm" onclick="javascript:location.href='<%=cp%>/questioncreated.action'">
			</div><!-- "rightHeader" -->
		</c:if>
	</div><!-- "bbsList_header" -->

	<div id="bbsList_list"  style="margin-top: 10px;">
		<div id="title">
			<dl>
				<dt class="num"> 번호 </dt>
				<dt class="subject"> 제목 </dt>
				<dt class="name"> 작성자 </dt>
				<dt class="created"> 작성일 </dt>
				<dt class="hitCount"> 조회수 </dt>
			</dl>
		</div><!-- title -->
	
		<div id="lists">
			<c:forEach var="dto" items="${lists }">
				<dl>
		 			<dd class="num">${dto.rNum}</dd>
		 			
		 			<!-- 리스트 상 게시물 제목에 링크 설정 추가 -->
		 			<dd class="subject" style="color: black;">
		 				<a href="<%=cp%>/questionarticle.action?qNum=${dto.qNum}&pageNum=${current_page}">
		 					<span style="color: black;">${dto.qSubject}</span>
		 				</a>
		 			</dd>
					
					<dd class="name"><span style="font-size: 12px;">${dto.userId}</span></dd>
					<dd class="created"><span style="font-size: 12px;">${dto.qIsudate}</span></dd>
					<dd class="hitCount"><span style="font-size: 12px;">${dto.qViews}</span></dd>	
	 			</dl>
			</c:forEach>
		</div><!-- lists -->
		
		<div id="footer">
			<p>
				<a style="color: black;"></a>
				<c:if test="${data_count != 0 }">${pageIndexList }</c:if>
				<c:if test="${data_count == 0 }">등록된 게시물이 없습니다.</c:if>
			</p>
		</div><!-- #footer -->
	</div><!-- bbsList_list -->
</div>
</body>
</html>