<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--옵션변경--%>

<form name="frmOrdrChg" id="frmOrdrChg" method="post" enctype="multipart/form-data">
<div class="modal fade" id="countModal" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<p class="text-title">옵션/수량 변경</p>
			</div>
			<div class="modal-close">
				<button data-bs-dismiss="modal">모달 닫기</button>
			</div>
			<div class="modal-body">
				<div class="order-quantity-layer">
					<div class="order-thumb">
						<c:if test="${not empty cartList[0].gdsInfo.thumbnailFile.fileNo}">
							<img src="/comm/getImage?srvcId=GDS&amp;upNo=${cartList[0].gdsInfo.thumbnailFile.upNo}&amp;fileTy=${cartList[0].gdsInfo.thumbnailFile.fileTy }&amp;fileNo=${cartList[0].gdsInfo.thumbnailFile.fileNo}&amp;thumbYn=Y" alt="썸네일 이미지" class="w-50" />
						</c:if>
						<c:if test="${empty cartList[0].gdsInfo.thumbnailFile.fileNo}">
							<img src="/html/page/market/assets/images/noimg.jpg" alt="">
						</c:if>
					</div>
					<div class="order-content">
						<dl class="code">
							<dt>${gdsTyCode[cartList[0].cartTy]}</dt>
							<dd>${cartList[0].gdsCd}</dd>
						</dl>
						<p class="name">${cartList[0].gdsNm}</p>
						<p class="price">
							판매가 : <strong><fmt:formatNumber value="${cartList[0].gdsInfo.pc}" pattern="###,###" /></strong> 원
							<c:if test="${cartList[0].cartTy eq 'R' }">
								<%-- 베네핏 바이어의 %로 노출 --%>
								<br>급여가 :
                               	<c:choose>
									<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 15 }">
										<strong><fmt:formatNumber value="${cartList[0].gdsInfo.bnefPc15}" pattern="###,###" /></strong>
									</c:when>
									<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 9 }">
										<strong><fmt:formatNumber value="${cartList[0].gdsInfo.bnefPc9}" pattern="###,###" /></strong>
									</c:when>
									<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 6 }">
										<strong><fmt:formatNumber value="${cartList[0].gdsInfo.bnefPc6}" pattern="###,###" /></strong>
									</c:when>
									<c:when test="${_mbrSession.prtcrRecipterInfo.selfBndRt == 0 }">
										<strong>0</strong>
									</c:when>
								</c:choose> 원
                               	</c:if>
							<c:if test="${cartList[0].gdsInfo.gdsTy eq 'L' }">
								<br>대여가 : <strong><fmt:formatNumber value="${cartList[0].gdsInfo.lendPc}" pattern="###,###" /></strong> 원
                               	</c:if>
						</p>
						</div>
					<div class="order-option">

					<p class="option-title">필수옵션</p>
					<c:set var="optnTtl" value="${fn:split(cartList[0].gdsInfo.optnTtl, '|')}" />
                    <c:set var="optnVal" value="${fn:split(cartList[0].gdsInfo.optnVal, '|')}" />

						<div class="product-option">
							<c:if test="${!empty optnTtl[0]}">
								<div class="product-option" id="optnVal1">
									<button type="button" class="option-toggle" disabled="true">
										<small>필수</small> <strong>${optnTtl[0]} 선택</strong>
									</button>
									<ul class="option-items">
									</ul>
								</div>
							</c:if>
							<c:if test="${!empty optnTtl[1]}">
								<div class="product-option" id="optnVal2">
									<button type="button" class="option-toggle" disabled="true">
										<small>필수</small> <strong>${optnTtl[1]} 선택</strong>
									</button>
									<ul class="option-items">
									</ul>
								</div>
							</c:if>
							<c:if test="${!empty optnTtl[2]}">
								<div class="product-option" id="optnVal3">
									<button type="button" class="option-toggle" disabled="true">
										<small>필수</small> <strong>${optnTtl[2]} 선택</strong>
									</button>
									<ul class="option-items">
									</ul>
								</div>
							</c:if>

							<c:if test="${!empty cartList[0].gdsInfo.aditOptnTtl}">
								<c:set var="aditOptnTtl" value="${fn:split(cartList[0].gdsInfo.aditOptnTtl, '|')}" />
								<p class="option-title">추가옵션</p>
								<c:forEach var="aditOptn" items="${aditOptnTtl}" varStatus="status">
									<div class="product-option" id="aditOptnVal${status.index }">
										<button type="button" class="option-toggle">
											<small>추가</small> <strong>추가 ${aditOptn} 선택</strong>
										</button>
										<ul class="option-items">
											<c:forEach var="aditOptnList" items="${cartList[0].gdsInfo.aditOptnList}" varStatus="status">
												<c:set var="spAditOptnTtl" value="${fn:split(aditOptnList.optnNm, '*')}" />
												<c:if test="${fn:trim(aditOptn) eq fn:trim(spAditOptnTtl[0])}">
													<li><a href="#" data-optn-ty="ADIT" ' data-opt-val="${aditOptnList.optnNm}|${aditOptnList.optnPc}|${aditOptnList.optnStockQy}|ADIT">${spAditOptnTtl[1]}</a></li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</c:forEach>
							</c:if>
							</div>
					</div>
					<table class="table-list order-list cart-chg-list">
						<colgroup>
							<col>
							<col class="w-1/4">
							<col class="w-20 md:w-40">
						</colgroup>
						<thead>
							<tr>
								<th scope="col"><p>상품/옵션 정보</p></th>
								<th scope="col"><p>상품가격</p></th>
								<th scope="col"><p>수량</p></th>
							</tr>
						</thead>
						<tbody>
						<input type="hidden" name="cartGrpNo" value="${cartList[0].cartGrpNo}">
						<input type="hidden" name="cartTy" id="_cartTy" value="${cartList[0].cartTy}">
						<input type="hidden" name="gdsNo" value="${cartList[0].gdsNo}">
						<input type="hidden" name="gdsCd" value="${cartList[0].gdsCd}">
						<input type="hidden" name="gdsNm" value="${cartList[0].gdsNm}">
						<input type="hidden" name="gdsPc" value="${cartList[0].gdsPc}">
							<c:forEach items="${cartList}" var="cart" varStatus="status">
								<c:set var="spOrdrOptn" value="${fn:split(cart.ordrOptn, '*')}" />
								<tr class="tr_${cart.cartNo} optn_${cart.ordrOptnTy}">
									<td>
									<input type="hidden" name="cartNo" value="${cart.cartNo}">
									<input type="hidden" name="bnefCd" value="${cart.bnefCd}">
									<input type="hidden" name="gdsOptnNo" value="${cart.gdsOptnNo}" />
									<input type="hidden" name="ordrOptnTy" value="${cart.ordrOptnTy}">
									<input type="hidden" name="ordrOptn" value="${cart.ordrOptn}">
									<input type="hidden" name="ordrOptnPc" value="${cart.ordrOptnPc}">
									<!-- <input type="hidden" name="ordrQy" value="${cart.ordrQy}"> -->
									<input type="hidden" name="recipterUniqueId" value="${cart.recipterUniqueId}">
									<input type="hidden" name="bplcUniqueId" value="${cart.bplcUniqueId}" >
									<c:if test="${cart.ordrOptnTy eq 'BASE' }">
											<%--상품--%>
											<div class="baseitem">
												<div class="content">
													<p class="code">${cart.gdsCd}</p>
													<p class="name">${cart.gdsNm}</p>
													<c:if test="${!empty spOrdrOptn[0] }">
														<dl class="option">
															<dt>옵션</dt>
															<dd class="ordrOptn">
																<c:forEach items="${spOrdrOptn}" var="ordrOptn">
																	<span class="label-flat">${ordrOptn}</span>
																</c:forEach>
															</dd>
														</dl>
													</c:if>
												</div>
											</div>
										</c:if> <c:if test="${cart.ordrOptnTy eq 'ADIT' }">
											<%--추가상품--%>
											<div class="additem">
												<span class="label-outline-primary"> <span>${spOrdrOptn[0]}</span> <i><img src="/html/page/market/assets/images/ico-plus-white.svg" alt=""></i>
												</span>
												<div class="content">
													<p class="name">${spOrdrOptn[1]}</p>
												</div>
											</div>
										</c:if></td>
									<td class="price !text-right"><c:if test="${cart.ordrOptnTy eq 'BASE'}">
											<strong class="ordrOptnPc"><fmt:formatNumber value="${cart.ordrPc}" pattern="###,###" /></strong> 원
                                       	</c:if> <c:if test="${cart.ordrOptnTy eq 'ADIT'}">
											<strong><fmt:formatNumber value="${cart.ordrOptnPc}" pattern="###,###" /></strong> 원
                                       	</c:if></td>
									<td class="count">
										<p>
											<input type="number" name="ordrQy" class="form-control numbercheck" value="${cart.ordrQy}" min="1" <c:if test="${cart.cartTy eq 'R'}">max="15"</c:if> <c:if test="${cart.cartTy eq 'N'}">max="9999"</c:if>>
										</p> <c:if test="${cart.ordrOptnTy eq 'ADIT' }">
											<button type="button" class="btn btn-small btn-outline-primary" onclick="f_cart_del(this); return false;" data-cart-no="${cart.cartNo}">삭제</button>
										</c:if>
									</td>
								</tr>

								<%-- 2023-12-27:상품옵션정보테이블 퍼블리싱참조 --%>
								<tr>
									<td>
										<div class="baseitem">
											<div class="content">
												<dl class="option">
													<dd>
														<span class="label-flat">분홍</span>
														<span class="label-flat">800g</span>
														<span>2개(+9,720원)</span>
													</dd>
												</dl>
											</div>
										</div>
									</td>
									<td class="price !text-right"><strong>1,420,000</strong> 원</td>
									<td class="count">
										<p><input type="text" class="form-control"></p>
										<button type="button" class="btn btn-small btn-outline-primary">삭제</button>
									</td>
								</tr>
								<%-- 2023-12-27:상품옵션정보테이블 퍼블리싱참조 --%>


							</c:forEach>
						</tbody>
					</table>

					<%-- 2023-12-27:총상품금액, 배송비 영역 --%>
					<div class="pay-order-wrap">
						<dl class="pay-order-price">
							<dt class="title">총 상품금액</dt>
							<dd class="price-box">
								<span class="amount">주문수량<span>7</span>개 |</span>
								<div class="total">
									<strong>45,400</strong>
									<strong>원</strong>
								</div>
								
							</dd>
						</dl>
						<dl class="pay-order-price">
							<dt class="font-bold">배송비</dt>
							<dd>
								<strong>3,000</strong>
								<span>원</span>
							</dd>
						</dl>
					</div>
					<%-- 2023-12-27:총상품금액, 배송비 영역 --%>

				</div>
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-primary btn-submit f_cart_optn_chg">확인</button>
                <button type="button" class="btn btn-outline-primary btn-cancel" data-bs-dismiss="modal">닫기</button>
            </div>
		</div>
	</div>
