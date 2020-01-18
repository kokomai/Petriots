/*
 * MyUtil.java
 * - 게시판 페이징 처리
 * */

/*
 * 지금 함께 확인해보고자 하는 페이징 처리 기법은
 * 다양한 방법들 중 겨우 한 가지(그 중 ... 비교적 쉬운 개념 적용)이다.
 * 학습을 마친 이후에... 추가적으로 개념을 정리하고, 확장시키고,
 * 다른 방법들도 찾아 적용하여 공부해야할 것이다.
 * */

package com.teamp.petriots.util;

public class MyUtil
{
   // ■ 전체 페이지 수를 구하는 메소드
   
   // numPerPage : 한 페이지에 표시할 데이터의 수
   // dateCount : 전체 데이터 수
   public int getPageCount(int numPerPage, int dataCount)
   {
      int pageCount = 0;
      
      pageCount = dataCount / numPerPage;
      
      if(dataCount % numPerPage != 0)
         pageCount++;
      
      return pageCount;
   }// end getPageCount()
   
   
   /*
    * current_page : 현재 표시할 페이지 
    * total_page : 전체 페이지 수
    * list_url : 페이지 각각의 페이지에 링크를 설정할 url
    */
   public String pageIndexList(int current_page, int total_page, String list_url)
   {
      StringBuffer strList = new StringBuffer();
      
      int numPerBlock = 10;
      // 페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
      
      
      int currentPageSetup;
      // 현재 페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야 하기 때문...)
      
      int page;
      int n;
      // 이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수
      // (얼마만큼 이동해야 하는지...)
      
      
      // 페이징 처리가 별도로 필요하지 않은경우
      // 데이터가 존재하지 않거나 데이터 수가 1페이지도 채우지 못하는 경우는
      // 별도로 페이징 처리를 할 필요가 없다.
      if (current_page == 0)
         return "";
      
      
      // 페이지 요청을 처리하는 과정에서
      // URL 경로의 패턴에 대한 처리
      if (list_url.indexOf("?") != -1)
         list_url = list_url + "&";
      else
         list_url = list_url + "?";
      
      
      // currentPageSetup = 표시할 첫 페이지 - 1
      currentPageSetup = (current_page/numPerBlock) * numPerBlock;
      // 만약
      // 현재 페이지가 5 페이지고 
      // 리스트 하단에 보여줄 페이지 갯수가 10이면
      //  5/10 = currentpageSetup 이며
      // 여기에 * 10을 곱해도 0이다.
      // 하지만 현재 페이지가 11페이지라면 
      // 11/10 = 1
      // 여기에 * 10 을 수행하면 10 이다.
      
      
      if (current_page % numPerBlock == 0)
         currentPageSetup = currentPageSetup - numPerBlock;
      
      // 1페이지를 그려내는 조건문
      if ((total_page > numPerBlock) && (currentPageSetup > 0))
         strList.append("<a href='"+list_url+"pageNum=1'>처음으로</a>&nbsp;");
      
      n = current_page - numPerBlock;
      if ((total_page > numPerBlock) && (currentPageSetup > 0))
         strList.append("<a href='"+list_url+"pageNum="+n+"'>prev</a>&nbsp;");

      page = currentPageSetup + 1;
      
      while ((page <= total_page) && (page <=currentPageSetup + numPerBlock))
      {
         if (page == current_page)
            strList.append("<span style='color:orange; font-weight:bold'>" + page + "</span>&nbsp;");
         else
            strList.append("<a style='color: black;' href='"+ list_url + "pageNum=" + page + "'>" + page + "</a>&nbsp;");
         
         page++;
      }
      
      n = current_page + numPerBlock;
      if ((total_page - currentPageSetup) > numPerBlock)
         strList.append("<a href='"+ list_url + "pageNum=" + n + "'>Next</a>&nbsp;");
      if ((total_page > numPerBlock) && ((currentPageSetup + numPerBlock) < total_page))
         strList.append("<a href='"+ list_url + "pageNum=" + total_page + "'>"+total_page+"</a>&nbsp;");
      
      return strList.toString();
   }
   
   public String checkNull(String str)
   {
      if (str == null)
      {
         str = "";
      }
      return str;
      
   }
}