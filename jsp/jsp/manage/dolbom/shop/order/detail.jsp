<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="icube.common.util.DateUtil"%>

<c:set var="globalsEroumCarehost"><spring:eval expression="@props['Globals.EroumCare.host']"/></c:set>

<!-- plugin -->
<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.css">
<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>


<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/html/core/style/jqgrid.css">

<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>


<script src="/html/core/script/hangjungdong2407.js"></script>

<script src="/html/core/script/JsHouse2309PopupJqgrid.js"></script>

<script src="/html/page/admin/assets/script/_mng/bplc/JsHouseMngBplcModal.js"></script>

<script src="/html/page/admin/assets/script/_mng/shop/order/JsHouseMngShopOrderDetail.js"></script>
<script src="/html/page/admin/assets/script/_mng/shop/order/JsHouseMngShopOrderItems.js"></script>

<script>
	var jsHouseMngShopOrderDetail = undefined;
</script>
	
<div id="page-content">
	<p class="mb-7">돌봄에서 수급자가 주문요청한 내역을 확인하는 페이지입니다.</p>
	
	
		<fieldset>
			<legend class="text-title2">수급자정보</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">수급자 성명</th>
						<td>${mbrRecipientsVO.getRecipientsNm()}
							<c:if test="${mbrRecipientsVO != null && mbrRecipientsVO.verificationYn eq 'Y'}">
								(위임완료)
							</c:if>
						</td>
						<th scope="row">장기요양인정번호</th>
						<td><c:if test="${mbrRecipientsVO != null && mbrRecipientsVO.rcperRcognNo != ''}">L${mbrRecipientsVO.rcperRcognNo}</c:if></td>
					</tr>
					<tr>
						<th scope="row">본인부담율</th>
						<td>${mbrRecipientsLongtermInfoVO.getSelfBndRt()}%</td>
						<th scope="row">성별</th>
						<td>${codeGender[mbrRecipientsVO.gender]}</td>
					</tr>
					<tr>
						<th scope="row">휴대폰번호</th>
						<td>${mbrVO.getMblTelno()}</td>
						<th scope="row">&nbsp;</th>
						<td id="ordStatusNm">&nbsp;</td>
					</tr>
					<tr>
						<th scope="row">회원코드</th>
						<td>${mbrVO.uniqueId} ( ${ mbrVO.mbrNm } )</td>
						<th scope="row">주문서번호</th>
						<td>${shopOrderMasterVO.getOrdMCd()}</td>
					</tr>
					<tr>
						<th scope="row">배송지주소</th>
						<td>${shopOrderMasterVO.getDeliveryAddr1()} ${shopOrderMasterVO.getDeliveryAddr2()} </td>
						<th scope="row">주문요청일시</th>
						<td>${DateUtil.formatDate(shopOrderMasterVO.getRegDt(), "yyyy-MM-dd HH:mm")}</td>
					</tr>
					<tr>
						<th scope="row">장기요양기관 지정</th>
						<td colspan="3">
							<ul class="mt-2 space-y-1 bplcLi">
								<c:if test="true">
								<li>
									<button type="button" class="btn-primary shadow f_srchBplc hidden">선택</button>
								</li>
								</c:if>
								<li class="addBplcNm">
									
								</li>
								<li>
									<ul class="mt-2 space-y-1 bplcLogList">
										
									</ul>
								</li>
								
							</ul>

							<input type="hidden" id="originBplcUniqueId" name="originBplcUniqueId" value="${shopOrderMasterVO.getBplcUniqueId()}">
							<input type="hidden" id="bplcUniqueId" name="bplcUniqueId" value="">
							<input type="hidden" id="regUniqueId" name="regUniqueId" value="${mbrVO.uniqueId}">
							<input type="hidden" id="recipientsNo" name="recipientsNo" value="${mbrRecipientsVO.recipientsNo}">
						</td>
						
					</tr>
					<tr>
						<th scope="row">탈퇴여부</th>
						<td><c:if test="${mbrVO.getMberSttus() == 'EXIT'}">${codeMberSttus[mbrVO.getMberSttus()]}</c:if></td>
						<th scope="row">주문취소 사유</th>
						<td id="orderCancelReson">${shopOrderMasterVO.getCanclResn()}
						</td>
					</tr>
					
				</tbody>
			</table>
		</fieldset>

		
		<div class="btn-group right mt-5">
			<!--button type="button" class="btn-primary large shadow float-left mb-3  btn order items" >주문정보 확인</button-->

			<button type="button" class="btn-danger large shadow btn order cancel hidden">주문취소</button>
			
			<button type="button" class="btn-success large shadow btn order save hidden">저장</button>

			<a href="#" class="btn-secondary large shadow btn list">목록</a>
		</div>

		<!-- 주문 상세 리스트 -->
		<div class="order items">

			<fieldset class="mt-4 fsItemsLast">
				<legend class="text-title2">최종 주문요청상품</legend>
				<div class="table-jqgrid">
					<table id="popGrdItemsLast" width="98%"></table>
				</div>
			</fieldset>

			<fieldset id="DELIVERYMEMO" class="mt-4">
				<legend class="text-title2">최종 배송메모</legend>
				<table class="table-detail">
					<tr>
						<td>배송메모</td>
					</tr>
				</table>
			</fieldset>

			<fieldset id="ITEMDEL" class="mt-4">
				<legend class="text-title2">상품 삭제 사유</legend>
				<table class="table-detail">
					<tr>
						<td>상품 삭제 상유</td>
					</tr>
				</table>
			</fieldset>

			<fieldset class="mt-4 fsItemsOrigin">
				<legend class="text-title2">최초 주문요청상품</legend>
				<div class="table-jqgrid">
					<table id="popGrdItemsOrigin" width="98%"></table>
				</div>
			</fieldset>
			<fieldset id="DELIVERYFirstMEMO" class="mt-4">
				<legend class="text-title2">최초 배송메모</legend>
				<table class="table-detail">
					<tr>
						<td>배송메모</td>
					</tr>
				</table>
			</fieldset>
		</div>

	<fieldset class="mt-15">                                                                                                
		<legend class="text-title2">관리자 메모 및 주문상태 변경 내역</legend>                                                                 
		<table class="table-detail">
			<colgroup>
				<col class="w-full">
				<col>
			</colgroup>
			<tbody>                               
				<tr>  
					<!-- <th scope="row"><label for="form-item1">내역</label></th> -->
					<td>
						<textarea name="" id="historyTxt" cols="30" rows="5" class="w-full p-3" readonly></textarea>
					</td>                      
				</tr>                                
			</tbody>
		</table>
	</fieldset>

	<fieldset class="mt-5">                                                                        
		<legend class="text-title2">관리자 기록</legend>
		<div class="btn-group right mx-2">
			<button class="small shadow btn-primary f_saveMngMemo btn memo save">저장</button>
		</div>                        
		<table class="table-detail">
			<colgroup>
				<col class="w-43">
				<col>
			</colgroup>
			<tbody>                               
				<tr>
					<th scope="row"><label for="form-item1">메모 작성</label></th>
					<td>
						<textarea name="" id="mngMemo" cols="30" rows="5" class="form-control w-full"></textarea>
					</td>
				</tr>                                
			</tbody>
		</table>
	</fieldset>
	
	<!-- 주문 취소 사유 -->
	<div class="modal fade order cancel" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<form class="modal-content" id="modalCancl" name="modalCancl" method="post">
				<div class="modal-header">
					<p>주문취소</p>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
				</div>
				<fieldset class="modal-body">
					
					<label>취소 사유를 입력해 주세요</label>
					<!--p class="text-red1">※ 상담 취소 시 재상담 신청 접수가 불가합니다.</p-->
					<select name="ddlCancelType" id="ddlCancelType" class="form-control w-full lg:w-8/12" value="">
						<option value="">취소 사유 선택</option>
						<option value="SIMPLE_CHANGE">수급자 단순 변심</option>
						<option value="ETC">기타</option>
					</select>

					<textarea name="canclResn" id="canclResn" cols="30" rows="5" maxlength="20" class="form-control w-full mt-4 hidden"></textarea>
				</fieldset>
				<div class="modal-footer">
					<button type="button" class="btn large btn-primary w-36 update canclResn">저장하기</button>
					<button type="button" class="btn large btn-secondary w-36" data-bs-dismiss="modal" aria-label="close">취소</button>
				</div>
			</form>
		</div>
	</div>
	<!-- //상담 취소 사유 -->

	<!-- //상담 취소 사유 -->

	<!-- 사업소 선택 -->
	<c:import url="/_mng/members/bplc/modalBplcSearch2409" />
	


</div>
<!-- //page content -->


<script>

$(function(){
	jsHouseMngShopOrderDetail = new JsHouseMngShopOrderDetail(this, "#page-content", "${consultAbleTypeAllNum}", "${consultAbleTypeInitNum}");

	var param = jsCommon.fn_queryString_toMap('${pageParam}');
	//param.ordMCd = "${shopOrderMasterVO.getOrdMCd()}";
	param.selfBndRt = "${mbrRecipientsLongtermInfoVO.getSelfBndRt()}";
	param.ordMId = "${shopOrderMasterVO.getOrdMId()}";
	param.ordStatusCd = "${shopOrderMasterVO.getOrdStatusCd()}";
	
	console.log(param)

	
	jsHouseMngShopOrderDetail.fn_carehost("${globalsEroumCarehost}");
	jsHouseMngShopOrderDetail.fn_init(param);
});
</script>