</div>

<input type="hidden" id="delCartNos" name="delCartNos" value="" />
</form>

<script>
var gdsPc = ${cartList[0].gdsInfo.pc};// 중요함
var cartTy = "${cartList[0].cartTy}"
if(cartTy === "R"){
	<c:choose>
		<c:when test="${cartList[0].recipterInfo.selfBndRt == 15 }">
		gdsPc = ${cartList[0].gdsInfo.bnefPc15};
		</c:when>
		<c:when test="${cartList[0].recipterInfo.selfBndRt  == 9 }">
		gdsPc = ${cartList[0].gdsInfo.bnefPc9};
		</c:when>
		<c:when test="${cartList[0].recipterInfo.selfBndRt  == 6 }">
		gdsPc = ${cartList[0].gdsInfo.bnefPc6};
		</c:when>
		<c:when test="${cartList[0].recipterInfo.selfBndRt  == 0 }">
		gdsPc = 0;
		</c:when>
	</c:choose>
}else if(cartTy === "L"){
	gdsPc = ${cartList[0].gdsInfo.lendPc};
}

function f_optnVal1(optnVal, optnTy){
	$('.product-option').removeClass('is-active');
	$("#optnVal1 ul.option-items li").remove();

	$.ajax({
		type : "post",
		url  : "${_marketPath}/gds/optn/getOptnInfo.json",
		data : {
			gdsNo:'${cartList[0].gdsInfo.gdsNo}'
			, optnTy:optnTy
			, optnVal:optnVal
		},
		dataType : 'json'
	})
	.done(function(json) {
		if(json.result){
			$("#optnVal1 button").prop("disabled", false);
			var oldOptnNm = "";
			$.each(json.optnList, function(index, data){
				var optnNm = data.optnNm.split("*");
				if(oldOptnNm != optnNm[0]){
					if(optnNm.length < 2){
						var optnPc = "";
						var optnSoldout = "";
						if(data.optnPc > 0){ optnPc = " + " + data.optnPc +"원"; }
						if(data.optnStockQy < 1){ optnSoldout = " [품절]"; }
						$("#optnVal1 ul.option-items").append("<li><a href='#' data-optn-ty='BASE' data-opt-val='"+ data.optnNm +"|"+ data.optnPc +"|"+ data.optnStockQy +"|BASE|"+ data.gdsOptnNo +"'>"+ optnNm[0] + optnPc + optnSoldout +"</a></li>");
					}else{
						$("#optnVal1 ul.option-items").append("<li><a href='#' data-optn-ty='BASE' data-opt-val='"+ data.optnNm +"'>"+ optnNm[0] +"</li>");
					}
					oldOptnNm = optnNm[0];
				}
			});
		}else{
			$("#optnVal1 button").prop("disabled", true);
		}

	})
	.fail(function(data, status, err) {
		console.log('error forward : ' + data);
	});
}

