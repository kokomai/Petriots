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
<title>Petriots! | 공지사항</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/notice_style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/notice_list.css">
<link href="css/mainpage.css" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
body
{
	padding-top: 100px;
}
</style>
<script type="text/javascript">
function sendIt()
{
	var f = document.searchForm;
	
	// 검색 키워드에 대한 유효성 검사 코드 활용 가능
	f.action = "<%=cp%>/noticelist.action";
	f.submit();
}
</script>
</head>
<c:if test="${empty sessionScope.admin_num.getId() }">
<c:import url="navigationBar.jsp"></c:import>
</c:if>
<c:if test="${!empty sessionScope.admin_num.getId() }">
<c:import url="adminPageSideMenu.jsp"></c:import>
</c:if>
<body>
<div id="bbsList">
	<div id="bbsList_title" style="border-color:#6cc9fb">
 		공 지 사 항
	</div>
	
	<div id="bbsList_header">
		<div id ="leftHeader">
			<form action="" name ="searchForm" method="get">
				<select name="searchKey" class="selectField">
					<option value="subject">제목 ${sessionScope.adminLogin.getAdmin_num() }</option>
					<option value="id">작성자</option>
					<option value="maintext">내용</option>
				</select>
				<input type="text" name="searchValue" class="textField" style="height: 20px;">
				<input type="button" value="검색" class="btn btn-info btn-sm" onclick="sendIt()"> 
			</form>
		</div><!-- "leftHeader" -->	
		<c:if test="${!empty sessionScope.admin_num.getId() }">
		<div id ="rightHeader">
			<input type="button" value="글올리기" class="btn btn-info btn-sm" onclick="javascript:location.href='<%=cp%>/noticecreated.action'">			
		</div><!-- "rightHeader" -->
		</c:if>
	</div><!-- "bbsList_header" -->

	<div id="bbsList_list" style="margin-top: 10px;">
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
		 				<a href="<%=cp%>/noticearticle.action?ntcNum=${dto.ntcNum}&pageNum=${current_page}"> 
		 					<span style="color: black;">${dto.subject}</span>
		 				</a>
		 			</dd>
					
					<dd class="name"> <span style="font-size: 12px;">${dto.adminId}</span></dd>
					<dd class="created"> <span style="font-size: 12px;">${dto.isudate}</span></dd>
					<dd class="hitCount"> <span style="font-size: 12px;">${dto.views}</span></dd>
		 		</dl>
			</c:forEach>
		</div><!-- lists -->
		
		<div id="footer">
			<p>
				<c:if test="${data_count ne 0 }">${pageIndexList }</c:if>
				<c:if test="${data_count eq 0 }">등록된 게시물이 없습니다.</c:if>
			</p>
		</div><!-- #footer -->
	</div><!-- bbsList_list -->
</div>
</body>
</html>