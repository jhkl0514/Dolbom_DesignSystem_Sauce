<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

			
<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/html/core/style/jqgrid.css">

<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>


<script src="/html/core/script/JsHouse2309PopupJqgrid.js"></script>

<script src="/html/page/admin/assets/script/_mng/shop/JsHouseMngListSearch.js"></script>
<script src="/html/page/admin/assets/script/_mng/shop/items/JsHouseMngShopItemsRcmdList.js"></script>

<script>
	var jsHouseMngShopItemsRcmdList = null;
</script>
	
<div id="page-content">
    <form id="searchFrm" name="searchFrm">
		<input type="hidden" name="cntPerPage" id="cntPerPage" value="${listVO.cntPerPage}" />
		<input type="hidden" name="sortBy" id="sortBy" value="${param.sortBy}" />
		<input type="hidden" name="menuNo" id="menuNo" value="${param.menuNo}" />
        <p class="mb-7">
            ※ 카테고리 노출 순위 및 노출 여부는 변경 후 하단의 ‘상태 업데이트’ 버튼을 클릭해야지만 저장됩니다.
            <br>
            ※ 카테고리별 추천 상품은 각 카테고리의 ‘등록/관리' 버튼을 클릭하여 확인 및 등록 가능합니다.
        </p>
        
		<fieldset>
			<legend class="text-title2">검색</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					
					<tr>
						<th scope="row"><label for="srchCd">카테고리명</label></th>
						<td>
							<div class="form-group w-84">
								<input type="text" class="form-control flex-1" name="srchValue" id="srchValue" value="">
							</div>
						</td>
					</tr>
					
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group mt-5">
			<button type="button" class="btn-primary large shadow w-52 btn search">검색</button>
		</div>
	</form>

        
    <div class="mt-13 flex items-end gap-1.5">
        <p class="text-title2 mr-auto"></p>
        <button type="button" class="btn-primary mb-3 btn category order update">상태 업데이트</button>
        <%-- <button type="button" class="btn-secondary mb-3" id="delConslt" name="delConslt">선택 삭제</button> --%>
    </div>
    <div class="flex items-end gap-1.5">
        <table id="grdMaster" width="98%"></table>
        
    </div>

</div>

<script>

	$(function(){
		var param = jsCommon.fn_queryString_toMap('${pageParam}')
	
		jsHouseMngShopItemsRcmdList = new JsHouseMngShopItemsRcmdList(this, "#page-content");
		jsHouseMngShopItemsRcmdList.fn_post_data(param)
		jsHouseMngShopItemsRcmdList.fn_init();
	});
	</script>
	