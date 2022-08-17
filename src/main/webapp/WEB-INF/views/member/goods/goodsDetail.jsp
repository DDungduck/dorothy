<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
	<style type="text/css">
		.goodsImgContainer {width: 600px; height: 600px; padding-right : 50px; float: left; position : relative;}
		.goodsImgBig{width: 450px; height: 450px; margin-left : 50px; margin-top: 30px;}
		.goodsDetail{width: 500px; display : inline-block; margin-top : 15px; float : right; position: relative;}
		.goodsDetail h4{margin-top: 30px;}
		#goodsInfo{border-collapse : separate; border-spacing : 10px 10px; border-bottom : 1px solid gray;}
		#goodsInfo tr{height : 30px;}
		#buttonArea input[type=button]{border-radius: 15px; width: 180px; height: 50px; margin : 10px 20px;}
		#goodsInfo input[type=button] {border-radius: 15px; }
		input[type=date]{height : 20px; width : 120px; }
		#size{height : 20px; width : 120px; }
		input[type=number] { height : 20px; width : 120px; text-align : right;}
	</style>
		<title>상품 상세페이지</title>
		<script type="text/javascript">
			$(function(){
				$("#addCartBtn").click(function(){
					if(${member != null}) {
						addFrmInfo();
						
						$("#frmCart").attr({"method" : "post", "action" : "/member/cart/goCart"});
	 					$("#frmCart").submit();
	 					
					} else{
						alert("로그인 하신 후 이용할 수 있습니다.");
					}
 				});
				
				$("#buyBtn").click(function(){
					if(${member != null}) {
						addFrmInfo();
						
						$("#frmCart").attr({"method" : "post", "action" : "/member/cart/goPayment"});
	 					$("#frmCart").submit();
	 					
					} else{
						alert("로그인 하신 후 이용할 수 있습니다.");
					}
				});
			});
			
			function addFrmInfo(){
				let gc_amount = $("#amount").val();
				$("input[name='gc_amount']").val(gc_amount);
				m_id = "${member.m_id}";
				$("input[name='m_id']").val(m_id);
				let g_size = $("#size").val();
				$("input[name='g_size']").val(g_size);
			}
		</script>
	</head>
	<body>
		<div class="contentContainer container">
		<div class="goodsImgInfo">
			<div class="goodsImgContainer">
				<img class="goodsImgBig" src="/dorothyUpload/goods/${detail.g_file }" />
			</div>
			<div class="goodsDetail">
				<div id="goodsFormData">
					<form id="frmCart" name="frmCart">
						<input type="hidden" name="g_code" value="${detail.g_code }" />
						<input type="hidden" name="gc_amount" value="" />
						<input type="hidden" name="g_price" value="${detail.g_price }" />
						<input type="hidden" name="m_id" value="" />
						<input type="hidden" name="g_name" value="${detail.g_name }" />
						<input type="hidden" name="g_file" value="${detail.g_file }" />
						<input type="hidden" name="g_size" value="" />
					</form>
				</div>
				<h4 class="text-left">${detail.g_name }</h4>
				<p class="text-left">${detail.g_price }원</p>
				<form id="order">
					<table id="goodsInfo">
<!-- 						<tr>
							<th class="text-center">배송받는 곳</th>
							<td>
								<input type="text" id="address" placeholder="주소를 입력하세요" />
							</td>
						</tr> -->
						<tr>
							<th class="text-center">수령일</th>
							<td>
								<input type="date" id="date"/>
							</td>
						</tr>
<!-- 						<tr>
							<th class="text-center">수령시간대</th>
							<td>
								<button type="button" class="time">14시-19시</button>
								<button type="button" class="time">19시-22시</button><br />
							</td>
						</tr>
						<tr>
							<th>
							</th>
							<td>
								<span>*토요일은 선택하신 시간대와 관계없이 14시-20시에만 배송됩니다.</span>
							</td>
						</tr> -->
						<tr>
							<th class="text-center">호수</th>
							<td>
								<select id="size">
									<option value="" selected="selected">= 옵션 : 가격 =</option>
									<option value="1">미니</option>
									<option value="2">1호</option>
								</select>
							</td>
						</tr>
						<tr>
							<th class="text-center">수량</th>
							<td>
								<input type="number" id="amount" value="1" min="1"/>
							</td>
						</tr>
					</table>
				</form>
				<div id="goodsCheck" hidden="hidden">		
				</div>
				<div id="buttonArea">
					<div>	
						<input id="addCartBtn" type="button" value="ADD TO CART" />
						<input id="buyBtn" type="button" value="BUY NOW" />
					</div>
				</div>
			</div>
		</div>
		</div>
	</body>
</html>