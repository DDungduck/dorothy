<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		
		<style type="text/css">
			textarea { resize: none; }
		</style>
		
		<script type="text/javascript">
			$(function(){
				/* 등록 버튼 클릭 시 글 등록 */
				$("#customOrderInsertBtn").click(function(){
					// 입력값 유효성 체크
					if(!chkData("#c_title", "제목을")) return;
					else if(!chkData("#c_content", "내용을")) return;
					else {
						if($("#file").val() != null){
							if(!chkFile("#file")) return;
						}
						
						// 작성자 아이디 할당
						$("#m_id").val("abc123");
						
						$("#customOrderWrite").attr({
							"method":"post",
							/* "enctype":"multipart/form-data", */
							"action":"/board/customOrder/customOrderInsert"
						});
						
						$("#customOrderWrite").submit();
					}
				});
				
				/* 취소 버튼 클릭 시 폼 리셋 */
				$("#customOrderCancelBtn").click(function(){
					$("#customOrderWrite").each(function(){
						this.reset();
					});
				});
				
				/* 목록 버튼 클릭 시 글 목록으로 이동*/
				$("#customOrderListBtn").click(function(){
					if(confirm("목록으로 이동하시겠습니까?")){
						location.href="/board/customOrder/customOrderList";
					}
				});
			}); // $ 함수 종료
		</script>
	</head>
	<body>
		<div class="contentContainer container">
			<div class="contentTB text-center">
				<form id="customOrderWrite" name="customOrderWrite" class="form-horizontal">
					<table class="table table-bordered">
						<colgroup>
							<col width="20%" />
							<col width="80%" />
						</colgroup>
						<tbody>
							<tr>
								<td>작성자</td>
								<td class="text-left">
									<!-- 로그인 한 사용자의 닉네임 받아오기 -->
									<input type="hidden" id="m_id" name="m_id" />
								</td>
							</tr>
							<tr>
								<td>글제목</td>
								<td class="text-left">
									<input type="text" id="c_title" name="c_title" class="form-control" />
								</td>
							</tr>
							<tr>
								<td>원하는 수령일</td>
								<td class="text-left">
									<input type="date" id="c_receiptdate" name="c_receiptdate" class="col-md-3 text-left" />
								</td>
							</tr>
							<tr>
								<td>사이즈옵션</td>
								<td class="text-left">
								<select name="사이즈옵션" id="c_size">
									<option value="미니" id="c_size0">미니</option>
									<option value="1호" id="c_size1">1호</option>
									<option value="2호" id="c_size2">2호</option>
									<option value="3호" id="c_size3">3호</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>추가구성품</td>
								<td class="text-left">
								<select name="추가구성품" id="c_etc">
									<option value="일반초" id="c_etc0">일반초</option>
									<option value="숫자초" id="c_etc1">숫자초</option>
									<option value="캐릭터초" id="c_etc2">캐릭터초</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>디저트종류</td>
								<td class="text-left">
								<select name="디저트종류" id="c_dessert">
									<option value="쿠키" id="c_dessert0">쿠키</option>
									<option value="마카롱" id="c_dessert1">마카롱</option>
									<option value="초콜릿" id="c_dessert2">초콜릿</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>주문사항</td>
								<td class="text-left">
									<textarea rows="8" id="c_content" name="c_content" class="form-control"></textarea>
								</td>
							</tr>
							<tr>
								<td>이미지파일첨부</td>
								<td class="text-left"><input type="file" id="file" name="file" /></td>
							</tr>
						</tbody>
					</table>
					<div class="text-right">
						<input type="button" value="등록" id="customOrderInsertBtn" class="btn btn-success" />
						<input type="button" value="취소" id="customOrderCancelBtn" class="btn btn-success" />
						<input type="button" value="목록" id="customOrderListBtn" class="btn btn-success" />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>