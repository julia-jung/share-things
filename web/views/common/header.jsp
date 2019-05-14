<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.st.member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<style>
	hr {
		border: 1px solid #F44A0C;
	}
	.col {
		display: inline-block;
	}
	.middle {
		display:relative;
	}
	.logoArea:hover {
		cursor:pointer;
	}
	.searchArea, .rentBtnArea {
		display:absolute;
		top:50%;
		height:50px;
		margin-top:3em;
	}
	.registerBtn {
		background:#0CB6F4 !important; 
		color:gary !important;
	}
	#menubarArea {
		border-top:2px solid #F44A0C;
		border-bottom:2px solid #F44A0C;
		background:white;
	}
	.sticky {
		position:fixed;
		top:0;
		z-index:100;
	}
	.sticky + #forPadding {
		padding-top:100px;
	}
	#submenuArea {
		font-size:70%;
		background:#F44A0C;
		border-bottom:2px solid #F44A0C;
		display:none;
	}
	
	#menubar td, #submenu td {
		height:70px;
		width:175px;
		vertical-align:middle;
		text-align:center;
	}
	#submenu td {
		vertical-align:top;
	}
	
	#menubar td:first-of-type, #submenu td:first-of-type {
		width:180px;
		background:#F44A0C;
		color:white;
	}
	#menubar td:hover {
		background:#0CB6F4;
		cursor:pointer;
	}
	.category {
		margin:0;
		height:100%; 
		font-weight:bold;		
		line-height:70px;
	}
	#submenu ul {
		list-style-type:none;
		margin:0;
		padding:0;
	}
	#submenu li {
		height:30px;
		line-height:30px;
	}
	#submenu li:hover {
		background:white;
		color:#F44A0C;
	}
	#submenu a {
		text-decoration:none;
		color:white;
		font-weight:bold;
	}
	.dropdown-menu {
		border:1px solid #F44A0C !important;
	}
	.dropdown-menu a:hover {
		background: #F44A0C !important;
		color:white !important;
	}
	.sideBtns {
		z-index:1000;
		height:120px;
		display:none;
	}
	.affix {
		top:100px;
		right:30px;
	}
