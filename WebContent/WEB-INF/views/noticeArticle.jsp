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
<title>Petriots! | ${dto.subject }</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/notice_style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/notice_article.css">
<script type="text/javascript">
function CoDel()
{
	var del = confirm("정말 삭제하시겠습니까?");
	
	if (del == true)
	{
		location.href="<%=cp%>/noticedelete.action?ntcNum=${dto.ntcNum }&pageNum=${pageNum}"
	}
}
</script>
<link href="css/mainpage.css" rel="stylesheet">
</head>
<body>
<c:import url="navigationBar.jsp"></c:import>

<div id="bbs" style="margin-top: 100px;">
	<div id="bbs_title" style="border-color:#6cc9fb">
		공 지 사 항
	</div><!-- #bs_title -->
		
	<div id="bbsArticle" style="border-color:#6cc9fb">
		<div id="bbsArticle_header" style="border-color:#6cc9fb">
			<!-- 게시물 제목 -->
			${dto.subject }
		</div><!-- #bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine" style="border-color:#6cc9fb">
			<dl>
				<dt style="background-color:#6cc9fb;">작성자</dt>
				<dd>${dto.adminId }</dd>
				<dt style="background-color:#6cc9fb;">라인수</dt>
				<dd>${lineSu }</dd>
			</dl>
		</div><!-- #bbsArticle_bottomLine -->
	
		<div class="bbsArticle_bottomLine" style="border-color:#6cc9fb">
			<dl>
				<dt style="background-color:#6cc9fb;">등록일</dt>
				<dd>${dto.isudate }</dd>
				<dt style="background-color:#6cc9fb;">조회수</dt>
				<dd>${dto.views }</dd>
			</dl>
		</div><!-- #bbsArticle_bottomLine -->
	
		<div id="bbsArticle_content" style="border-color:#6cc9fb">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: :top; height:150;">
						${dto.maintext }
					</td>
				</tr>
			</table>
		</div><!-- #bbsArticle_content -->
	
		<div class="bbsArticle_bottomLine" style="border-color:#6cc9fb;">			
			<c:if test="${beforeNum ne -1 }">
				이전글 : (${beforeNum})
				<a href="noticearticle.action?ntcNum=${beforeNum }&pageNum=${pageNum }">
				<span style="color: black;">${dtoBefore.subject }</span>
				</a>
			</c:if>
			<c:if test="${beforeNum eq -1 }">
			이전글 : (없음)
			</c:if>
		</div><!-- #bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">	
			<c:if test="${nextNum ne -1 }">
				다음글 : (${nextNum})
				<a href="noticearticle.action?ntcNum=${nextNum }&pageNum=${pageNum }">
					<span style="color: black;">${dtoNext.subject }</span>
				</a>
			</c:if>
			<c:if test="${nextNum eq -1 }">
			다음글 : (없음)
			</c:if>
		</div><!-- #bbsArticle.noLine -->
	</div><!-- #bbsArticle -->
		
	<div id="bbsArticle_footer">
	<c:if test="${!empty sessionScope.admin_num.getId() }">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn btn-info btn-sm" onclick="javascript:location.href='<%=cp%>/noticeupdated.action?ntcNum=${dto.ntcNum }&pageNum=${pageNum}'">
			<input type="button" value="삭제" class="btn btn-danger btn-sm" onclick="CoDel()">
		</div><!-- leftFooter -->
	</c:if>
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/noticelist.action?pageNum=${pageNum}'">
		</div><!-- rightFooter  -->
	</div><!-- #bbsArticle_footer -->
</div>
</body>
</html>