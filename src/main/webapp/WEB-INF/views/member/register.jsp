<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<script type="text/javascript">
	$(function(){
		$("#registerBtn").click(function(){
			// 입력값 유효성 체크
				if(!chkData("#m_id", "아이디를")) return;
				else if(!chkData("#m_pwd", "비밀번호를")) return;
				else if(!chkData("#m_name", "이름을")) return;
				else if(!chkData("#m_mail", "메일을")) return;
				else if(!chkData("#m_pnb", "휴대폰번호를")) return;
				else if(!chkData("#m_addr", "주소를")) return;
				else{	
					$("#register").attr({
						"method":"post",
						"action":"/member/register"
					});
					
					$("#register").submit();
				}
			});
		});
</script>
<body>
	<section id="container">
		<form id ="register" name ="register" class="form-horizonta">
		<!-- <form action="/member/register" method="post"> -->
			<div class="form-group has-feedback">
				<label class="control-label" for="m_id">아이디</label> <input
					class="form-control" type="text" id="m_id" name="m_id"/>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_pwd">비밀번호</label> <input
					class="form-control" type="password" id="m_pwd" name="m_pwd" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_name">이름</label> <input
					class="form-control" type="text" id="m_name" name="m_name" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_nick">닉네임</label> <input
					class="form-control" type="text" id="m_nick" name="m_nick" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_mail">이메일</label> <input
					class="form-control" type="text" id="m_mail" name="m_mail" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_pnb">휴대폰번호</label> <input
					class="form-control" type="text" id="m_pnb" name="m_pnb" />
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="m_addr">주소</label> <input
					class="form-control" type="text" id="m_addr" name="m_addr" />
			</div>
			<div class="form-group has-feedback">
				<input type="button" value="회원가입" id="registerBtn" class="btn btn-success" />
				<!-- <button class="btn btn-success" type="submit" id="submit">회원가입</button> -->
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>

</body>

</html>