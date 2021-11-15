<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "user.UserDAO" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>

<html>
    <head>
        <title>mypage</title>
        <meta charset="UTF-8">
        <style>
        #profile{margin-left: auto;
                margin-right: auto;
                width: 97%;
                height: 37%;
                position: relative;
            }
        #profile_image{margin-left: auto;
                margin-right: auto;
                width: 97%;
                height: 35%;
                position: relative;
            }
        h3{position: absolute;
            top: 10%;
            left: 2.3%;
        }
        #information{ position: relative;
                      left: 10%;

        }
        #profile_table{width: 70%;
                      height: 350px;}
        #image_table{width: 70%;
                    height: 100px;}
        #nickname_text{width: 300px;
                        height: 30px;}
        #nickname_change{ width: 50px;
                          height: 25px;}
        #delete_image{width: 75px;
                      border-width: 0px;}
        #apply{width: 75px;
               background-color: dodgerblue;
               border-width: 0px;}
        input[type = "file"]{ width: 300px;
                            height: 25px;}
        .btn{position: absolute;
            right: 1.5%;
        }
        .img-thumbnail{width: 150px;
                      height: 150px;
        }
        </style>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function() {
                var domEleArray = [$('#formFileSm').clone()];
                $('#delete_image').click(function() {
                    domEleArray[1] = domEleArray[0].clone(true);
                    $('#formFileSm').replaceWith(domEleArray[1]);
                    $('#image').attr("src", "https://via.placeholder.com/150");
                });
                $(".btn btn-primary").click(function(){
                	String id = (String)session.getAttribute("id");
    				UserDAO user = new UserDAO();
    				user.quit(id);
    				session.invalidate();
    				response.sendRedirect("/login.jsp");
                	
                });
            });

            function setThumbnail(event) {
                var reader = new FileReader(); 
                reader.onload = function(event) {
                    var tempImage = new Image();
                    tempImage.src = reader.result;
                    tempImage.onload = function(){
                    var canvas = document.createElement("canvas");
                    var canvasContext = canvas.getContext("2d");

                    canvas.width = "150";
                    canvas.height = "150";
                    canvasContext.drawImage(this, 0, 0, 150, 150);
                    var dataURI = canvas.toDataURL("image/jpeg");
                    $("#image").attr("src", dataURI);
                    };
                }; 
                reader.readAsDataURL(event.target.files[0]); 
            }
        </script>
 
    </head>
    <body>
        <jsp:include page = "/header.jsp"/>
        <form action = "changeNameAction.jsp" method = "post"> <!-- todo change nickname-->
            <div id = "profile" class="border">
                <table id="profile_table">
                    <tr>
                        <td height = "80" valign = "bottom">
                            <h3>프로필</h3>
                        </td>
                    </tr>
                    <tr>
                        <td width = "30%" height = "100">
                            <div id="information">이메일/아이디</div>
                        </td>
                        <td>
                        	<%
                        		UserDAO user = new UserDAO();
                        		String id = (String)session.getAttribute("id");
	                        	ResultSet rs = user.save(id);
	                        	if(rs.next())
	  								out.print(id + rs.getString(4));
                        	%>
                           		<!-- todo: 이메일 정보 불러오기-->
                        </td>
                    </tr>
                    <tr>
                        <td height = "35">
                            <div id="information">닉네임</div>
                        </td>
                        <td>
                                <input type = "text" name = "nickname_text" id="nickname_text">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type = "submit" value="변경" id="nickname_change">                       
                        </td>
                    </tr>
                    <tr>
                        <td height = "130">
                           <div id="information"><a href="password_reset"><small>비밀번호를 변경하고 싶다면 여기를 클릭하세요.</small></a></div>
                        </td>                        
                    </tr>
                </table>
            </div>
        </form>
        <form name = "form_image" action = "" method = "post"> <!-- todo change profile image-->
            <div id = "profile_image" class="border">
                <table id = "image_table">
                    <tr>
                        <td valign = "baseline" width ="40%">
                            <br><br>
                            <h3>프로필 사진</h3>
                        </td>
                        <td valign = "baseline">
                            <br><br>
                            <img id = "image" src="https://via.placeholder.com/150" class="img-thumbnail" alt="...">
                            <br>
                            <input type="button" value="삭제" id = "delete_image"><input type="submit" value="적용" id="apply">
                            <br><br>
                            <div class="mb-3">
                                <input class="form-control form-control-sm" id="formFileSm" type="file" onchange="setThumbnail(event)" accept="image/*">
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
        <button type="button" class="btn btn-primary">탈퇴하기</button>
    </body>
</html>