function f_optnVal2(optnVal1, optnTy){ // 추후 사용자에서도 사용할 예정
	$('.product-option').removeClass('is-active');
	$("#optnVal2 ul.option-items li").remove();
	$("#optnVal3 ul.option-items li").remove();
	if(optnVal1!=""){
		$.ajax({
			type : "post",
			url  : "${_marketPath}/gds/optn/getOptnInfo.json",
			data : {
				gdsNo:'${cartList[0].gdsInfo.gdsNo}'
				, optnTy:optnTy
				, optnVal:optnVal1
			},
			dataType : 'json'
		})
		.done(function(json) {
			if(json.result){
				$("#optnVal2 button").prop("disabled", false);
				var oldOptnNm = "";
				$.each(json.optnList, function(index, data){
					var optnNm = data.optnNm.split("*");
					if(oldOptnNm != optnNm[1]){
    					if(optnNm.length < 3){
    						var optnPc = "";
    						var optnSoldout = "";
    						if(data.optnPc > 0){ optnPc = " + " + comma(data.optnPc) +"원"; }
    						if(data.optnStockQy < 1){ optnSoldout = " [품절]"; }
    						$("#optnVal2 ul.option-items").append("<li><a href='#' data-optn-ty='BASE' data-opt-val='"+ data.optnNm +"|"+ data.optnPc +"|"+ data.optnStockQy +"|BASE|"+ data.gdsOptnNo +"'>"+ optnNm[1] + optnPc + optnSoldout +"</a></li>");
    					}else{
    						$("#optnVal2 ul.option-items").append("<li><a href='#' data-optn-ty='BASE' data-opt-val='"+ data.optnNm +"'>"+ optnNm[1] +"</li>");
    					}
    					oldOptnNm = optnNm[1];
					}
                });
				$('.product-option .option-toggle')[1].click();
			}else{
				$("#optnVal2").prop("disabled", true);
			}

		})
		.fail(function(data, status, err) {
			console.log('error forward : ' + data);
		});
	}else{
		$("#optnVal2").prop("disabled", true);

		// 3번 옵션도
		$("#optnVal3").prop("disabled", true);
	}
}

