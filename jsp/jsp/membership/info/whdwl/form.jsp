<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<main id="container" class="is-mypage-style">
	<header id="page-title">
		<h2>
			<span>회원탈퇴</span>
			<small>Member Leave</small>
		</h2>
	</header>

	<jsp:include page="../../layout/page_nav.jsp" />

	<div id="page-content">
		<div class="member-release-title">
			<img src="/html/page/members/assets/images/txt-leave.svg" alt="그동안 이로움ON 마켓을 이용해 주셔서 감사합니다.">
			<p>
				이로움ON 이용 시 불편했거나 부족했던 부분을 알려주시면,<br> 더 좋은 모습으로 찾아 뵙기 위해 노력하겠습니다.
			</p>
		</div>

		<div class="member-release-info mt-7 md:mt-8.5">
			<p>
				${_mbrSession.mbrNm} 회원님 이로움ON 서비스를 이용하시는데 불편함이 있으셨나요?<br>
				이용 불편 및 각종 문의 사항은 고객센터(<a href="mailto:help@thkc.co.kr">help@thkc.co.kr</a>)로 문의주시면 성심 성의껏 답변 드리겠습니다.
			</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p class="text-title2">[유의사항]</p>
			<p>&nbsp;</p>
			<ol class="list-normal ml-2 md:ml-4">
				<li>회원탈퇴 시 이로움ON 앱/웹 서비스를 이용하실 수 없습니다. 이로움돌봄 앱 서비스도 이용하실 수 없습니다.</li>
				<li>상담, 주문내역 등 서비스 이용 내용은 모두 삭제되며, 재가입하더라도 복구되지 않습니다.</li>
				<li>1:1 상담이 진행중일 경우에는 탈퇴처리가 이루어지지 않습니다.</li>
				<li>상품주문 및 취소/교환/반품 처리가 진행중일 경우에는 탈퇴처리가 이루어지지 않습니다.</li>
				<li>보유하고 있는 마일리지/포인트/쿠폰 등은 소멸되며, 재가입하더라도 복구되지 않습니다.</li>
				<li>이로움ON 서비스에서 입력하신 상품문의, 후기 댓글은 삭제 되지 않습니다.</li>
				<li>자사가 제공하는 광고성 이메일 및 SMS의 경우 회원탈퇴 후 24시간 이내 중지 됩니다.</li>
				<li>회원탈퇴 시 사용하고 계신 아이디는 재사용 및 복구가 불가능합니다.</li>
				<li>
					회원탈퇴 후 7일 이내에는 재가입 되지 않습니다.<br>
					(단, 간편가입 회원은 즉시 재가입 가능합니다.)
				</li>
				<li>해당 탈퇴는 이로움ON 회원탈퇴이며, 시니어톡톡 탈퇴는 시니어톡톡 사이트에서 가능합니다.</li>
			</ol>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p>&nbsp;</p>
			<p class="text-title2">[개인정보 파기]</p>
			<p>&nbsp;</p>
			<p>개인정보는 회원 탈퇴 신청이 완료된 이후 즉시 파기됩니다.</p>
			<p>&nbsp;</p>
			<p class="text-alert">단, 전자상거래법, 통신비밀보호법 등 관련 법령의 규정에 의하여 아래와 개인정보가 일정 기간 보관됩니다.</p>
			<p>&nbsp;</p>
			<table class="terms-table">
				<tbody>
					<tr>
						<td>계약 또는 청약철회 등에 관한 기록</td>
						<td class="text-center">5년</td>
					</tr>
					<tr>
						<td>대금결제 및 재화 등의 공급에 관한 기록</td>
						<td class="text-center">5년</td>
					</tr>
					<tr>
						<td>소비자의 불만 또는 분쟁처리에 관한 기록</td>
						<td class="text-center">3년</td>
					</tr>
					<tr>
						<td>웹사이트 방문 기록</td>
						<td class="text-center">3개월</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="member-release-data mt-10 md:mt-12">
			<dl>
				<dt>현재 보유 포인트</dt>
				<dd>
					<fmt:formatNumber value="${resultMap.point}" pattern="###,###" />
					<img src="/html/page/market/assets/images/ico-point.svg" alt="포인트">
				</dd>
			</dl>
			<dl>
				<dt>현재 보유 마일리지</dt>
				<dd>
					<fmt:formatNumber value="${resultMap.mlg}" pattern="###,###" />
					<img src="/html/page/market/assets/images/ico-mileage.svg" alt="마일리지">
				</dd>
			</dl>
			<dl>
				<dt>현재 보유 쿠폰</dt>
				<dd>
					${resultMap.coupon} <small>장</small>
				</dd>
			</dl>
		</div>

		<form id="radioFrm" name="radioFrm" method="get" novalidate="novalidate">
			<input type="hidden" id="dlvyCount" name="dlvyCount" value="${dlvyCount}" />
			<input type="hidden" id="mbrConsltExists" name="mbrConsltExists" value="${mbrConsltExists}" />
			<input type="hidden" id="mbrOrderExists" name="mbrOrderExists" value="${mbrOrderExists}" />
			<p class="text-title2 mt-6 md:mt-8">회원탈퇴 사유</p>
			<div class="member-release-check mt-2.5 md:mt-3">
				<c:forEach var="whdwlCode" items="${norResnCdCode}" varStatus="status">
					<div class="form-check">
						<input class="form-check-input" type="radio" id="whdwlCode${status.index}" name="whdwlCode" value="${whdwlCode.key}">
						<label class="form-check-label" for="whdwlCode${status.index}">${whdwlCode.value}</label>
					</div>
				</c:forEach>
				<input type="text"class="form-control" placeholder="회원탈퇴 사유를 입력해주세요." id="whdwlEtc" style="grid-column: 1/-1; display:none;" />
			</div>

			<div class="flex justify-center space-x-1.5 mt-4 mx-auto md:space-x-2 md:mt-10">
				<button type="submit" class="btn btn-large btn-primary w-44 md:w-53">탈퇴하기</button>
				<a href="/membership/index" class="btn btn-large btn-outline-primary w-31 md:w-37">취소</a>
			</div>
		</form>


		<!-- 탈퇴 모달 -->
		<form id="lveFrm" name="lveFrm" action="./action" method="post">
			<div class="modal fade" id="leaveModal" tabindex="-1" aria-hidden="true">
				<input type="hidden" id="resnCn" name="resnCn" value="" />
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header">
							<p class="text-title">정말 탈퇴하시겠습니까?</p>
						</div>
						<div class="modal-close">
							<button type="button" data-bs-dismiss="modal">모달 닫기</button>
						</div>
						<div class="modal-body">
							<div class="content">
								<p class="text-alert">고객님의 개인정보를 안전하게 취급하며, 회원님의 동의 없이는 회원정보를 공개 및 변경하지 않습니다.</p>
								<p class="text-alert">확인을 위해 비밀번호를 다시 입력해 주세요.</p>
								
								<c:choose>
									<c:when test="${_mbrSession.lgnTy eq 'K'}">
										<div class="mt-8">
											<a href="#" class="btn btn-kakao w-full" onclick="requestWhdwlSnsMbr('K');">
												<span>카카오 인증하기</span>
											</a>
										</div>
									</c:when>
									<c:when test="${_mbrSession.lgnTy eq 'N'}">
										<div class="mt-8">
											<a href="#" class="btn btn-naver w-full" onclick="requestWhdwlSnsMbr('N');">
												<span>네이버 인증하기</span>
											</a>
										</div>
									</c:when>
									<c:otherwise>
										<div class="member-release-reason mt-6">
											<label for="leave-item" class="pswd">비밀번호</label>&nbsp; <input type="password" class="form-control" id="pswd" name="pswd" placeholder="비밀번호" />
										</div>
										<div class="modal-footer">
											<button type="submit" class="btn btn-primary btn-submit">확인</button>
											<button type="button" class="btn btn-outline-primary btn-cancel" data-bs-dismiss="modal">취소</button>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</main>

