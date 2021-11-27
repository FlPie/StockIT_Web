<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>register</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            @font-face {
                font-family: 'Material Icons';
                font-style: normal;
                font-weight: 400;
                src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
                src: local('Material Icons'), local('MaterialIcons-Regular'),
                    url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
                    url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
                    url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');}

            .material-icons {font-family: 'Material Icons';
                            font-weight: normal;
                            font-style: normal;
                            font-size: 24px;  /* Preferred icon size */
                            display: inline-block;
                            line-height: 1;
                            text-transform: none;
                            letter-spacing: normal;
                            word-wrap: normal;
                            white-space: nowrap;
                            direction: ltr;
                            /* Support for all WebKit browsers. */
                            -webkit-font-smoothing: antialiased;
                            /* Support for Safari and Chrome. */
                            text-rendering: optimizeLegibility;
                            /* Support for Firefox. */
                            -moz-osx-font-smoothing: grayscale;
                            /* Support for IE. */
                            font-feature-settings: 'liga';
                            }
            #register{ height: 600px;
                        width: 500px;
                        margin-left: auto;
                        margin-right: auto;
                        margin-top: 200px;
                    }
            legend{text-align: center;
                font-size: 20px;
                    }
            table{margin-left: auto;
                    margin-right: auto;
                    width: 400px;
                }
            #id{width: 185px;} 
            input[type = "submit"]{font-family: 'Material Icons';
                                    font-size: 24px;
                                    height: 40px;
                                    width: 430px;
                                    background-color: dodgerblue;
                                    border-width: 0px;
                                    border-radius: 5px;}
            #email_input{width: 105px;}
            input{height: 30px;
                width: 420px;}
            select{height: 30px;}                     
        </style>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
        	$('#submit').click(function()
        		{
        		 $("#email_input").attr("disabled",false);
        		});
            $('#selectEmail').change(function(){ 
            $("#selectEmail option:selected").each(function(){ 
		        if($(this).val() != '1')
		            {
		                $("#email_input").attr("value", $(this).val());
		                $("#email_input").attr("disabled",true);
		            }
		            else
		            { 
		                $("#email_input").val('');
		                $("#email_input").attr("disabled",false);
		            } 
		        }); 
        	});
        });
        </script>
    </head>
    <body>
        <form action = "registerAction.jsp" method = "post"> <!--todo send id & password data and save this -->
            <fieldset id="register">
                <legend>회원가입</legend>
                <table>
                    <tr>
                        <td colspan = "2">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>이메일/아이디</h3>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="text" name="userID" id="id" placeholder="example"></td>
                        <td>
                            <input type="text" name = "userEmail" id = "email_input" placeholder="@abcd.com"> <!-- input email -->
                            <select name="selectEmail" id="selectEmail"> <!-- select email -->
                                <option value="1">직접입력</option>
                                <option value="@gmail.com">@gmail.com</option>
                                <option value="@naver.com">@naver.com</option>
                                <option value="@hanmail.net">@hanmail.net</option>
                                <option value="@nate.com">@nate.com</option>
                                <option value="@kakao.com">@kakao.com</option>
                                <option value="@yahoo.com">@yahoo.com</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan = "2">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>비밀번호</h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="password" name="userPassword" placeholder="****"> <!-- input password -->
                        </td>
                    </tr>
                    <tr>
                        <td colspan = "2">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>비밀번호 확인</h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="password" name="password_check" placeholder="****"> <!-- confirm password -->
                        </td>
                    </tr>
                    <tr>
                        <td colspan = "2">
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <h3>닉네임</h3>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type="text" name="userName" placeholder="nickname"></td> <!-- input nickname -->
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                        <br><br><br>
                            <input id = "submit" type = "submit" value="check">                      
                        </td>
                    </tr>
                </table>
            </fieldset>
        </form>    
    </body>
</html>