function f_optnVal3(optnVal2, optnTy){ // 추후 사용자에서도 사용할 예정
	$('.product-option').removeClass('is-active');
	$("#optnVal3 ul.option-items li").remove();
	if(optnVal2!=""){
		$.ajax({
			type : "post",
			url  : "${_marketPath}/gds/optn/getOptnInfo.json",
			data : {
				gdsNo:'${cartList[0].gdsInfo.gdsNo}'
				, optnTy:optnTy
				, optnVal:optnVal2
			},
			dataType : 'json'
		})
		.done(function(json) {
			if(json.result){
				$("#optnVal3 button").prop("disabled", false);
				var oldOptnNm = "";
				$.each(json.optnList, function(index, data){
					var optnNm = data.optnNm.split("*");
					var optnPc = "";
					var optnSoldout = "";
					if(data.optnPc > 0){ optnPc = " + " + data.optnPc +"원"; }
					if(data.optnStockQy < 1){ optnSoldout = " [품절]"; }
					$("#optnVal3 ul.option-items").append("<li><a href='#' data-optn-ty='BASE' data-opt-val='"+ data.optnNm +"|"+ data.optnPc +"|"+ data.optnStockQy +"|BASE|"+ data.gdsOptnNo +"'>"+ optnNm[2] + optnPc + optnSoldout +"</a></li>");
                });
				//$('.product-option .option-toggle')[1].click();
				$('.product-option .option-toggle')[2].click();
			}else{
				$("#optnVal3").prop("disabled", true);
			}

		})
		.fail(function(data, status, err) {
			console.log('error forward : ' + data);
		});
	}else{
		$("#optnVal2").prop("disabled", true);
	}
}

