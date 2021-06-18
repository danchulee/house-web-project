<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"/>
<c:set var="originalID" value="${memberinfo.userid}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer class="footer py-4">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-4 text-lg-left">Copyright © Your Website 2020</div>
                    <div class="col-lg-4 my-3 my-lg-0">
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                        <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                    <div class="col-lg-4 text-lg-right">
                        <a class="mr-3" href="#!">Privacy Policy</a>
                        <a href="#!">Terms of Use</a>
                    </div>
                </div>
            </div>
        </footer>
        
        <!-- Portfolio Modals-->

    <!-- Modal 1-->
    <div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="close-modal" data-dismiss="modal"><img src="../resources/img/1-icon.svg" alt="Close modal" /></div>
                <div class="container">
                <div class="row justify-content-center">
                    <div class="col-auto">
                        <!-- main start -->
                        <!-- ================ -->
                        <div class="main hc-element-invisible"
                            data-animation-effect="fadeInUpSmall" data-effect-delay="100">
                            <div class="form-block p-30 light-gray-bg border-clear">
                                <h5 class="title">회원 가입</h5>
                                <form class="form-horizontal" id="registerform" method="post">
                                <input type="hidden" name="act" id="act" value="register">
                                    <div class="form-group has-feedback row ml-md-auto">
                                        <label for="inputName"
                                            class="col-md-4 control-label text-md-left col-form-label" name="userId">아이디
                                            <span class="text-danger small">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="inputName"
                                                placeholder="" required name="userId"> 
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback row ml-md-auto">
                                        <label for="inputLastName"
                                            class="col-md-4 control-label text-md-left col-form-label" name="userPwd">비밀번호
                                            <span class="text-danger small">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="inputLastName"
                                                placeholder="영문 숫자 포함 6자리 이상" required name="userPwd">
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback row ml-md-auto">
                                        <label for="inputUserName"
                                            class="col-md-4 control-label text-md-left col-form-label" name="userName">이름
                                            <span class="text-danger small">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="inputUserName"
                                                placeholder="User Name" required name="userName"> 
                                        </div>
                                    </div>
                                    
                                    <div class="form-group has-feedback row ml-md-auto">
                                        <label for="inputPassword"
                                            class="col-md-4 control-label text-md-left col-form-label" name="email">E-mail
                                            <span class="text-danger small">*</span>
                                        </label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="inputEmail"
                                                placeholder="xxx@xxx.xxx" required name="email">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group row mt-4 text-md-left" style="float: left">
                                        <div class ="ml-4">
                                            <button type="button" class="btn btn-warning btn-animated" data-dismiss="modal" id="joinupdate" onclick="javascript:register();">
                                                등록 <i class="fa fa-check"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- main end -->
                    </div>
                </div>
            </div>
            </div>
        </div>
    </div>
    <!-- Modal 2-->
    <div class="portfolio-modal modal-dialog-centered modal-lg modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true" >
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                    <form id="loginform" method="post" action="">
                    <input type="hidden" name="act" id="act" value="login">
                        <div class="modal-body">
                            <!-- Project Details Go Here-->
                              <!-- Modal Header -->
                                  <div class="modal-header">
                                    <h4 class="modal-title">LogIn</h4>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                  </div>
                            
                                  <!-- Modal body -->
                                      <div class="modal-body">
                                       <div class="form-group">
                                    <label for="inputId" style="float: left">ID :</label>
                                    <input type="text" class="form-control" placeholder="Enter ID" id="userid" name="userid">
                                  </div>
                                  <div class="form-group">
                                    <label for="password" style="float: left">Password:</label>
                                    <input type="password" class="form-control" placeholder="Enter password" id="userpwd" name="userpwd">
                                  </div>
                                     </div>
                            
                            
                                  <!-- Modal footer -->
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    <button type="button" id="loginclick" class="btn btn-primary" data-dismiss="modal" onclick="javascript:login();">LogIn</button>
                                  </div>
                        </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    
    
    <div class="portfolio-modal modal fade modal-lg" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal"><img src="../resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-auto">
                        <!-- 메 -->
                            <div class="main hc-element-invisible"
                                data-animation-effect="fadeInUpSmall" data-effect-delay="100">
                                <div class="form-block p-30 light-gray-bg border-clear">
                                    <h5 class="title">마이 페이지</h5>
                                    <form class="form-horizontal" method="post" id="modifyform" act="">
                                        <input type="hidden" name="act" id="act" value="modify">
                                        <input type="hidden" name="originalID" id="originalID" value="${originalID}">
                                        <div class="form-group has-feedback row ml-md-auto">
                                            <label for="inputLastName"
                                                class="col-md-4 control-label text-md-left col-form-label">비밀번호
                                                <span class="text-danger small">*</span>
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="newPwd"
                                                    placeholder="" required name="newPwd">
                                            </div>
                                        </div>
                                        <div class="form-group has-feedback row ml-md-auto">
                                            <label for="inputUserName"
                                                class="col-md-4 control-label text-md-left col-form-label">이름
                                                <span class="text-danger small">*</span>
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="newName"
                                                    placeholder="User Name" required name="newName"> 
                                            </div>
                                        </div>
                                        
                                        <div class="form-group has-feedback row ml-md-auto">
                                            <label for="inputPassword"
                                                class="col-md-4 control-label text-md-left col-form-label">E-mail
                                                <span class="text-danger small">*</span>
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="newEmail"
                                                    placeholder="xxx@xxx.xxx" required name="newEmail">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <button type="button" class="btn btn-success mt-4" id="editinfo" data-dismiss="modal" onclick="javascript:modify();">정보수정</button>
                            <button type="button" class="btn btn-danger mt-4" id="expireinfo" data-dismiss="modal">탈퇴하기</button>
                            
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
        
    	<!-- Modal 4-->
        <div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="close-modal" data-dismiss="modal"><img src="../resources/img/close-icon.svg" alt="Close modal" /></div>
                    <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-auto">
                            <!-- main start -->
                            <!-- ================ -->
                            
                            <div class="main hc-element-invisible"
                                data-animation-effect="fadeInUpSmall" data-effect-delay="100">
                                <div class="form-block p-30 light-gray-bg border-clear">
                                    <h5 class="title">비밀번호 찾기</h5>
                                    <form class="form-horizontal" method="post" action="/member/find" id="findform">
                                        <div class="form-group has-feedback row ml-md-auto">
                                            <label for="inputName"
                                                class="col-md-4 control-label text-md-left col-form-label">아이디
                                                <span class="text-danger small">*</span>
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="findid"
                                                    placeholder="" required name="id"> 
                                            </div>
                                        </div>
                                        
                                        
                                         
                                        <div class="form-group has-feedback row ml-md-auto">
                                            <label for="inputUserName"
                                                class="col-md-4 control-label text-md-left col-form-label">이름
                                                <span class="text-danger small">*</span>
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="findname"
                                                    placeholder="User Name" required name="name"> 
                                            </div>
                                        </div>
                                         
                                         
                                        <div class="form-group has-feedback row ml-md-auto">
                                            <label for="inputPassword"
                                                class="col-md-4 control-label text-md-left col-form-label">E-mail
                                                <span class="text-danger small">*</span>
                                            </label>
                                            <div class="col-md-9">
                                                <input type="text" class="form-control" id="findemail"
                                                    placeholder="xxx@xxx.xxx" required name="tel">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row mt-4 text-md-left" style="float: left">
                                            <div class ="ml-4">
                                                <button type="button" href="javascript:findpw();" class="btn btn-warning btn-animated" id="findpassword">
                                                    비밀번호 찾기  
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- main end -->
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
</body>
</html>