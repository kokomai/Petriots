<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/notice_style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/notice_article.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
function CoDel()
{
   var del = confirm("정말 삭제하시겠습니까?");
   
   if (del == true)
   {
      location.href="<%=cp%>/questiondelete.action?qNum=${dto.qNum }&pageNum=${pageNum}"
   }
}

function addComment(qCNum)
{
   $("#qCNum").val(qCNum);
   var div = document.createElement('div');
    div.innerHTML = document.getElementById('addComment').innerHTML;
    document.getElementById('field').appendChild(div);
}

function updateComment(qCNum, oriQCMaintext)
{
   $("#qCNum1").val(qCNum);
   $("#oriQCMaintext").val('QCMaintext');
   var div = document.createElement('div');
    div.innerHTML = document.getElementById('updateComment').innerHTML;
    document.getElementById('field').appendChild(div);
}

function removeComment(obj)
{
   $("#field *").remove();
}

function qCoDel(qCNum)
{
   location.href="<%=cp%>/qcommentdelete.action?qNum=${dto.qNum }&pageNum=${pageNum}&qCNum=" + qCNum
}
</script>
<link href="css/mainpage.css" rel="stylesheet">
</head>
<body>
<c:import url="navigationBar.jsp"></c:import>

<div id="bbs" style="margin-top: 100px;">
   <div id="bbs_title" style="border-color:#6cc9fb">
      Q / A 게시판
   </div><!-- #bs_title -->
      
   <div id="bbsArticle" style="border-color:#6cc9fb">
      <div id="bbsArticle_header" style="border-color:#6cc9fb">
         <!-- 게시물 제목 -->
         ${dto.qSubject}
      </div><!-- #bbsArticle_header -->
      
      <div class="bbsArticle_bottomLine" style="border-color:#6cc9fb">
         <dl>
            <dt style="background-color:#6cc9fb;">작성자</dt>
            <dd>${dto.userId}</dd>
            <dt style="background-color:#6cc9fb;">라인수</dt>
            <dd>${lineSu }</dd>
         </dl>
      </div><!-- #bbsArticle_bottomLine -->
   
      <div class="bbsArticle_bottomLine" style="border-color:#6cc9fb">
         <dl>
            <dt style="background-color:#6cc9fb;">등록일</dt>
            <dd>${dto.qIsudate }</dd>
            <dt style="background-color:#6cc9fb;">조회수</dt>
            <dd>${dto.qViews }</dd>
         </dl>
      </div><!-- #bbsArticle_bottomLine -->
   
      <div id="bbsArticle_content" style="border-color:#6cc9fb">
         <table style="width: 600;">
            <tr>
               <td style="padding: 10px 40px 10px 10px; vertical-align: :top; height:150;">
                  ${dto.qMaintext }
               </td>
            </tr>
         </table>
      </div><!-- #bbsArticle_content -->
   
      <br>   
   
      <c:if test="${!empty sessionScope.login.userId }">
         <div id="list">
            <form id="myForm" action="<%=cp%>/qcommentcreatedok.action?qNum=${dto.qNum}&pageNum=${pageNum}" method="post">
               <table style="width: 600px;">
                  <tr>
                     <td>
                        <input type="text" name="qComment" class="form-control" style="width: 500px; display: inline;">
                        <button type="submit" class="btn btn-success btn-sm" style="float: right;">댓글 등록</button>
                        <hr style="color: #6cc9fb;">
                     </td>
                  </tr>
               </table>
            </form>
         </div>
      </c:if>

      <div id="lists" style="margin-bottom: 10px;">
         <c:forEach var="dto1" items="${lists }">
         <c:set var="qCMaintext" value="${dto1.qCMaintext }"></c:set>
         <c:set var="qcMaintext1" value="${fn:replace(qCMaintext, ' ', '&nbsp')}"></c:set>
            <table style="width: 600px;">
               <tr>
                  <td rowspan="2">${qcMaintext1 } </td>
                  <td align="right">
                     <c:if test="${'N' eq dto1.deldate }">
                        <c:if test="${!empty sessionScope.login.userId }">
                           <input type="button" value="대댓글 등록" id="qComment" onclick="addComment(${dto1.qCNum})">
                        </c:if>
                        <c:if test="${!empty sessionScope.login.userId && sessionScope.login.userId eq dto1.userId}">
                           <input type="button" value="수정" onclick="updateComment(${dto1.qCNum}, '${dto1.oriQCMaintext}')" >
                           <input type="button" value="삭제" onclick="qCoDel(${dto1.qCNum})">
                        </c:if>
                     </c:if>
                  </td>
               </tr>
            </table>
            
            <div id="addComment" style="display: none;">
               <form action="<%=cp %>/qcommentcreatedok.action?qNum=${dto.qNum }&pageNum=${pageNum}" method="post">
                  <input type="hidden" id="qCNum" name="qCNum" value="">
                  <input type="text" id="qComment" name="qComment" class="form-control" style="width: 450px; display: inline;">
                  <input type="button" value="삭제" class="btn btn-danger btn-sm" onclick="removeComment(this)" style="float: right;">
                  <button type="submit" class="btn btn-success btn-sm" style="float: right;">대댓글 등록</button>
               </form>
            </div>
            
            <div id="updateComment" style="display: none;">
               <form action="<%=cp %>/qcommentupdatedok.action?qNum=${dto.qNum }&pageNum=${pageNum}" method="post">
                  <input type="hidden" id="qCNum1" name="qCNum" value="">
                  <input type="text" id="oriQCMaintext" name="qComment" class="form-control" style="width: 450px; display: inline;">
                  <input type="button" value="삭제" class="btn btn-danger btn-sm" onclick="removeComment(this)" style="float: right;">
                  <button type="submit" class="btn btn-success btn-sm" style="float: right;">대댓글 수정</button>
               </form>
            </div>
         </c:forEach>
         
         <div id="field" style="padding-top: 10px;"></div>
      </div><!-- lists -->
   </div>
      
   <div id="bbsArticle_footer">
      <c:if test="${sessionScope.login.userId eq dto.userId}">
         <div id="leftFooter">
            <input type="button" value="수정" class="btn btn-info btn-sm" onclick="javascript:location.href='<%=cp%>/questionupdated.action?qNum=${dto.qNum }&pageNum=${pageNum}'">
            <input type="button" value="삭제" class="btn btn-danger btn-sm" onclick="CoDel()">
         </div><!-- leftFooter -->
      </c:if>
      
      <div id="rightFooter">
         <c:if test="${!empty sessionScope.login.userId }">
            <input type="button" value="답글등록" class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/answercreated.action?qNum=${dto.qNum }&pageNum=${pageNum}'">
         </c:if>
         <input type="button" value="리스트" class="btn btn-success btn-sm" onclick="javascript:location.href='<%=cp%>/questionlist.action?pageNum=${pageNum}'">
      </div><!-- rightFooter  -->
   </div><!-- #bbsArticle_footer -->
