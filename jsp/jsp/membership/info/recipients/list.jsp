<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/toastify-js/src/toastify.min.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>

<style>

	.toastify{
		text-align: center;
		font-size: 1rem;
		font-weight: 400;
		line-height: 150%;
		letter-spacing: -0.176px;
		padding: 16px 32px;
		border-radius: 8px;
		background: rgba(34, 34, 34, 0.80);
		box-shadow: 0px 4px 12px 0px rgba(0, 0, 0, 0.40);
		width: 480px;
		max-width: fit-content;
	}

	@media (max-width: 768px) {
		.toastify{
			width: calc(100% - 24px);
			max-width: 100%;
		}

	}

	/* x버튼 영역전체 */
	.toast-close{
		opacity: 0;
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
	}
</style>



<main id="container" class="is-mypage-style">
	<header id="page-title">
		<h2>
			<span>수급자 관리</span>
		</h2>
	</header>
	
	<jsp:include page="../../layout/page_nav.jsp" />

	<div id="page-content">               
		<h3 class="mypage-title2">수급자 관리</h3>
		<div class="mypage-consult-desc text-with-icon">
			<i class="icon-alert"></i>
			<p>장기요양보험 수급자와 예비수급자의 정보를 관리할 수 있는 페이지입니다.</p>
		</div>

		<div class="mypage-client-details mt-3.5 md:mt-5">
			<c:forEach var="recipientInfo" items="${mbrVO.mbrRecipientsList}" varStatus="status">
				<div class="mypage-client-item <c:if test="${recipientInfo.mainYn == 'Y'}">active</c:if>">
					<input class="inputRecipientsNo" type="hidden" value="${recipientInfo.recipientsNo}">
					<label class="flag">
						<input type="radio" id="flag1" name="flag" value="" class="favorite" disabled <c:if test="${recipientInfo.mainYn == 'Y'}">checked</c:if>>
					</label>
					<div class="item-current-header">
						<i class="icon-clienton"></i>
						<h4 class="text-2xl break-all">
							<strong>${recipientInfo.recipientsNm}</strong>(${recipientInfo.relationCd eq '100' ? '기타(친척등)' : relationCd[recipientInfo.relationCd]})
						</h4>
						<p class="text-gray6">
							${recipientInfo.rcperRcognNo == null || recipientInfo.rcperRcognNo == "" ? "" : "L"}
							${recipientInfo.rcperRcognNo == null || recipientInfo.rcperRcognNo == "" ? "요양인정번호 없음" : recipientInfo.rcperRcognNo}
						</p>
					</div>
					<div class="rounded-card-gray" >
						<dl class="item-current">
							<dt>상담유형</dt>
							<dd>
								<c:if test="${mbrConsltMap[recipientInfo.recipientsNo] != null}">
									${prevPath[mbrConsltMap[recipientInfo.recipientsNo].prevPath]}
								</c:if>
							</dd>
						</dl>
						<dl class="item-current">
							<dt>상담 진행 현황</dt>
							<dd>
								<c:if test="${mbrConsltMap[recipientInfo.recipientsNo] != null}">
									<c:choose>
										<c:when test="${mbrConsltMap[recipientInfo.recipientsNo].consltSttus eq 'CS03'}">상담 취소</c:when>
										<c:when test="${mbrConsltMap[recipientInfo.recipientsNo].consltSttus eq 'CS09'}">상담 취소</c:when>
										<c:when test="${mbrConsltMap[recipientInfo.recipientsNo].consltSttus eq 'CS04'}">상담 취소</c:when>
										<c:otherwise>
											${consltSttus[mbrConsltMap[recipientInfo.recipientsNo].consltSttus]}
										</c:otherwise>
									</c:choose>
								</c:if>
							</dd>
						</dl>
						<dl class="item-current">
							<dt>장기요양기관</dt>
							<dd class="flex flex-col items-start justify-center gap-2">
								<c:if test="${mbrConsltMap[recipientInfo.recipientsNo] != null}">
									<div class="flex items-center justify-start gap-2">
										<c:choose>
											<c:when test="${mbrConsltMap[recipientInfo.recipientsNo].consltResultList.size() > 0}">
												<c:set var="bplcInfo" value="${mbrConsltMap[recipientInfo.recipientsNo].consltResultList[0]}" />
												<strong>${bplcInfo.bplcNm}</strong>
												
												<%-- 
												<label class="recommend">
													<input type="checkbox" id="mainYn${status.index}" name="mainYn${status.index}" value="${bplcInfo.bplcUniqueId}" 
														onchange="changeItrst(this);"
														<c:if test="${itrstList.stream().filter(f -> f.bplcUniqueId == bplcInfo.bplcUniqueId).count() > 0}">checked</c:if>
													>
												</label>
												--%>
											</c:when>
											<c:otherwise>
												<c:if test="${mbrConsltMap[recipientInfo.recipientsNo].consltSttus != 'CS03' && mbrConsltMap[recipientInfo.recipientsNo].consltSttus != 'CS09'}">
													사업소 배정 중
												</c:if>
											</c:otherwise>
										</c:choose>
									</div>
									<%-- 
									<c:if test="${mbrConsltMap[recipientInfo.recipientsNo].consltResultList.size() > 0}">
										<div class="text-subtitle">
											<i class="icon-alert size-sm"></i>
											별(★)을 눌러 관심 멤버스 설정하세요
										</div>
									</c:if>
									--%>
								</c:if>
							</dd>
						</dl>
						<a href="./view?recipientsNo=${recipientInfo.recipientsNo}" class="btn btn-primary2">상세보기</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	
	<!-- 수급자 등록하기, 수정하기, 상담 신청하기 지원 모달 -->
    <jsp:include page="/WEB-INF/jsp/common/modal/add_recip_or_conslt_modal.jsp" />
    
