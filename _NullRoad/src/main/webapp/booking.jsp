<%@page import="Model.MemberVO"%>
<%@page import="Model.DAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.BuildingVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>예약하기</title>
	<meta charset="EUC-KR">
	<meta name="description" content="Cryptocurrency Landing Page Template">
	<meta name="keywords" content="cryptocurrency, unica, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/themify-icons.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>

    <style>

        
      img {
        max-width: 100%;
      }
        .spad{
            padding-top:50px;
        }
      
        .jb-a {
            
          width: 400px;
          margin: 0px auto;
          position: relative
          
        }
        .jb-c {
          position: absolute;
          top: 0px;
          left: 0px;
          display: none;
        }
        .jb-a:hover .jb-c {
          display: block;
        }
        .jb-c {
          position: absolute;
           top: 0px;
          left: 0px;
          opacity: 0;
          transition: opacity 0.5s linear;
  }
      .jb-a:hover .jb-c {
           opacity: 1;
  }
  .container-login100-form-btn {
  width: 100%;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  padding-top: 20px;
}

.login100-form-btn {
  font-family: Montserrat-Bold;
  font-size: 15px;
  line-height: 1.5;
  color: #fff;
  text-transform: uppercase;
  height: 50px;
  border-radius: 5px;
  background: #7e3bc3;
  display: -webkit-box;
  display: -webkit-flex;
  display: -moz-box;
  display: -ms-flexbox;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 0 25px;

  -webkit-transition: all 0.4s;
  -o-transition: all 0.4s;
  -moz-transition: all 0.4s;
  transition: all 0.4s;
}

.login100-form-btn:hover {
  background: #484748;
}

      </style>
</head>
<body>

	<% 
	DAO dao = new DAO();
	session = request.getSession();
	int bld_seq =0;
	ArrayList<BuildingVO> bld_list =null;
	String str = request.getParameter("data");
	if(str==null){
		bld_seq = 27 ;
		%>
		<script type="text/javascript">
		alert("주차장 선택이 되지 않았습니다.");
		</script>
		<%
	}else{
		bld_seq = Integer.parseInt(request.getParameter("data"));
	}
	bld_list = dao.BldSelOne(bld_seq);
	BuildingVO bldvo = bld_list.get(0);
	session.setAttribute("bldvo", bldvo);
	MemberVO mvo = null;
	if (session.getAttribute("mvo")!=null){
		mvo = (MemberVO)session.getAttribute("mvo");
		session.setAttribute("mvo", mvo);
	}else{
		response.sendRedirect("login.jsp?page=booking.jsp");
	}
	%>
<%
   String loginYN = "login.jsp?page=";
   String selflink = "booking.jsp";
   if (mvo!=null){loginYN = "";}
   
%>
   <!-- Page Preloder -->
   <div id="preloder">
      <div class="loader"></div>
   </div>
   <!-- Header section -->
   <header class="header-section clearfix">
      <div class="container-fluid">
         <a href="main.jsp" class="site-logo" style="font-family : ImcreSoojin; font-size:40px;">
            nroad
         </a>
         <%if(mvo==null){%>
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="login.jsp?page=<%=selflink%>" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="login.jsp?page=<%=selflink%>" class="site-btn">로그인</a>
         <%}else{ %> 
         <div class="responsive-bar" style="margin-top: 10px;"><i class="fa fa-bars" ></i></div>
         <a href="Logout.do?page=<%=selflink%>" class="user" style="margin-top: 10px;"><i class="fa fa-user"></i></a>
         <a href="Logout.do?page=<%=selflink%>" class="site-btn">로그아웃</a>
         <%} %>
         <nav class="main-menu">
            <ul class="menu-list">
               <div class="dropdown">
                  <button class="dropbtn"><b>About us&nbsp;</b></button>
                  <div class="dropdown-content">
                    <a href="about.jsp">개발의도</a>
                    <a href="gide.jsp">사용방법</a>
                  </div>
                 </div>
               <div class="dropdown">
                  <button class="dropbtn"><b>Community&nbsp;</b></button>
                  <div class="dropdown-content">
                    <a href="<%=loginYN%>Bo_Reviewboard.jsp">리뷰게시판</a>
                    <a href="<%=loginYN%>Bo_Freeboard.jsp">자유게시판</a>
                  </div>
                 </div>
               <div class="dropdown">
                  <button class="dropbtn"><b>Service</b></button>
                  <div class="dropdown-content">
                    <a href="<%=loginYN%>contact.jsp">공유하기</a>
                    <a href="<%=loginYN%>one.jsp">1:1문의</a>
                    <a href="<%=loginYN%>Q_QNA.jsp">Q&A</a>
                    <a href="<%=loginYN%>mypage.jsp">마이페이지</a>
                  </div>
                 </div>

            </ul>
         </nav>
      </div>
   </header>
   <!-- Header section end -->


	<!-- Page info section -->
	<div class = "mobile">
		<section class="page-info-section">
		  <div class="container">
		  </div>
		</section>
		</div>
		<!-- Page info end -->

<p>&nbsp;</p><p>&nbsp;</p>
	<!-- About section -->
	<section class="about-section spad">
		<div class="container">
			<div class="row">
                <div class="about-img">
                    <div class="jb-a">
                        <img src="img/주차도면3.png" alt="" class="jb-b" onclick=>
                        <img src="img/주차도면2.png" alt="" class="jb-c">
                      </div>
                </div>
				<div class="col-lg-6 offset-lg-6 about-text">
                    <br>
					<h2>예약하기</h2>
					<h5>Usable : A1, A2, A4, A5</h5>
					<p> 시간당 <%=dao.PrkFeeSelect(bldvo.getBld_seq()) %>원<br>
                        주소 : <%=bldvo.getSigungu()%> <%=bldvo.getEmdong()%> <%=bldvo.getDetail_addr() %><br>
                        건물명 : <%=bldvo.getBld_name() %>
                        <br><br><br>
					</p>
					<div class="container-login100-form-btn">
					<form action="PayReserveService.do?booking.jsp"><!-- 예약서비스  -->
						<input type="text" name ="bld_seq" value="<%=bldvo.getBld_seq()%>" style="display:none">
						<input type="submit" id="alertStart"class="login100-form-btn" value="예약하기">
					</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About section end -->






<!-- Footer section -->
<footer class="footer-section">
	<div class="container">
		<div class="row spad">


		<div class="footer-bottom">
			<div class="row">

				<div class="col-lg-8 text-center text-lg-right">
					<ul class="footer-nav">
						<li><a href=""></a></li>
						<li><a href="">King Jo</a></li>
						<li><a href="">60, Songam-ro, Nam-gu, Gwangju, Republic of Korea</a></li>
						<li><a href="">bszt123@naver.com</a></li>
						<li><a href="">010-3083-0491</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</footer>


	<!--====== Javascripts & Jquery ======-->


	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
    <script src= "js/alert.js" charset=UTF-8></script>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>




</body>
</html>