</div>

<c:forEach var="lists" items="${aLists }">
   <div id="bbs" style="margin-top: 30px;">
      <div id="bbsArticle" style="border-color:#6cc9fb">
         <div class="bbsArticle_bottomLine" style="border-color:#6cc9fb">
            <dl>
               <dd>${lists.userId}님의 답변</dd>
               <dd>등록일 : ${lists.aIsudate }</dd>
            </dl>
         </div><!-- #bbsArticle_bottomLine -->
   
         <div id="bbsArticle_content" style="border-color:#6cc9fb">
            <table style="width: 600;">
               <tr>
                  <td style="padding: 10px 40px 10px 10px; vertical-align: :top; height:150;">
                     ${lists.aMaintext }
                  </td>
               </tr>
            </table>
         </div><!-- #bbsArticle_content -->
         <br>   
      </div>
         
      <div id="bbsArticle_footer">
         <div id="leftFooter">
            <c:if test="${sessionScope.login.userId eq lists.userId}">
               <input type="button" value="수정" class="btn btn-info btn-sm" onclick="javascript:location.href='<%=cp%>/answerupdated.action?qNum=${lists.qNum }&aNum=${lists.aNum }&pageNum=${pageNum}'">
               <input type="button" value="삭제" class="btn btn-danger btn-sm" onclick="javascript:location.href='<%=cp%>/answerdelete.action?qNum=${lists.qNum }&aNum=${lists.aNum }&pageNum=${pageNum}'">
            </c:if>
         </div><!-- leftFooter -->
      </div><!-- #bbsArticle_footer -->
   </div>
</c:forEach>
</body>
</html>