function f_baseOptnChg(optnVal){
	var spOptnVal = optnVal.split("|");
	var spOptnTxt = spOptnVal[0].split("*");
	var skip = false;

	console.log("optnVal", optnVal); // R * 10 * DEF|1000|0|BASE
	if(spOptnVal[0].trim() != ""){
		$(".cart-chg-list tbody input[name='ordrOptn']").each(function(){
			if($(this).val() == spOptnVal[0].trim()){
				alert("["+spOptnVal[0] + "]은(는) 이미 추가된 옵션상품입니다.");
				skip = true;
			}

		});
	}
	console.log("재고:", spOptnVal[2]);
	if(spOptnVal[2] < 1){
		//alert("선택하신 옵션은 품절상태입니다.");
		skip = true;
	}

	if(!skip){
		$(".cart-chg-list tbody .optn_BASE").find("input[name='ordrOptn']").val(spOptnVal[0]);
		$(".cart-chg-list tbody .optn_BASE").find("input[name='ordrOptnPc']").val(spOptnVal[1]);
		$(".cart-chg-list tbody .optn_BASE").find("input[name='gdsOptnNo']").val(spOptnVal[4]);

		var optnHtml = '';
		for(var i=0; i<spOptnTxt.length;i++){
			optnHtml += '<span class="label-flat">' + spOptnTxt[i].trim() +'</span>';
		}
		$(".cart-chg-list tbody .optn_BASE").find("dd.ordrOptn").html(optnHtml);
		$(".cart-chg-list tbody .optn_BASE").find("strong.ordrOptnPc").text(comma(Number(gdsPc)+Number(spOptnVal[1])));
	}

	$('.product-option').removeClass('is-active');

}

