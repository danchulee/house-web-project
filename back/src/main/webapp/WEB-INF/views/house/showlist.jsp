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
        <link href="../resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <%@ include file="../include/pagetop.jsp" %>
        <!-- Services-->
        <section class="page-section" id="services">
            <div class="container">
               <c:if test="${searchList.size() != 0}">
               		<h2>${searchList.size()} 건이 검색되었습니다. </h2><br>
               		<table class="table table-striped">
	               		<thead>
							<tr>
								<th>아파트명</th>
								<th>전용면적</th>
								<th>건축년도</th>
								<th>거래년도</th>
								<th>거래 월</th>
								<th>거래 일</th>
								<th>지   번</th>
								<th>층   수</th>
								<th>매매가격</th>
							</tr>
						</thead>
				  		<c:forEach var="searchinfo" items="${searchList}">
					    <tbody>
							<tr>
								<td>${searchinfo.aptName}</td>
								<td>${searchinfo.area}</td>
								<td>${searchinfo.buildYear}</td>
								<td>${searchinfo.dealYear}</td>
								<td>${searchinfo.dealMonth}</td>
								<td>${searchinfo.dealDay}</td>
								<td>${searchinfo.jibun}</td>
								<td>${searchinfo.floor}</td>
								<td>${searchinfo.dealAmount}</td>
							</tr>
				  		</c:forEach>
				  		</tbody>
				  </table>
			</c:if>
		    <c:if test="${searchList.size() == 0}">
				<h2>검색된 건이 존재하지 않습니다.</h2>
			</c:if>
            </div>
        </section>

        <!-- 포트폴리오 지운 부분 -->
        
        <!-- Footer-->
        <%@ include file="../include/pagebottom.jsp" %>


    	
    
    
    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Contact form JS-->
    <!-- <script src="assets/mail/jqBootstrapValidation.js"></script>
    <script src="assets/mail/contact_me.js"></script> -->
    <!-- Core theme JS-->
<!--     <script src="js/login.js"></script>
 -->    
 	<script src="../resources/js/scripts.js"></script>
    <script src="../resources/js/main.js"></script>
</body>