<script>
	$(function(){
		const pswdChk = /^.*(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=*]).*$/;

		//배송 상태
		const ordrSttsCode = {
		<c:forEach items="${ordrSttsCode}" var="stts">
			${stts.key} : '${stts.value}',
		</c:forEach>
		};

		//사유
		$("input[name='whdwlCode']").on("click",function(){
			$("#resnCn").val($(this).val());
		});

		//유효성 검사
		$("form[name='radioFrm']").validate({
		    ignore: "input[type='text']:hidden",
		    rules : {
		    	whdwlCode : {required : true}
		    },
		    messages : {
		    	whdwlCode : {required : "! 사유선택은 필수 입력 항목입니다."}
		    },
		    errorElement:"p",
		    errorPlacement: function(error, element) {
			    var group = element.closest('.member-release-check');
			    if (group.length) {
			        group.after(error.addClass('text-danger'));
			    } else {
			        element.after(error.addClass('text-danger'));
			    }
			},
		    submitHandler: function (frm) {
		    	if (frm.dlvyCount.value != "0" || frm.mbrOrderExists.value != "0"){
					alert("진행 중인 주문이 있어요. 주문상세에서 연결된 장기요양기관에 문의해주세요.");
					return false;
				}
				if (frm.mbrConsltExists.value != "0"){
					alert("진행 중인 상담이 있어요. 상담 완료 후 탈퇴해주세요.");
					return false;
				}

				$("#leaveModal").modal("show");

		    }
		});

		// 기타 사유 이벤트
		$("input[name='whdwlCode']").on("click",function(){
			if($("#whdwlCode5").is(":checked")){
				$("#whdwlEtc").show();
			}else{
				$("#whdwlEtc").hide();
			}
		});


		//유효성 검사(일반 회원 탈퇴)
		$("form[name='lveFrm']").validate({
		    ignore: "input[type='text']:hidden",
		    rules : {
		    	pswd : {required : true, regex : pswdChk}
		    },
		    messages : {
		    	pswd : {required : "! 비밀번호는 필수 입력 항목입니다.", regex : "! 8~16자 영문, 숫자, 특수문자를 조합하여 입력해 주세요."}
		    },
		    errorElement:"p",
		    errorPlacement: function(error, element) {
			    var group = element.closest('.member-release-reason');
			    if (group.length) {
			        group.after(error.addClass('text-danger'));
			    } else {
			        element.after(error.addClass('text-danger'));
			    }
			},
		    submitHandler: function (frm) {
		    	if (confirm("이로움ON 회원에서 정말 탈퇴하시겠습니까?")) {
		    		frm.submit();
		    	}
		    }
		});
	});
	
	//간편 회원 탈퇴 요청
	function requestWhdwlSnsMbr(joinTy) {
		var redirecUrl = '/'
		var resnCn = $("#resnCn").val();
		var whdwlEtc = $('#whdwlEtc').val();
		
		if (joinTy === 'K') {
			redirecUrl = '/membership/kakao/reAuth?requestView=whdwl&resnCn=' + resnCn + '&whdwlEtc=' + whdwlEtc;
		} else if (joinTy === 'N') {
			redirecUrl = '/membership/naver/reAuth?requestView=whdwl&resnCn=' + resnCn + '&whdwlEtc=' + whdwlEtc;
		}
		location.href = redirecUrl;
	}
</script>