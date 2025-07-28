<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			
<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/html/core/style/jqgrid.css">

<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>


<script src="/html/core/script/JsHouse2309PopupJqgrid.js"></script>

<script src="/html/page/admin/assets/script/_mng/shop/JsHouseMngListSearch.js"></script>
<script src="/html/page/admin/assets/script/_mng/shop/items/JsHouseMngShopItemsRcmdView.js"></script>

<script>
	var jsHouseMngShopItemsRcmdView = null;
</script>
	
<div id="page-content">
	<p class="mb-3">
		판매 / 대여 구분 : ${GDS_TY_NM}
	</p>

	<p class="mb-3">
		카테고리 : 
		<c:if test="${shopCategoryVO.getCaParName() ne null && shopCategoryVO.getCaParName() ne ''}">
			${shopCategoryVO.getCaParName()} >
		</c:if>
		${shopCategoryVO.getCaName()}
	</p>

    <p class="mb-7">
		※ 상품 노출 순위 및 노출 여부는 변경 후 하단의 ‘상태 업데이트’ 버튼을 클릭해야지만 저장됩니다
	</p>

	<div class="mt-13 flex items-end gap-1.5">
        <p class="text-title2 mr-auto"></p>
        <button type="button" class="btn-primary mb-3 btn item sort update">상태 업데이트</button>
        <button type="button" class="btn-secondary mb-3 btn item register" >추천 상품 등록</button>
		<button type="button" class="btn-secondary mb-3 btn item delete" >선택 삭제</button>
		<a href="#" class="btn-secondary  mb-3 shadow btn list">목록</a>
    </div>

	<div class="flex items-end gap-1.5">
        <table id="grdMaster" width="98%"></table>
        
    </div>

		<!-- 주문 상세 리스트 -->
		<div class="modal fade item register" tabindex="-1">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content" id="modalCancl" name="modalCancl" method="post">
					<div class="modal-header">
						<p>추천 상품 등록</p>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
					</div>
					<fieldset class="modal-body">
						<div>
							<p class="mb-7">
								※ 카테고리 노출 순위 및 노출 여부는 변경 후 하단의 ‘상태 업데이트’ 버튼을 클릭해야지만 저장됩니다.
								<br>
								※ 카테고리별 추천 상품은 각 카테고리의 ‘등록/관리' 버튼을 클릭하여 확인 및 등록 가능합니다.
							</p>
							
							<fieldset>
								<table class="table-detail">
									<colgroup>
										<col class="w-43">
										<col>
										<col class="w-43">
									</colgroup>
									<tbody>
										
										<tr>
											<th scope="row"><label for="srchCd">상품명</label></th>
											<td>
												<div class="form-group w-84">
													<input type="text" class="form-control flex-1" name="srchValue" id="srchValue" value="" placeholder="2글자 이상 입력 후 검색해 주십시오.">
												</div>
											</td>
											<td><button type="button" class="btn-primary large shadow w-38 btn search">검색</button></td>
										</tr>
										
									</tbody>
								</table>
							</fieldset>
						

							<fieldset>
								<legend class="text-title2">검색 결과</legend>
								<div class="table-jqgrid">
									<table id="popGrdMaster" width="98%"></table>
								</div>
							</fieldset>
							<div class="modal-footer">
								<button type="button" class="btn large btn-primary w-36 f_modalSelect">선택</button>
								<button type="button" class="btn large btn-secondary w-36 f_modalCancel" data-bs-dismiss="modal" aria-label="close">취소</button>
							</div>
					</fieldset>
					
				</div>
			</div>
		</div>
</div>

<script>

	$(function(){
		var param = jsCommon.fn_queryString_toMap('${pageParam}')
	
		jsHouseMngShopItemsRcmdView = new JsHouseMngShopItemsRcmdView(this, "#page-content");
		jsHouseMngShopItemsRcmdView.fn_post_data(param)
		jsHouseMngShopItemsRcmdView.fn_init();
	});
	</script>
	