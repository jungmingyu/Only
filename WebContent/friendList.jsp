<%@page import="service.Follow"%>
<%@page import="java.util.List"%>
<%@page import="dto.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.2.1.js"></script>
<script type="text/javascript" src="js/timeline.js"></script>
<script type="text/javascript" src="js/search.js"></script>
<script type="text/javascript">
   $(function() {
      $('#follow').click(function() {
         //var userid =  $(this).data("followid");
         //var followid =  $(this).attr("data-followid");
         alert(userid);
         var sendData = "userid2=" + userid;
         console.log(userid);
         $.post('follow.jsp', sendData, function(data) {
            //$('#disp').html(data);
         });
      });
   });
</script>
<link rel="stylesheet" type="text/css" href="css/timelineFull.css">
<link rel="stylesheet" type="text/css" href="css/timelineMobile.css">
<link rel="stylesheet" type="text/css" href="css/search.css">
</head>
<body>
   <!-- 상단고정바 시작 -->
   <div id="header"><jsp:include page="header.jsp"></jsp:include></div>
   <!-- 상단고정바 끝 -->
   <div class="header_hidden"></div>
   <!-- 내용 들어갈 부분 -->

   <div class="search_main">
      <!-- 포스트작성 / 뷰 부분 -->
      <div class="search_post">
         <div class="page_margin"></div>
         <!-- 테스트 -->
         <!--  -->
         <ol class="search_view_box">
         <li><span style="color: #ffffff; font-weight: bold;">Following List</span><hr></li>
            
            <%
               if (request.getAttribute("followees") == null) {
            %>
            <li class="infinite_scroll"><h3>팔로우 중인 회원이 없습니다</h3></li>
            <%
               } else {
                  List<Member> followees = (ArrayList) request.getAttribute("followees");
                  for (Member member : followees) {
            %>
            <li class="search_result">
               <div class="search_profile">
                  <table width=100%>
                     <tr>
                        <td valign="middle" width="10%"><img alt=''
                           src='<%=application.getContextPath() + (member.getProfile_image())%>'>
                        </td>
                        <td valign="middle" align="left"><a href="#" class="test"
                           data-userid="<%=member.getUserid()%>"><h3><%=member.getUsername()%></h3>
                              <div class="hide" id="rmenu">
                                 <ul>
                                    <li><a href="#" id="chat">Visit</a></li>
                                    <li><a href="#" id="follow"
                                       data-followid="<%=member.getUserid()%>"><span
                                          id="followText">Follow</span></a></li>
                                    <li><a href="#" id="chat">Send Message</a></li>
                                 </ul>
                              </div> </a></td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <hr><%=member.getEmail()%><br> <%=member.getProfile_image()%><br>
                           <%=member.getBirth()%><br>
                           <hr>
                        </td>
                     </tr>
                  </table>
               </div>
            </li>
            <%
               }
               }
            %>
            <li><span style="color: #ffffff; font-weight: bold;">Follower List</span><hr></li>
            <!-- 팔로우어 리스트 -->
            <%
               if (request.getAttribute("followers") == null) {
            %>
            <li class="infinite_scroll"><h3>Follower가 없습니다</h3></li>
            <%
               } else {
                  List<Member> followers = (ArrayList) request.getAttribute("followers");
                  for (Member member : followers) {
            %>
            <li class="search_result">
               <div class="search_profile">
                  <table width=100%>
                     <tr>
                        <td valign="middle" width="10%"><img alt=''
                           src='<%=application.getContextPath() + (member.getProfile_image())%>'>
                        </td>
                        <td valign="middle" align="left"><a href="#" class="test"
                           data-userid="<%=member.getUserid()%>"><h3><%=member.getUsername()%></h3>
                              <div class="hide" id="rmenu">
                                 <ul>
                                    <li><a href="#" id="chat">Visit</a></li>
                                    <li><a href="#" id="follow"
                                       data-followid="<%=member.getUserid()%>"><span
                                          id="followText">Follow</span></a></li>
                                    <li><a href="#" id="chat">Send Message</a></li>
                                 </ul>
                              </div> </a></td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <hr><%=member.getEmail()%><br> <%=member.getProfile_image()%><br>
                           <%=member.getBirth()%><br>
                           <hr>
                        </td>
                     </tr>
                  </table>
               </div>
            </li>
            <%
               }
               }
            %>
         </ol>

      </div>
      <!-- 포스트작성 / 뷰 끝 -->
      <!-- aside 부분 / *팔로우 추천, 광고등 -->
      <div class="timeline_aside">
         <div class="page_margin"></div>
         <div class="aside_follow">
            <h3>팔로우 추천 테스트</h3>
            <hr>
            내용 테스트<br> 내용 테스트<br> 내용 테스트<br>
         </div>
         <div class="aside_interested">
            <h3>내 관심사 테스트</h3>
            <hr>
            내용 테스트<br> 내용 테스트<br> 내용 테스트<br>
         </div>
      </div>
      <!-- aside 부분 / *팔로우 추천, 광고등 끝 -->
   </div>
   <!-- 내용 들어갈 부분 끝 -->
</body>
</html>