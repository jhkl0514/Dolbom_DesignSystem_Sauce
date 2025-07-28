<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- swiper -->
<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />

<style>
	/* 배너 swipe */
	.banner_swiper{
		margin: -12px -20px;
	}

	.banner_swiper .swiper-slide {
		background-color: #fff;
		padding: 12px 20px;
	}

	.banner_swiper .swiper-pagination {
		width: auto;
		top: 24px;
		right: 32px;
		left: initial;
		font-size: 0;
		line-height: 0;
	}

	.notice_Swiper {
		height: 24px;
	}

	.notice_Swiper .swiper-slide {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		display: flex;
	}

	/* 대상 어워드 <!-- DEDS-235 202411 --> */
	.award_swiper .swiper-slide{padding:24px 24px 24px 44px;}
	.award_swiper .swiper-slide .iconImg{height: 48px;}
	.award_swiper .swiper-prev, .swiper-next{
		position: absolute;
		display: flex;
		z-index: 10;
		top:calc(50% - 16px);

		img{width: 32px;height: 32px;}
	}
	.award_swiper .swiper-prev{left:10px;transform: rotate(180deg);}
	.award_swiper .swiper-next{right:10px;}


	/* 대상 어워드 <!-- DEDS-235 202412 --> */
	/* 앰블럼배너 유무에 따른 간격조절 */
	.award_swiper_area{background-color: #f5f5f5;margin: 0 -20px;}
	/* 앰블럼배너 유 */
	.award_swiper_area:has(.award_swiper){padding-bottom: 60px;}
	/* 앰블럼배너 무 */
	.award_swiper_area:not(:has(.award_swiper)){padding-top: 60px;background-color: #fff;}
</style>

<div class="wrapper">
    <header>
		<nav class="top">
			<div class="btn_back">
				<div class="txt">
					<span class="txtEvt"></span>
					<c:if test="${ _matMbrSession.loginCheck && fn:length(mbrRecipientsList) > 1 }">
						<div class="top_dropdown_area">
							<a class="top_dropdown_btn modal-trigger" href="#modal_om_select"></a>
						</div>
					</c:if>
					<span class="color_tp_s font_sbls marL4">님을 위한 서비스</span>
				</div>
			</div>
			<c:if test="${ _matMbrSession.loginCheck }">
				<div class="icon_area waves-effect">
					<div class="icon_btn i_alarm <c:if test="${hasNewNoti}">noti_dot</c:if>" onclick="location.href='/matching/noti/list'"></div>
				</div>
			</c:if>
		</nav>
	</header>

    <main>
		<section class="default bottom_0">
			<div id="lnoRequestCard" class="card marB32" onclick="moveToRcperRcognNoRegist()">
				<div class="close_x p03" onclick="dismissRequestCard(event)"></div>
				<a class="card-content waves-effect box_coun_list s02 _om_box">
					<div class="img_area trans_04 ing"></div>
					<div class="color_t_p font_sbmb">
						<span class="color_tp_pp">요양인정번호</span>를<br>등록해주세요
					</div>
				</a>
			</div>
			<div id="longtermSearchRequestCard" class="card marB32" onclick="moveToWelfareIntro()">
				<div class="close_x p03" onclick="dismissRequestCard(event)"></div>
				<a class="card-content waves-effect box_coun_list s02 _om_box">
					<div class="img_area trans_05 ing"></div>
					<div class="color_t_p font_sbmb">
						놓치고 있는<br>
						<span class="color_tp_pp">복지용구 확인</span>하세요
					</div>
				</a>
			</div>
			<div id="cartConfirmRequestCard" class="card marB32">
				<a class="card-content waves-effect box_coun_list s02 _om_box">
					<div class="close_x p03" onclick="dismissRequestCard(event)"></div>
					<div class="img_area trans_06 ing"></div>
					<div class="color_t_p font_sbmb">
						장바구니에 담은 복지용구가<br>
						<span class="color_tp_pp">잠시후 사라져요</span>
					</div>
				</a>
			</div>
			<div class="card service_card_order backImg_01">
				<div class="d-flex">
					<div class="title_area">
						<span class="txt_cate">놓친 복지용구 받기</span>
						<div class="txt_ctn">
							숨어있는 지원금으로<br>
							복지용구 바로 주문요청
						</div>
						<div class="btn_area">
							<a class="waves-effect btn_order" onclick="moveToWelfareIntro()">지원금 확인하기</a>
						</div>
					</div>
				</div>
			</div>

			<div class="h20"></div>

			<div class="card service_card c01" onclick="moveToInterestIntro()">
				<div class="title_area">
					<span class="txt_cate">복지용구</span>
					<div class="txt_ctn">
						불편하세요?<br>
						간편한 복지용구 신청
					</div>
				</div>

				<div class="om_img_area">
					<img src="/html/page/app/matching/assets/src/images/10om/rom_01.svg">
				</div>

				<div class="box_area">
					<div class="box">
						<img src="/html/page/app/matching/assets/src/images/08etc/tool_80.svg">
						<div class="ctn_area">
							<div class="font_sbss">관심 복지용구</div>
							<p class="color_t_s font_sbsr noMar">
								쉽고 빠르게 신청해요
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="h20"></div>

			<div class="card service_card c02" onclick="moveToSimpleTestIntro()">
				<div class="title_area">
					<span class="txt_cate">인정등급</span>
					<div class="txt_ctn">
						혜택 받을 수 있는 지<br>
						빠르게 확인
					</div>
				</div>

				<div class="om_img_area">
					<img src="/html/page/app/matching/assets/src/images/10om/rom_02.svg">
				</div>

				<div class="box_area">
					<div class="box">
						<img src="/html/page/app/matching/assets/src/images/08etc/test_80.svg">
						<div class="ctn_area">
							<div class="font_sbss">인정등급 간편 테스트</div>
							<p class="color_t_s font_sbsr noMar">
								간단하게 확인하세요
							</p>
						</div>
					</div>
				</div>
			</div>
			
			<div class="h20"></div>

			<div class="card service_card c03" onclick="moveToCareIntro()">
				<div class="title_area">
					<span class="txt_cate">재가센터</span>
					<div class="txt_ctn">
						혼자 계시지 않도록<br>
						돌봄 신청
					</div>
				</div>

				<div class="om_img_area">
					<img src="/html/page/app/matching/assets/src/images/10om/rom_03.svg">
				</div>

				<div class="box_area">
					<div class="box">
						<img src="/html/page/app/matching/assets/src/images/08etc/time03_80.svg">
						<div class="ctn_area">
							<div class="font_sbss ">어르신 돌봄</div>
							<p class="color_t_s font_sbsr noMar">
								걱정을 덜어드릴게요
							</p>
						</div>
					</div>
				</div>
			</div>


			<div class="h48"></div>

			<%-- 신규배너 추가 --%>
			<div class="swiper banner_swiper">
				<div class="swiper-wrapper">
					<c:forEach var="item" items="${dBannerList}" varStatus="status">
						<div class="swiper-slide">
							<a id="clickUrl" onclick="clickOpenUrl('${item.linkTy}','${item.linkUrl}');">
								<c:forEach var="file" items="${item.mobileFileList}" varStatus="fileStatus">
									<div class="card waves-effect banner_card" style="background-image: url('/comm/getFile?srvcId=${file.srvcId}&upNo=${file.upNo}&fileTy=${file.fileTy}&fileNo=${file.fileNo}')">
										<div class="card-content">
											<div class="txt_area">
												<div class="font_sbms_2">${item.bannerNm}</div>
												<p class="color_t_s font_ssr marT4 line_clamp_1">
													${file.fileDc}
												</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</a>
						</div>
					</c:forEach>
				</div>
				<div class="swiper-pagination"></div>
			</div>

			<c:if test="${bbsList != null && bbsList.size() > 0}">
				
				<div class="h48"></div>

				<div class="font_shs">유용한 정보를 모았어요</div>

				<div class="h20"></div>

				<div class="box_list_area">
					<c:forEach var="itemOne" items="${bbsList}" varStatus="status">
						<a class="box_om_wel_list title" onclick="moveToGuide('${itemOne.nttNo}')">
							<div class="img_area">
								<img src="${itemOne.addValueText06}" alt="인정등급 발급 절차">
							</div>
							<div>
								<div class="font_sbms">
									${itemOne.addValueText04}
								</div>
								<div class="color_t_s font_sbsr marT4 ">${itemOne.addValueText05}</div>
							</div>
						</a>
					</c:forEach>
				</div>

				<div class="h48"></div>
			</c:if>

			<c:if test="${bbsNtcYnTop5 != null && bbsNtcYnTop5.size() > 0}">
				<div class="card notice w100p noShadow">
					<div class="card-content">
						<dl class="notice_dl">
							<dt>공지사항</dt>
							<dd class="swiper notice_Swiper">
								<div class="swiper-wrapper">
									<c:forEach var="resultOne" items="${bbsNtcYnTop5}" varStatus="status">
										<div class="swiper-slide">
											<span class="waves-effect bbs list" onclick="moveToNotice('${resultOne.nttNo}')">${resultOne.ttl}</span>
										</div>
									</c:forEach>
								</div>
							</dd>
						</dl>
					</div>
				</div>
			</c:if>

			<div class="h40"></div>

			<%-- 신규배너 추가 --%>
			<div class="award_swiper_area">
				<c:if test="${bannerMainBottomList != null && bannerMainBottomList.size() > 0}">
					<div class="swiper award_swiper">
						<div class="swiper-wrapper">
							<c:forEach var="item" items="${bannerMainBottomList}" varStatus="status">
								<div class="swiper-slide" onclick="clickOpenUrl('${item.linkTy}', '${item.linkUrl}')">
									<div class="d-flex align-items-center gap12">
										<c:forEach var="file" items="${item.mobileFileList}" varStatus="fileStatus">
											<img class="iconImg" src="/comm/getFile?srvcId=${file.srvcId}&upNo=${file.upNo}&fileTy=${file.fileTy}&fileNo=${file.fileNo}" alt="${item.bannerNm}">
										</c:forEach>

									</div>
								</div>
							</c:forEach>
						</div>
						<!-- swiper-wrapper -->
						<div class="swiper-prev">
							<img src="/html/page/app/matching/assets/src/images/18icon/chevron-right02_thin.svg" alt="arrow-prev">
						</div>
						<div class="swiper-next">
							<img src="/html/page/app/matching/assets/src/images/18icon/chevron-right02_thin.svg" alt="arrow-next">
						</div>
					</div>
				</c:if>
			</div>
		</section>
    </main>
	<!-- 하단 네이비게이션 -->
	<jsp:include page="/WEB-INF/jsp/app/matching/common/bottomNavigation.jsp">
		<jsp:param value="service" name="menuName" />
	</jsp:include>
</div>

<!-- 어르신 선택 모달 -->
<c:if test="${ _matMbrSession.loginCheck }">
	<div id="modal_om_select" class="modal bottom-sheet modal_om_select">
		<div class="modal_header">
			<h4 class="modal_title">어르신을 선택해주세요</h4>
			<div class="close_x modal-close waves-effect"></div>
		</div>
		<div class="modal-content">
			<div class="scrollBox heightAuto" style="max-height: 50vh;">
				<ul class="broad_area om_select">
					<c:forEach var="recipientInfo" items="${mbrRecipientsList}" varStatus="status">
						<li class="modal-close<c:if test="${ recipientInfo.mainYn eq 'Y' }"> active</c:if>" onclick="changeMainRecipient(Number('${recipientInfo.recipientsNo}'))">
							<div class="img_flower fl_0${status.index + 1}"></div>
							<span>${recipientInfo.recipientsNm}</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="h20"></div>
		</div>
	</div>
</c:if>

<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>
<script>
	var selectModalInterval = null;

	const recipients = new Proxy(
		{
			mainRecipientNo: null,
			info: createRecipientsInfoMap()
		},
		{
			get(target, prop) {
				if (prop === 'main') return target.info.get(target.mainRecipientNo);
				if (prop === 'size') return target.info.size;
				return target.get(prop);
			},
			set(target, prop, value) {
				if (prop === 'mainRecipientNo') {
					target.mainRecipientNo = target.info.has(value) ? value : null;
					const recipient = target.info.get(value);
					updateHeaderRecipientName(recipient ? recipient.name : '어르신');
					updateRequestCardVisibility(recipient ? recipient : null);
					return true;
				}
				return false;
			}
		}
	)

	function createRecipientsInfoMap() {
		const result = new Map();
		<c:forEach items="${mbrRecipientsList}" var="recipient">
			result.set(Number("${recipient.recipientsNo}"), {
				recipientNo: Number("${recipient.recipientsNo}"),
				name: "${recipient.recipientsNm}",
				isLongtermConfirmed: "${recipient.longtermConfirmYn}" === "Y",
				isLongtermSearched: "${recipient.longtermSearchedYn}" === "Y",
				hasCartItem: "${cartItemCnt.getRecipientCartItemCnt(recipient.recipientsNo) != null ? cartItemCnt.getRecipientCartItemCnt(recipient.recipientsNo) > 0 : false}" === 'true'
			});
		</c:forEach>
		return result;
	}

	function updateHeaderRecipientName(recipientNm) {
		$('.txtEvt').text(recipientNm);
	}

	function updateRequestCardVisibility(mainRecipient) {
		$('.card.marB32').hide();
		if (!mainRecipient) return;
		if (!mainRecipient.isLongtermConfirmed) $('#lnoRequestCard').show();
		else if (!mainRecipient.isLongtermSearched) $('#longtermSearchRequestCard').show();
		else if (mainRecipient.hasCartItem) {
			const $cartConfirmRequestCard = $('#cartConfirmRequestCard');
			$cartConfirmRequestCard.show();
			$cartConfirmRequestCard.click(function() {
				location.href = '/matching/shop/item/shopCartPop?recipientsNo=' + mainRecipient.recipientNo;
			});
		}
	}

	function dismissRequestCard(event) {
		$(event.target).closest('.card').slideUp(150);
		event.stopPropagation();
		event.preventDefault();
	}
	
	function moveToRcperRcognNoRegist() {
		location.href='/matching/membership/recipients/rcperRcognNoRegist?recipientsNo=' + recipients.main.recipientNo;
	}

	function moveToWelfareIntro() {
		if (!recipients.main) {
			location.href = '/matching/welfareinfo/using/intro';
			return;
		}
		location.href = '/matching/welfareinfo/using/intro?recipientsNo=' + recipients.main.recipientNo;
	}
	
	function moveToInterestIntro() {
		location.href = '/matching/welfareinfo/interest/intro';
	}
	
	function moveToSimpleTestIntro() {
		location.href = '/matching/simpletest/simple/intro';
	}

	function moveToCareIntro() {
		location.href = '/matching/simpletest/care/intro';
	}

	function moveToNotice(nttNo) {
		location.href = '/matching/bbs/ntce/view?nttNo=' + nttNo;
	}

	function moveToGuide(nttNo) {
		location.href = '/matching/bbs/guide/view?nttNo=' + nttNo;
	}
	
	function clickOpenUrl(linkTy, url) {
		if(linkTy === 'S'){
			sendDataToMobileApp({ actionName: 'callOpenUrl', url: url });
		} else if(linkTy === 'P'){
			window.location.href = url;
		}
	}

	function changeMainRecipient(recipientsNo) {
		if (!recipients.main || recipients.main.recipientNo === recipientsNo) return
		callPostAjaxIfFailOnlyMsg(
			'/matching/membership/recipients/update/main.json',
			{ recipientsNo, isMatching: 'Y' },
			function(result) {
				recipients.mainRecipientNo = recipientsNo;
				showToastMsg('어르신이 선택되었어요');
				
				if (selectModalInterval) {
					clearInterval(selectModalInterval);
					$('#modal_om_select').modal('close');
				}
			}
		);
	}

	$(function() {
		recipients.mainRecipientNo = Number("${mainRecipient.recipientsNo}");
		setupMainRecipientSelectModal();
		setupNoticeSwiper();
		setupAwardSwiper();

		showMainRecipientSelectModelIfNotSet();
		
		if(${isLongtermUpdated} === true){
			//요양정보조회 완료, 남은 장기요양급여 에어브릿지 전송
			fn_SendLongtermInfoCheckEventSuccess(${remainAmt}, '${mainRecipient.recipientsNo}', '${mainRecipient.mbrUniqueId}');
		}
	});

	function setupMainRecipientSelectModal() {
		const openEvt = function () {
			$('.top_dropdown_btn').addClass('active');
		};
		const closeEvt = function () {
			$('.top_dropdown_btn').removeClass('active');
		};
		$(".modal_om_select").modal({
			onOpenStart: openEvt,
			onCloseStart: closeEvt,
		});
	}
	
	function setupNoticeSwiper() {
		// Swipe 객체 생성은 스와이퍼 애니메이션 적용을 위해 필요함
		new Swiper(".notice_Swiper", {
			spaceBetween: 10,
			direction: "vertical",
			loop: true,
			centeredSlides: false,
			autoplay: {
				delay: 3000,
				disableOnInteraction: false,
			},
		});
	}

	function setupAwardSwiper() {
		<c:if test="${bannerMainBottomList == null || bannerMainBottomList.isEmpty()}">
			return;
		</c:if>
		//어워드 배너 DEDS-235 202411
		new Swiper(".award_swiper", {
			autoHeight: true,
			spaceBetween: 20,
			loop: true,
			autoplay: {
				delay: 5000,
				disableOnInteraction: false,
			},

			navigation: {
				nextEl: ".swiper-next",
				prevEl: ".swiper-prev",
			},
		});
	}

	function showMainRecipientSelectModelIfNotSet() {
		if (recipients.size >= 2 && !recipients.main) {
			selectModalInterval = setInterval(function() {
				$('#modal_om_select').modal('open');
			}, 1000);
		}
	}
</script>