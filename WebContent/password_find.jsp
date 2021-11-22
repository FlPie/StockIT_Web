<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%! public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*9999-1000+1)) + 1000;
	return random;
	}%>
}
<html>
<head>
    <meta charset="UTF-8">
    <title>find</title>
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
        #find{ height: 600px;
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
        #search{font-family: 'Material Icons';
               font-size: 24px;
               height: 40px;
               width: 430px;
               background-color: dodgerblue;
			   border-width: 0px;
			   border-radius: 5px;}
        #send{height: 25px;} 
        #confirm{height: 25px;}
        input[type = "text"]{width: 350px;
                            height: 30px;

        }
    </style>
</head>
<body>
   <fieldset id="find">
        <legend>아이디/비밀번호 찾기</legend>
            <table>
                <tr>
                    <td colspan = "2">
                        <br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h3>이메일 입력</h3>
                    </td>
                </tr>
                <form action = "checkMail.jsp" method = "post"> <!-- todo send qualification number to email -->
                <tr>
                    <td>
                        <input type="text" name="userEmail"> <!-- input email -->
                    </td>
                    <td>
                        <input type="submit" value = "전송" id="send" name="send"> <!-- send qualification number to typed email -->
                    </td>
                </tr>
                </form>
                <tr>
                    <td colspan = "2">
                        <br><br><br><br>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h3>인증번호 입력</h3> 
                    </td>
                </tr>
                <form action = "checkNumber.jsp" method = "post">  <!-- todo confirm qualification number-->
                <tr>
                    <td>
                        <input type="text" name="confirm">
                    </td>
                    <td>
                        <input type="submit" value = "확인" id="confirm" name="confirm"> <!-- confirm qualification number -->
                    </td>
                </tr>
                </form>
                <tr>
                    <td colspan = "2">
                        <br><br><br><br><br><br><br><br><br>
                    </td>
                </tr>
                <form action = "" method = "post"> <!-- todo  move to password reset-->
                <tr>
                    <td colspan="2" align="center">
                        <input type = "submit" id = "search" value="search"> <!-- 인증되면 바로 넘어가는게? -->              
                    </td>
                </tr>
                </form>
            </table>
        </fieldset>
    </form>        
</body>
</html>