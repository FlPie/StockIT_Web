<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
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
			#login{ height: 350px;
					width: 400px;
					margin-left: auto;
					margin-right: auto;
					margin-top: 200px;
				}
			legend{text-align: center;
				   font-size: 20px;
				  }
			table{margin-left: auto;
				  margin-right: auto;
				  }
			input{height: 30px;}
			input[type = "submit"]{font-family: 'Material Icons';
				  					font-size: 17px;
									width: 235px;
									height: 40px;
									background-color: dodgerblue;
									border-width: 0px;
									border-radius: 5px;}
			a{font-size: 5px;}
			#account_circle{font-size: 36px;
							vertical-align: middle;
							}
			#password{font-size: 36px;
					  vertical-align: middle;
					 }
			#find{font-size: 15px;
				  vertical-align: middle;}
			#register{font-size: 15px;
					  vertical-align: middle;}

		</style>
	</head>
	<body>
		<form action="login.jsp" method="post">
			<fieldset id = "login">
				<legend>로그인</legend>
					<table>
						<tr>
							<td colspan = "2">
								<br><br><br>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="material-icons" id="account_circle">account_circle</span>
								&nbsp;&nbsp;							
								<input type="text" name = "id" placeholder="Username"> <!-- input id/email -->
							</td>
						</tr>
						<tr>
							<td colspan = "2">
								<br>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<span class="material-icons" id="password">password</span>
								&nbsp;&nbsp;
								<input type="password" name = "password" placeholder="****"> <!-- input password -->
							</td>
						</tr>
						<tr>
							<td colspan = "2">
								<br>
							</td>
						</tr>
						<tr>
							<td colspan = "2" align="center">
								<input type = "submit" value="login"></input> <!-- login button -->
							</td>
						</tr>
						<tr>
							<td colspan = "2">
								<br>
							</td>
						</tr>
						<tr>
							<td><span class="material-icons" id = "find">lock</span><a href="password_find.jsp">아이디/비밀번호 찾기</a></td> <!-- find password -->
							<td align="right"><span class="material-icons" id="register">person_add</span><a href="register.jsp">회원가입</a></td> <!-- registration -->
						</tr>				
					</table>
			</fieldset>
		</form>
	</body>
</html>