</style>
<link rel="stylesheet" type="text/css" href="/st/css/semantic.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" media="(max-width:575.98px)" href="/st/css/mobile.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/st/js/semantic.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
	<% if(loginUser == null) { %>
	<div class="row top" align="right" id="beforeLogin">
		<a href="../member/loginPage.jsp">로그인</a> 
		<label>l</label> 
		<a href="../member/memberJoinPage.jsp">회원가입</a> 
		<label>l</label>
		<a href="/st/views/customerService/cs.jsp">고객센터</a> 
		<label>l</label> 
		<a href="/st/views/main/noticeList.jsp">공지사항</a>
		<label>l</label> 
		<a href="#">이용안내</a>
	</div>
	<% }else { %>
	<div class="row top" align="right" id="afterLogin">
		<label style="color:gray; font-size:0.8em;"><%= loginUser.getUserName() %>님, 환영합니다!</label>
		<i class="user outline icon"></i>
		<a href="/st/views/mypage/mypgMain.jsp">마이페이지</a> 
		<label>l</label/> 
		<a href="/st/views/product/cart.jsp">장바구니</a> 
		<label>l</label>
		<a href="/st/views/customerService/cs.jsp">고객센터</a>
		<label>l</label> 
		<a href="/st/views/main/noticeList.jsp">공지사항</a> 
		<label>l</label> 
		<button class="ui basic button" onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</button>
	</div>
	<% } %>
	<div class="row middle" align="center">
		<div class="col col-lg-3 col-md-3 col-sm-3 col-xs-4 logoArea">
			<img src="/st/images/newLogo.PNG" id="logo" style="width:100%">
		</div>
		<!-- <div class="col col-xs-4 rentBtnArea2" align="center">
			<div class="ui button rentBtn">물품등록하기</div>
		</div> -->
		<div class="ui fluid action input col col-lg-6 col-sm-6 col-xs-12 searchArea">
			<input type="text" placeholder="찾는 물건이 있으신가요?" id="searchInput">
			<div class="ui button searchBtn" style="background:#0CB6F4">
				<i class="search icon" style="font-size:15px; margin:0"></i>
			</div>
		</div>
		<div class="col col-lg-3 col-md-3 col-sm-3 rentBtnArea" align="center">
			<div class="ui massive button registerBtn" id="registerProductBtn">물품등록하기</div>
		</div>
	</div>

	<br>
	<div id="menu">
		<div class="row" id="menubarArea">
			<table id="menubar">
				<tr>
					<td><label class="category all" >CATEGORY</label></td>
					<td>
						<div class="dropdown" style="height:100%">
							<div class="category electronic dropdown-toggle" 
							data-toggle="dropdown">전자기기</div>
					
							<ul class="dropdown-menu">
								<li><a href="#">카메라</a></li>
			      				<li><a href="#">컴퓨터/주변기기</a></li>
			      				<li><a href="#">휴대폰/태블릿</a></li>
			      				<li><a href="#">게임기</a></li>
			      				<li><a href="#">영상/음향가전</a></li>
			      				<li><a href="#">생활가전</a></li>
			      				<li><a href="#">주방가전</a></li>
							</ul>
						</div>
					</td>
					<td>
						<div class="dropdown" style="height:100%">
							<div class="category hobby dropdown-toggle" 
							data-toggle="dropdown">취미레저</div>
					
							<ul class="dropdown-menu">
								<li><a href="#">캠핑/낚시</a></li>
			      				<li><a href="#">등산</a></li>
			      				<li><a href="#">자전거/킥보드</a></li>
			      				<li><a href="#">헬스</a></li>
			      				<li><a href="#">서핑/스키/보드</a></li>
			      				<li><a href="#">악기/기타</a></li>
							</ul>
						</div>
					
					</td>
					<td>
						<div class="dropdown" style="height:100%">
							<div class="category fashion dropdown-toggle" 
							data-toggle="dropdown">패션뷰티</div>
					
							<ul class="dropdown-menu">
								<li><a href="#">명품</a></li>
			      				<li><a href="#">뷰티기기</a></li>
			      				<li><a href="#">이벤트의류</a></li>
							</ul>
						</div>
					</td>
					<td>
						<div class="dropdown" style="height:100%">
							<div class="category baby dropdown-toggle" 
							data-toggle="dropdown">유아동</div>
					
							<ul class="dropdown-menu">
								<li><a href="#">실외용품</a></li>
			      				<li><a href="#">육아용품</a></li>
			      				<li><a href="#">아동서적</a></li>
			      				<li><a href="#">아동완구</a></li>
							</ul>
						</div>
					</td>
					<td>
						<div class="dropdown" style="height:100%">
							<div class="category pet dropdown-toggle" 
							data-toggle="dropdown">반려동물</div>
					
							<ul class="dropdown-menu">
								<li><a href="#">강아지</a></li>
			      				<li><a href="#">고양이</a></li>
			      				<li><a href="#">기타 반려동물</a></li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="row" id="submenuArea">
			<table id="submenu">
				<tr>
					<td><label>전체보기</label></td>
					<td>
						<ul>
							<li><a href="/st/views/main/productList.jsp">카메라</a></li>
							<li><a href="#">컴퓨터/주변기기</a></li>
							<li><a href="#">휴대폰/태블릿</a></li>
							<li><a href="#">게임기</a></li>
							<li><a href="#">영상/음향가전</a></li>
							<li><a href="#">생활가전</a></li>
							<li><a href="#">주방가전</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">캠핑/낚시</a></li>
							<li><a href="#">등산</a></li>
							<li><a href="#">자전거/킥보드</a></li>
							<li><a href="#">헬스</a></li>
							<li><a href="#">서핑/스키/보드</a></li>
							<li><a href="#">악기/기타</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">명품</a></li>
							<li><a href="#">뷰티기기</a></li>
							<li><a href="#">이벤트의류</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">실외용품</a></li>
							<li><a href="#">육아용품</a></li>
							<li><a href="#">아동서적</a></li>
							<li><a href="#">아동완구</a></li>
						</ul>
					</td>
					<td>
						<ul>
							<li><a href="#">강아지</a></li>
							<li><a href="#">고양이</a></li>
							<li><a href="#">기타 반려동물</a></li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="forPadding">
		<div class="ui vertical buttons sideBtns" data-spy="affix" data-offset-top="150" style="display:none;">
			<button class="ui positive icon button" id="sideUpBtn">
				<i class="arrow up icon"></i>
			</button>
			<button class="ui primary button" id="sideMyBtn">MY</button>
			<button class="ui negative icon button" id="sideCartBtn">
				<i class="shop icon"></i>
			</button>
		</div>
	</div>
	<!-- <hr> -->
	
	
	<script>
		$(function() {
			//$(".sideBtns").hide();
		});
		
		$(".category.all").parent().click(function() {
			$("#submenuArea").slideToggle();
		});
		$(".logoArea").click(function() {
			location.href="/st/views/main/main.jsp";
		});
		$("#registerProductBtn").click(function() {
			location.href="/st/views/product/productInsertPage.jsp"
		});
		
		
		//메뉴바 드롭다운 구성
		$(".dropdown-toggle").hover(function() {
			$(this).next().show();
			$(".dropdown-menu").hover(function() {
				$(this).show();
			}, function() {
				$(this).hide();
			});
		}, function() {
			$(".dropdown-menu").hover(function() {
				$(this).show();
			}, function() {
				$(this).hide();
			});
			$(this).next().hide();
		});
		//서브메뉴 css 설정
		$("#submenu li").mouseover(function() {
			$(this).css("background", "orange");
			$(this).children("a").css("color", "black");
		}).mouseout(function() {
			$(this).css("background", "#F44A0C");
			$(this).children("a").css("color", "white");
		});
		
		//sticky메뉴 
		var menubar = document.getElementById("menu");
		var sticky = menubar.offsetTop;
		window.onscroll = function() {
			if(window.pageYOffset >= sticky) {
				menubar.classList.add("sticky");
				$(".sideBtns").show();
			}else {
				menubar.classList.remove("sticky");
				$(".sideBtns").hide();
			}
		}
		
		//사이드 버튼 이벤트
		$("#sideUpBtn").click(function() {
			window.scrollTo(0, 0);
		});
		
		$("#sideMyBtn").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			location.href="/st/views/mypage/mypgMain.jsp";
			<% } %>
		});
		$("#sideCartBtn").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			location.href="/st/views/product/cart.jsp";
			<% } %>
		});
		
		$("#registerProductBtn").click(function() {
			<% if(loginUser == null) {%>
			location.href="<%= request.getContextPath() %>/views/member/loginPage.jsp";
			<% }else {%>
			location.href="/st/views/product/productInsertPage.jsp";
			<% } %>
		});
	</script>
</body>
</html>















