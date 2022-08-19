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
					else if(!chkData("#file", "파일을")) return;
					else if(!chkFile($("#file"))) return;
					else {
						
						
						// 작성자 아이디 할당
						$("#m_id").val("abc123");
						
						$("#customOrderWrite").attr({
							"method":"post",
							"enctype":"multipart/form-data", 
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
								<td class="text-left">${member.m_name}
									<%-- <input type="text" id="m_id" name="m_id" value="${member.m_name}" readonly="readonly"/> --%>
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
								<td>수량</td>
								<td class="text-left">
									<input type="number" id="c_amount" name="c_amount" class="col-md-3 text-left" min="1" value="1"/>
								</td>
							</tr>
							<tr>
								<td>사이즈옵션</td>
								<td class="text-left">
								<select id="c_size" name="c_size">
									<option value="미니">미니</option>
									<option value="1호" >1호</option>
									<option value="2호" >2호</option>
									<option value="3호" >3호</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>추가구성품</td>
								<td class="text-left">
								<select id="c_etc" name="c_etc">
									<option value="일반초" >일반초</option>
									<option value="숫자초" >숫자초</option>
									<option value="캐릭터초" >캐릭터초</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>디저트종류</td>
								<td class="text-left">
								<select id="c_dessert" name="c_dessert">
									<option value="쿠키">쿠키</option>
									<option value="마카롱">마카롱</option>
									<option value="초콜릿">초콜릿</option>
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