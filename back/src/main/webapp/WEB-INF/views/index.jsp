<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>HappyHouse - 행복한 우리 집</title>
        <link rel="icon" type="image/x-icon" href="resources/img/favicon.ico" />
        
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	        
	    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC04TVDwcIcyIbt3-OdH_vP8_8KSgFDOt0&callback=initMap&region=kr"></script>      
	       
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        <script type="text/javascript">
            function register(){
                document.getElementById("registerform").action = "${root}/member/register";
                document.getElementById("registerform").submit();
            }
            function login(){
                if(document.getElementById("userid").value == "") {
                    alert("아이디 입력!!!");
                    return;
                } else if(document.getElementById("userpwd").value == "") {
                    alert("비밀번호 입력!!!");
                    return;
                } else {
                	$("#loginform").attr("action", "${root}/member/login").submit();
                }
            }
            function modify(){
            	document.getElementById("modifyform").action = "${root}/member/modify";
                document.getElementById("modifyform").submit();
            }
        </script>
        
    </head>
    <body id="page-top">
        <!-- Navigation-->
    	<%@ include file="include/pagetop.jsp" %>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
                <div class="text-center">
                    <h2 class="section-heading text-uppercase">동을 선택해주세요.</h2>
                    <h3 class="section-subheading text-muted">아파트와 연립다세대의 정보가 검색되어 노출됩니다.</h3>
                </div>    
                <div class="row text-center">
                    <div class="col-md-4">
                        <img src="resources/img/frontlogo/goodhouse.png" width="350"/>
                        <h4 class="my-3">최근에 올라온 매물</h4>
                        <p class="text-muted"> 가장 최신에 올라온 매물입니다.</p>
                    </div>
                    <div class="col-md-4">
                    <img src="resources/img/frontlogo/gaseongbi.jpg" width="350"/>
                         
                        <h4 class="my-3">가성비 좋은 매물</h4>
                        <p class="text-muted"> 역세권, 학군 다 갖춘 최고의 아파트</p>
                    </div>
                    <div class="col-md-4">
                    <img src="resources/img/frontlogo/ground.jpg" width="400"/>
                         
                        <h4 class="my-3">화제의 토지</h4>
                        <p class="text-muted">싸고 좋은 토지 매물 </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- 포트폴리오 지운 부분 -->
        
        <!-- Footer-->
        <%@ include file="include/pagebottom.jsp" %>
        
    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Contact form JS-->
    <!-- <script src="/mail/jqBootstrapValidation.js"></script>
    <script src="/mail/contact_me.js"></script> -->
    <!-- Core theme JS-->
<!--     <script src="js/login.js"></script>
 -->    
 	<script src="resources/js/scripts.js"></script>
    <script src="resources/js/main.js"></script>
</body>