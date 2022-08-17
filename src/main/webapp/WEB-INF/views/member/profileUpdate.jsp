<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			});
		
			$("#submit").on("click", function(){
				if($("#m_pwd").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#m_pwd").focus();
					return false;
				}
				if($("#m_name").val()==""){
					alert("성명을 입력해주세요.");
					$("#m_name").focus();
					return false;
				}
			});					
		});
	</script>
	<body>
		<section id="container">
			<form action="/member/memberUpdate" method="post">
				<div class="form-group has-feedback">
					<label class="control-label" for="m_id">아이디</label>
					<input class="form-control" type="text" id="m_id" name="m_id" value="${member.m_id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="m_pwd">패스워드</label>
					<input class="form-control" type="text" id="m_pwd" name="m_pwd" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="m_name">이름</label>
					<input class="form-control" type="text" id="m_name" name="m_name" value="${member.m_name}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="m_nick">닉네임</label>
					<input class="form-control" type="text" id="m_nick" name="m_nick" value="${member.m_nick}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="m_mail">이메일</label>
					<input class="form-control" type="text" id="m_mail" name="m_mail" value="${member.m_mail}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="m_pnb">휴대폰번호</label>
					<input class="form-control" type="text" id="m_pnb" name="m_pnb" value="${member.m_pnb}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="m_addr">주소</label>
					<input class="form-control" type="text" id="m_addr" name="m_addr" value="${member.m_addr}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>