//추가옵션
function f_aditOptnChg(optnVal){
	var spAditOptnVal = optnVal.split("|");
	var spAditOptnTxt = spAditOptnVal[0].split("*"); // AA * BB
	var skip = false;

	$(".cart-chg-list tbody input[name='ordrOptn']").each(function(){
		if($(this).val() == spAditOptnVal[0].trim()){
			alert("["+spAditOptnVal[0] + "]은(는) 이미 추가된 옵션상품입니다.");
			skip = true;
		}
	});
	if(spAditOptnVal[2] < 1){
		alert("선택하신 옵션은 품절상태입니다.");
		skip = true;
	}

	if(!skip){
		var gdsHtml = '';
		gdsHtml += '';
		gdsHtml += '<tr class="tr_${cartNo} optn_ADIT">';
		gdsHtml += '	<td>';
		gdsHtml += '		<input type="hidden" name="cartNo" value="${cartList[0].cartNo}">';
		/*gdsHtml += '		<input type="hidden" name="cartGrpNo" value="${cartList[0].cartGrpNo}">';
		gdsHtml += '		<input type="hidden" name="cartTy" value="${cartList[0].cartTy}">';
		gdsHtml += '		<input type="hidden" name="gdsNo" value="${cartList[0].gdsNo}">';
		gdsHtml += '		<input type="hidden" name="gdsCd" value="${cartList[0].gdsCd}">';
		gdsHtml += '		<input type="hidden" name="bnefCd" value="${cartList[0].bnefCd}">';
		gdsHtml += '		<input type="hidden" name="gdsNm" value="${cartList[0].gdsNm}">';
		gdsHtml += '		<input type="hidden" name="gdsPc" value="0">';*/
		gdsHtml += '		<input type="hidden" name="ordrOptnTy" value="ADIT">';
		gdsHtml += '		<input type="hidden" name="ordrOptn" value="'+spAditOptnVal[0]+'">';
		gdsHtml += '		<input type="hidden" name="ordrOptnPc" value="'+spAditOptnVal[1]+'">';
		gdsHtml += '		<input type="hidden" name="gdsOptnNo" value="'+spAditOptnVal[4]+'">';
		/*gdsHtml += '		<input type="hidden" name="ordrQy" value="${cartList[0].ordrQy}">';*/
		gdsHtml += '		<input type="hidden" name="recipterUniqueId" value="${cartList[0].recipterUniqueId}">';
		gdsHtml += '		<input type="hidden" name="bplcUniqueId" value="${cartList[0].bplcUniqueId}">';

		gdsHtml += '		<div class="additem">';
		gdsHtml += '			<span class="label-outline-primary">';
		gdsHtml += '			<span>'+ spAditOptnTxt[0] +'</span>';
		gdsHtml += '			<i><img src="/html/page/market/assets/images/ico-plus-white.svg" alt=""></i>';
		gdsHtml += '			</span>';
		gdsHtml += '			<div class="content">';
		gdsHtml += '				<p class="name">'+ spAditOptnTxt[1] +'</p>';
		gdsHtml += '			</div>';
		gdsHtml += '		</div>';
		gdsHtml += '	</td>';
		gdsHtml += '	<td class="price">';
		gdsHtml += '		<strong>'+ spAditOptnVal[1] +'</strong> 원';
		gdsHtml += '	</td>';

		gdsHtml += '	<td class="count">';
		gdsHtml += '		<p>';
		gdsHtml += '		<input type="number" name="ordrQy" class="form-control numbercheck" value="1" min="1" max="9999">';
		gdsHtml += '		</p>';
		gdsHtml += '		<button type="button" class="btn btn-small btn-outline-primary" onclick="f_cart_del(this); return false;" data-cart-no="${cartNo}" data-optn-ty="ADIT">삭제</button>';
		gdsHtml += '	</td>';
		gdsHtml += '</tr>';

		$(".cart tbody").append(gdsHtml);
	}

	$('.product-option').removeClass('is-active');

	//f_totalPrice();
}

function f_cart_del(obj) {
	//console.log($(obj).data("dtlNo"));
	if($("#delCartNos").val()==""){
		$("#delCartNos").val($(obj).data("cartNo"));
	}else{
		$("#delCartNos").val($("#delCartNos").val()+","+$(obj).data("cartNo"));
	}
	console.log($("#delCartNo").val());
	$(obj).parents("tr").remove();

}