</main>

<script>
	// 수급자 추가하기 버튼 클릭
	function clickAddRecipientBtn() {
		openRecipientOrConsltModal('addRecipient');
	}
	
	// 상담하기 버튼 클릭 dylee
	function fn_requestConslt_click(recipientsNo, prevPath, status) {
		if (prevPath =='test' && status == 'noresult'){
			if (confirm("간단한 테스트를 받을 수 있는 혜택을 확인하고 장기요양 인정등급을 간편하게 신청해 보시겠습니까?")){
				location.href = '/test/physical?recipientsNo=' + recipientsNo;
			}
		} else if (prevPath =='test' && status == 'notgrade'){
			if (confirm("대상자가 아니에요. 받을 수 있는 다른 혜택을 알아보시겠어요?")){
				location.href = '/main/searchBokji';
			}
		} else if (prevPath =='equip_ctgry' && status == 'noresult'){
			if (confirm("필요한 복지용구를 선택하고 상담하면 받을 수 있는 혜택을 알려드려요.")){
				location.href = '/main/welfare/equip/list?recipientsNo=' + recipientsNo;
			}
		} else if ((prevPath =='test' || prevPath =='equip_ctgry') && status == 'consult'){
			openRecipientOrConsltModal('requestConslt', Number(recipientsNo), prevPath);
		}
	}
	

	// **하단과 같음
	// $('.mypage-client-item:not(.add-item)').mouseover(function(){

	// 	const parents = $(".mypage-client-item");
	// 	const radios = $(".favorite");


	// 	parents.removeClass('active');
	// 	radios.prop('checked', false);
	// 	$(this).addClass('active');
	// 	$(this).find(radios).prop('checked', true);

	// });


	// document.querySelectorAll('.mypage-client-item:not(.add-item)').forEach(function(item) {
	// 	item.addEventListener('mouseenter', function() {
	// 		const parents = document.querySelectorAll('.mypage-client-item');
	// 		const radios = document.querySelectorAll('.favorite');

	// 		parents.forEach(function(parent) {
	// 			parent.classList.remove('active');
	// 		});

	// 		radios.forEach(function(radio) {
	// 			radio.checked = false;
	// 		});

	// 		this.classList.add('active');
	// 		this.querySelectorAll('.favorite').forEach(function(radio) {
	// 			radio.checked = true;
	// 		});
	// 	});
	// });
	
	window.onload = function(){
		const parents = document.querySelectorAll(".mypage-client-item");
		const radios = document.querySelectorAll(".favorite");
	
		radios.forEach((radio) => {
			//수급자 대표 변경 이벤트
			radio.addEventListener("change", (e) => {
				const current = e.currentTarget;
				const parent = current.closest('.mypage-client-item');
				if(current.checked){
					parents.forEach(parent => {
						parent.classList.remove('active');
					});

					if (parent) {
						parent.classList.add('active');
					}
				}


				var oldManName = $('.mypage-client-item.active .text-2xl.break-all strong').text();
				
				//Toast 토스트
				Toastify({
					text: "대표 수급자(" + oldManName +")를 변경했습니다.",
					duration: 3000,
					close: true,
					gravity: "bottom", // `top` or `bottom`
					position: "center", // `left`, `center` or `right`
					stopOnFocus: true, // Prevents dismissing of toast on hover
					style: {

					},
					offset: {
						x: 0, // horizontal axis - can be a number or a string indicating unity. eg: '2em'
						y: 17 // vertical axis - can be a number or a string indicating unity. eg: '2em'
					},
				}).showToast();


				
				//대표 수급자 처리
				var recipientsNo = $(current).parent().prev().val();
				
				$.ajax({
					type : "post",
					url  : "/membership/info/recipients/update/main.json",
					data : {
						recipientsNo : Number(recipientsNo)
					},
					dataType : 'json'
				})
				.done(function(data) {
					if(data.success) {
						
					}else{
						alert(data.msg);
					}
				})
				.fail(function(data, status, err) {
					alert('서버와 연결이 좋지 않습니다.');
				});
			});
		});
	};
	
	//관심 멤버스 등록/해제
	function changeItrst(event) {
		var checked = $(event)[0].checked;
		var bplcUniqueId = $(event)[0].value;
		
		//체크 상태시 등록
		if (checked) {
			$.ajax({
				type : "post",
				url  : "/membership/conslt/itrst/insertItrstBplc.json",
				data : {
					arrUniqueId : [bplcUniqueId]
				},
				traditional: true,
				dataType : 'json'
			}).done(function(data) {
				if(data.result == 0){
					$(this).prop('checked', false);
					alert("관심 멤버스 등록에 실패했습니다. /n 관리자에게 문의바랍니다.");
					return false;
				}else if(data.result == 1){
				}else{
					$(this).prop('checked', false);
					alert("관심 멤버스는 최대 5개 입니다.");
					return false;
				}
			}).fail(function(data, status, err) {
				console.log(data);
				return false;
			});
		} else {
			$.ajax({
				type : "post",
				url  : "/membership/conslt/itrst/deleteItrstBplc.json",
				data : {
					uniqueId : bplcUniqueId
				},
				dataType : 'json'
			})
			.done(function(json) {
				
			})
			.fail(function(data, status, err) {
				console.log(data);
			});
		}
	}
	
</script>