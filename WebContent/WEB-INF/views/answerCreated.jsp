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
<title>답 글 달 기</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css?" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js?"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js?"></script>

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<!-- 게시판 스타일 -->
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/notice_style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/notice_created.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/mainpage.css">

<!-- 내용 검사 정규식 -->
<script type="text/javascript" src="<%=cp %>/js/util.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#summernote').summernote({
        height: 200,          // 기본 높이값
        minHeight: 250,      // 최소 높이값(null은 제한 없음)
        maxHeight: null,      // 최대 높이값(null은 제한 없음)
        focus: true,          // 페이지가 열릴때 포커스를 지정함
        lang: 'ko-KR',         // 한국어 지정(기본값은 en-US)
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'italic', 'underline', 'clear']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['table', ['table']],
          ],
      });
});

function sendIt()
{
	f = document.myForm;
	
	str = f.userId.value;
	str = str.trim();
	//-- javascript 에는 trim() 이 없음.
	//   외부에서 참조한 『util.js』에 만들어 두었음
	
	if(!str)
	{
		alert("작성자의 이름을 입력하세요!!!");
		f.userId.focus();
		return;
	}
	
 	str = f.content.value;
	str = str.trim();
	
	if(!str)
	{
		alert("게시물의 내용을 입력하세요!");
		f.content.focus();
		return;
	}
	
	f.action = "<%=cp%>/answercreatedok.action?qNum=${qNum}&pageNum=${pageNum}";
	
	f.submit();
}
</script>
<!-- 내용상자 크기 -->
</head>
<body>
<c:import url="navigationBar.jsp"></c:import>

<div id="bbs" style="margin-top: 100px;">
	<div id="bbs_title">
		답 글 달 기
	</div><!-- bbs_title -->
	
	<form method="post" name="myForm">
		<table class="table table-borderd" id="tblAdd">
			<tr>
				<th style="width: 100px;">작성자</th>
				<td>
					<input type="text" name="userId" class="form-control" size="35" maxlength="20" placeholder="이름을 입력하세요" value="${sessionScope.login.userId }">
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea name="content" id="summernote"></textarea></td>
			</tr>
		</table>
	
		<div id="bbsCreated_footer">
			<input type="button" value="등록하기" class="btn btn-success" onclick="sendIt()">
			<input type="reset" value="다시입력" class="btn btn-info" onclick="document.myForm.aMaintext.focus()">
			<input type="button" value="작성취소" class="btn btn-danger" onclick="javascript:location.href='<%=cp%>/questionarticle.action?qNum=${qNum }&pageNum=${pageNum }'">			
		</div><!-- #bbsCreated_footer  -->
	</form>
</div>
</body>
</html>