$(function(){

	$(".option-toggle").on("click", function(){
		$(this).closest('.product-option').toggleClass('is-active');
		$('.product-option').not($(this).closest('.product-option')).removeClass('is-active');
	});

	<c:if test="${empty optnTtl[0]}">
    // 옵션이 없는 경우 //|0|10
    //f_baseOptnChg("|0|${gdsVO.stockQy}");
    f_baseOptnChg("|0|${gdsVO.stockQy}|BASE"); //R * 10 * DEF|1000|0|BASE
    $(".btn-delete").remove();
    </c:if>

    <c:if test="${!empty optnTtl[0]}">
	// 기본 옵션 1번
	f_optnVal1('', 'BASE');
	<c:if test="${empty optnTtl[1]}">
	$(document).on("click", "#optnVal1 ul.option-items li a", function(e){
		e.preventDefault();
		const optnVal1 = $(this).data("optVal");
		console.log(optnVal1);
		if(optnVal1 != ""){
			f_baseOptnChg(optnVal1);
		}
	});
	</c:if>
	</c:if>

	<c:if test="${!empty optnTtl[1]}">
	// 기본 옵션 2번
	$(document).on("click", "#optnVal1 ul.option-items li a", function(e){
		e.preventDefault();
		const optnVal1 = $(this).data("optVal").split("*");
		const optnTy = $(this).data("optnTy");

		console.log("optnVal1 :", optnVal1, optnTy);

		f_optnVal2(optnVal1[0].trim(), optnTy);
	});

	<c:if test="${empty optnTtl[2]}">
	$(document).on("click", "#optnVal2 ul.option-items li a", function(e){
		e.preventDefault();

		const optnVal2 = $(this).data("optVal");//.split("*");
		const optnTy = $(this).data("optnTy");

		console.log("optnVal2 :", optnVal2, optnTy);

		if(optnVal2 != ""){
			f_baseOptnChg(optnVal2);
		}



	});
	</c:if>

	</c:if>

	<c:if test="${!empty optnTtl[2]}">
	// 기본 옵션 3번
	$(document).on("click", "#optnVal2 ul.option-items li a", function(e){
		e.preventDefault();
		const optnVal2 = $(this).data("optVal").split("*");
		const optnTy = $(this).data("optnTy");
		console.log("optnVal2 :", optnVal2, optnTy);
		f_optnVal3(optnVal2[0].trim() +" * " +optnVal2[1].trim(), optnTy);

	});


	$(document).on("click", "#optnVal3 ul.option-items li a", function(e){
		e.preventDefault();
		const optnVal3 = $(this).data("optVal");//.split("*");
		const optnTy = $(this).data("optnTy");
		console.log("optnVal3 :", optnVal3, optnTy);
		if(optnVal3 != ""){
			f_baseOptnChg(optnVal3);
		}
	});
	</c:if>


	<%--추가옵션--%>
	$(document).on("click", "[id^=aditOptnVal] ul.option-items li a", function(e){
		e.preventDefault();
		const optnVal = $(this).data("optVal");
		//기본상품이 있는지 먼저 체크해야함
		if($(".cart-chg-list tbody input[name='ordrOptnTy'][value='BASE']").length > 0 && optnVal != ""){
			f_aditOptnChg(optnVal);
		}else{
			alert("기본 옵션을 먼저 선택해야 합니다.");
			$('.product-option').removeClass('is-active');
		}
	});

	$(".f_cart_optn_chg").on("click", function(){
		var cartNos = [];
		var ordrOptnTys = [];
		var ordrOptns = [];
		var ordrOptnPcs = [];
		var ordrQys = [];
		var recipterUniqueIds = [];
		var bplcUniqueIds = [];
		var gdsOptnNo = [];
		$("input[name='cartNo']").each(function(){	cartNos.push($(this).val());});
		$("input[name='ordrOptnTy']").each(function(){ordrOptnTys.push($(this).val());});
		$("input[name='ordrOptn']").each(function(){ordrOptns.push($(this).val());});
		$("input[name='ordrOptnPc']").each(function(){ordrOptnPcs.push($(this).val());});
		$("input[name='ordrQy']").each(function(){ordrQys.push($(this).val());});
		$("input[name='recipterUniqueId']").each(function(){recipterUniqueIds.push($(this).val());});
		$("input[name='bplcUniqueId']").each(function(){bplcUniqueIds.push($(this).val());});
		$("input[name='gdsOptnNo']").each(function(){gdsOptnNo.push($(this).val());});

		var formData = $("#frmOrdrChg").serialize();

		$.ajax({
			type : "post",
			url  : "${_marketPath}/mypage/cart/optnChgSave.json",
			data : formData,
			dataType : 'json',
			traditional : true
		})
		.done(function(data) {
			if(data.result){
				$("#countModal .btn-cancel").click();
				console.log("success");
				location.reload();
			}else{
				alert("옵션수정 중 오류가 발생하였습니다.");
			}

		})
		.fail(function(data, status, err) {
			alert("옵션수정 중 오류가 발생하였습니다.");
			$("#countModal .btn-cancel").click();
			console.log('error forward : ' + data);
		});

	});

	$("input[name='ordrQy']").on("keyup",function(){
		console.log($("#_cartTy").val());
		if($(this).val() > 15 && $("#_cartTy").val() == 'R'){
			alert("최대 수량은 15개 입니다.");
			$(this).val(15);
		}
	})


});
</script>