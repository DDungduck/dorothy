<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	 
	<script type="text/javascript">
		$(function(){
			
			/* 삭제 버튼 클릭 시 삭제 */
			$("#customOrderDeleteBtn").click(function(){
				if(confirm("정말 삭제하시겠습니까?")){
					$.ajax({
						url: "/board/customOrder/customOrderDelete",
						type: "post",
						data: $("#c_data").serialize(),
						dataType: "text",
						error: function(){
							alert("문제가 발생했습니다. 잠시 후에 다시 시도해 주세요.");
						},
						success: function(resultData){
							console.log(resultData);	
							alert("등록한 게시글이 삭제되었습니다.");
							location.href="/board/customOrder/customOrderList";	
						}
					});
				}
			});
			
			/* 목록 버튼 클릭 시 목록으로 돌아가기 */
			$("#customOrderListBtn").click(function(){
				location.href="/board/customOrder/customOrderList";
			});
			
			/* 가격 등록 버튼 클릭 시 사용자 상세보기 페이지에 보여주기 */
			$("#customOrderupdateFormBtn").click(function(){
				$("#priceForm").attr({
					"method":"post",
					"action":"/admin/board/customOrder/customOrderPriceupdate"
				});
				$("#priceForm").submit();
			});
			
		}); // $ 함수 종료
	</script>
	</head>
	<body>
		<div class="contentContainer container">
			<form name="c_data" id="c_data">
				<input type="hidden" id="c_num" name="c_num" value="${customOrderDetail.c_num}" />
				<%-- <input type="hidden" id="c_file" name="f_file" value="${bfDetail.f_file}" />
				<input type="hidden" id="c_replycnt" name="f_replycnt" value="${bfDetail.f_replycnt}" /> --%>
			</form>
		</div>

		<%-- 글 수정 삭제 목록 버튼 보여주기 시작 --%>
		<div class="btnArea text-right" style="margin-bottom: 5px">
			<input type="button" value="삭제" id="customOrderDeleteBtn" class="btn btn-success" />
			<input type="button" value="목록" id="customOrderListBtn" class="btn btn-success" />
		</div>
		<%-- 글 수정 삭제 목록 버튼 보여주기 끝 --%>
	
		<%-- 글 상세 정보 보여주기 시작 --%>
		<div class="contentTB text-center">
			<table class="table table-bordered">
				<tbody>
					<tr>
						<td class="col-md-3">작성자</td>
						<td class="col-md-3 text-left">${customOrderDetail.m_id}</td>
					</tr>
					<tr>
						<td class="col-md-4">제목</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_title}</td>
					</tr>
					<tr>
						<td class="col-md-4">원하는 수령일</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_receiptdate}</td>
					</tr>
					<tr>
						<td class="col-md-4">수량</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_amount}</td>
					</tr>
					<tr>
						<td class="col-md-4">사이즈옵션</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_size}</td>
					</tr>
					<tr>
						<td class="col-md-4">추가구성품</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_etc}</td>
					</tr>
					<tr>
						<td class="col-md-4">디저트종류</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_dessert}</td>
					</tr>
					<tr class="table-tr-height">
						<td class="col-md-4">주문사항</td>
						<td colspan="3" class="col-md-8 text-left">${customOrderDetail.c_content}</td>
					</tr>
					<tr class="table-tr-height">
						<td class="col-md-4">첨부파일</td>
						<td colspan="3" class="col-md-8 text-left">
							<c:if test="${not empty customOrderDetail.c_file}">
								<img src="/dorothyUpload/customOrder/${customOrderDetail.c_file}" />
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="col-md-4">가격</td>
						<td colspan="3" class="col-md-8 text-left">
						<div class="col-sm-5">
						<form id="priceForm">
							<input type="hidden" id="c_num" name="c_num" value="${customOrderDetail.c_num}" />
							<input class="form-control" type="text" id="c_price" name="c_price" value="${customOrderDetail.c_price}">
							<input type="button" value="등록" id="customOrderupdateFormBtn" class="btn btn-success" />
						</form>
						</div>
						
						
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<%-- 글 상세 정보 보여주기 종료 --%>
		<jsp:include page="reply.jsp"></jsp:include> 
</body>
</html>