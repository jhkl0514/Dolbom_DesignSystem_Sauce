<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="page-content">
		<fieldset>
			<p class="text-right mb-3">
				<button type="button" class="btn f_srchMbr" data-bs-toggle="modal" data-bs-target="#mbrModal">회원검색</button>
				<button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#fileModal">파일선택</button>
				<button type="button" class="btn" id="deleBtn">선택삭제</button>
			</p>
			<legend class="text-title2 relative">
				회원선택 <span class="text-sm absolute whitespace-nowrap left-full top-1 ml-2">선택된 회원만 적용됩니다.</span>
			</legend>
			<table class="table-list" id="relMbrList">
				<colgroup>
					<col class="w-28">
					<col>
					<col>
					<col>
					<col class="w-28">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" id="allChkBtn" name="allChkBtn">
								<label class="form-check-label" for="allChkBtn"></label>
							</div>
						</th>
						<th scope="col">번호</th>
						<th scope="col">고객코드</th>
						<th scope="col">고객명</th>
						<th scope="col">아이디</th>
					</tr>
				</thead>
				<tbody>
					<td class="noresult" colspan="5">선택된 회원 없습니다.</td>
				</tbody>
			</table>
		</fieldset>


	<form:form action="./action" class="mt-13" id="pointFrm" name="pointFrm" method="post" modelAttribute="mbrPointVO">
	<form:hidden path="crud" />
	<form:hidden path="pointMngNo" />
	<input type="hidden" id="arrUniqueId" name="arrUniqueId" value="" />

		<fieldset>
			<legend class="text-title2 relative">
				적립/차감 <span class="absolute left-full top-0.5 ml-1 whitespace-nowrap text-sm"> (<span class="badge-require ml-1 mr-0.5 -translate-y-0.5"></span> 는 필수입력사항입니다.)
				</span>
			</legend>
			<table class="table-detail">
				<colgroup>
					<col class="w-43">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="pointSe" class="require">포인트 구분</label></th>
						<td>
							<div class="form-check-group">
								<c:forEach var="pointSe" items="${pointSeCode}" varStatus="status" end="1">
									<div class="form-check">
										<form:radiobutton class="form-check-input" path="pointSe" id="pointSe${status.index}" value="${pointSe.key}" />
										<label class="form-check-label" for="pointSe${status.index}">${pointSe.value}</label>
									</div>
								</c:forEach>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="pointCn">포인트 내역</label></th>
						<td>
							<%-- 2023-02-16 : 마일리지 / 포인트 구분을 위해 하드코딩으로 변경 --%>
							<div class="form-check-group">
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn0" value="01"/>
									<label class="form-check-label" for="pointCn0">특별 행사 적립</label>
								</div>
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn1" value="02"/>
									<label class="form-check-label" for="pointCn1">이벤트</label>
								</div>
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn2" value="03"/>
									<label class="form-check-label" for="pointCn2">추천인 포인트</label>
								</div>
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn3" value="12"/>
									<label class="form-check-label" for="pointCn3">적립 취소</label>
								</div>
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn5" value="31"/>
									<label class="form-check-label" for="pointCn5">회원 가입</label>
								</div>
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn6" value="35"/>
									<label class="form-check-label" for="pointCn6">상품 후기</label>
								</div>
								<div class="form-check">
									<form:radiobutton class="form-check-input" path="pointCn" id="pointCn7" value="99"/>
									<label class="form-check-label" for="pointCn7">기타</label>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="mngrMemo">관리자 메모</label></th>
						<td><form:input class="form-control w-full" path="mngrMemo" maxlength="200"/>
							<p class="py-1">기타포인트 적립시에만 사용되는 메모입니다. 예)이벤트명</p></td>
					</tr>
					<tr>
						<th scope="row"><label for="point" class="require">포인트</label></th>
						<td><form:input class="form-control w-50" path="point" type="number" min="0"/></td>
					</tr>
				</tbody>
			</table>
		</fieldset>

		<div class="btn-group right mt-5">
			<button type="submit" class="btn-primary large shadow">적용</button>
		</div>
	</form:form>

	<c:import url="/_mng/promotion/coupon/modalMbrSearch" />
	<c:import url="/_mng/promotion/coupon/modalFileUpload" />

	<script>

	//삭제
	var arrDelChk = [];
	//회원선택
	var arrMbrChk = [];
	var cnt = 1 ;

	//회원검색 콜백
	function f_modalMbrSearch_callback(mbrUniqueIds){
		console.log("callback: " + mbrUniqueIds);
		if($("#relMbrList tbody td").hasClass("no-data")){
			$("#relMbrList tbody tr").remove();
		}

		//중복 추가x
		mbrUniqueIds = arrayRemove(mbrUniqueIds, ${mbrVO.uniqueId});
			// 중복된 회원이 있을 경우 추가x
			$("input[name='uniqueId']").each(function(){
				mbrUniqueIds = arrayRemove(mbrUniqueIds, $(this).val());
			});

		mbrUniqueIds.forEach(function(uniqueId){

			var mbrJson = mbrMap.get(uniqueId);
			$(".noresult").remove();
			//relGdsList
			var html ="";
			html += '<tr class="trCnt '+mbrJson.uniqueId+'">';
			html += '<td>';
			html += '<div class="form-check">';
			html += '<input class="form-check-input chkBox" type="checkbox" name="mbrChkBox" value="'+mbrJson.uniqueId+'" id="idx'+cnt+'">';
			html += '<input type="hidden" name="uniqueId" value="'+mbrJson.uniqueId+'">';
			html += '</div>';
			html += '</td>';
			html += '<td>'+cnt+'</td>';
			html += '<td>'+mbrJson.uniqueId+'</td>';
			html += '<td>'+mbrJson.mbrNm+'</td>';
			html += '<td>'+mbrJson.mbrId+'</td>';
			html += '</tr>';

			$("#relMbrList tbody").append(html);

			cnt += 1;
		});

		$(".btn-close").click();
	}

	$(function(){

		//회원 검색 모달
		$(".f_srchMbr").on("click", function(){
			if ( !$.fn.dataTable.isDataTable('#mbrDataTable') ) { //데이터 테이블이 있으면x
	 			MbrDataTable.init();
	 		}
		});

		//전체 선택
		$(document).on("click", "#allChkBtn", function(){
			if($("#allChkBtn").is(":checked")){
				$("input[name='mbrChkBox']").prop("checked",true);
				$("input:checkbox[name='mbrChkBox']:checked").each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
					arrDelChk.push(this.value);
					arrMbrChk.push(this.value);
			    });
			}else{
				$("input[name='mbrChkBox']").prop("checked",false);
				arrDelChk = [];
				arrMbrChk = [];
			}
		});

		//회원 선택 목록
		$(document).on("click", "input[name='mbrChkBox']", function(){
			if($(this).is(":checked")){
				arrMbrChk.push($(this).val());
			}else{
				arrMbrChk = arrMbrChk.filter((element) => element !== $(this).val());
				arrDelChk = arrMbrChk;
			}
		});

        //유효성 검사
        $("form#pointFrm").validate({
	    ignore: "input[type='text']:hidden",
	    rules : {
	    	point : { required : true}
	    },
	    messages : {
	    	point : { required : "포인트는 필수 입력 항목입니다."}
	    },
	    submitHandler: function (frm) {
	    	var totalCnt = $("input[name='mbrChkBox']:checked").length;
	    	if(totalCnt < 1){
	    		alert("대상 회원을 선택해주세요");
	    		return false;
	    	}else{
	    		if(confirm("대상 회원에게 포인트를 적용하시겠습니까?")){
	    			$("#arrUniqueId").val(arrMbrChk);
					frm.submit();
				}else{
					return false;
				}
	    	}
	    }
	});

	});
	</script>

