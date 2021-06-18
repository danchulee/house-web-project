<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger">행복한 우리집</a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars ml-1"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav text-uppercase ml-auto js-scroll-trigger">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="cursor: pointer" href="/">Home</a></li>
						<c:if test="${memberinfo eq null}">
                        <li class="nav-item"><a class="nav-link signup-link whenlogout" data-toggle="modal" href="#portfolioModal1">Sign Up</a></li>
                        <li class="nav-item"><a class="nav-link login-link whenlogout" data-toggle="modal" href="#portfolioModal2">Log In</a></li>
                        <li class="nav-item"><a class="nav-link whenlogout" data-toggle="modal" href="#portfolioModal4">Find PW</a></li>
                        </c:if>
                        <c:if test="${memberinfo ne null}">
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" style="cursor: pointer" href="http://localhost:8080/list">Board</a></li>
                        <li class="nav-item"><a href="${root}/member/logout" class="nav-link whenlogin" onclick="" style="cursor: pointer;">Log Out</a></li>
                        <li class="nav-item"><a class="nav-link whenlogin" data-toggle="modal" href="#portfolioModal3">My Page</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead">
            <div class="container">
                <div class="masthead-subheading">Happy House</div>
                <div class="masthead-heading text-uppercase">행복한 우리 집!</div>
                <a class="btn btn-primary btn-xl text-uppercase js-scroll-trigger" data-toggle="modal" href="#portfolioModal1">가입하러 가요!</a>
            </div>
        </header>
        <!--  buttons -->
		 <div class="dark-bg section">
     	<div class="container-fluid">
          <!-- filters start -->
   		  <div class="sorting-filters text-center mb-20 d-flex justify-content-center">
  		   <form class="form-inline mt-5" id="areaform" method="post" action="">
<!--  			  <input type="hidden" id="code"  name="code" value="code"/>
 -->                 <div class="form-group md mr-3">
                <select class="form-control" name="city" id="sido">
                	 <option value="all" >도/광역시</option>
                </select>
              </div>
              <div class="form-group md-1 mr-3">
                <select class="form-control" name="dongcode" id="gugun">
                  	<option value="all">시/구/군</option>
                </select>
              </div>
              <div class="form-group md-2 mr-3">
                <select class="form-control" name="dongscode" id="dong">
                  	<option value="all" >동네</option>
                </select>
              </div>
<!--               <button type="submit" class="btn-success btn btn-animated" id="allsearch">
			전체검색 <i class="fa fa-check"></i></button> -->
            </form>
            </div>
           <div class="sorting-filters text-center mb-20 d-flex justify-content-center">
            <form class="form-inline mt-5" id="aptsearchform" method="post" action="">
            	<input type="text" id="searchaptname" placeholder="아파트명 검색">
			  <button type="submit" class="btn-success btn btn-animated ml-4" id="aptsearch">
			아파트 검색 <i class="fa fa-check"></i></button>
			</form>
          </div>
          <!-- filters end -->
          
        </div>
      </div> 


</body>
</html>