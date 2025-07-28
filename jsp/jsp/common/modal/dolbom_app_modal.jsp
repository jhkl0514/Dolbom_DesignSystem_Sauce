<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

        <div class="modal modal-index fade" id="dbapp_modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="text-title">이로움돌봄</h2>
                        <button data-bs-dismiss="modal" class="btn-close">모달 닫기</button>
                    </div>
        
                    <div class="h32"></div>
        
                    <div class="modal_ctn">
                        앱으로 더 쉽고 편리하게 확인하세요
                    </div>
        
                    <div class="h16"></div>
        
                    <div class="link_area">
                        <div class="qr_code_area">
        
                        </div>
                        <div class="google_area">
                            <a target="_blank" href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom"
                                class="btn_google">
                                <img src="/html/page/index/assets/images/dbapp_qrcode/btn_google.svg" alt="">
                            </a>
                            <div class="form-group">
                                <input id="sendSmsPhone" type="text" class="form-control keycontrol phonenumber" placeholder="휴대폰 번호(-없이 입력)">
                            </div>
                        </div>
        
                    </div>
        
                    <div class="h32"></div>
        
                    <div class="form-check warning">
                        <input id="sendSmsAgree" class="form-check-input" type="checkbox" onchange="changeSendSmsAgree();">
                        <label class="form-check-label" for="sendSmsAgree">휴대폰 번호 수집 및 이용동의</label>
                    </div>
        
        
                    <div class="h16"></div>
        
                    <div class="box_area01">
                        <ul class="dept_1_1">
                            <li>수집하는 개인정보 항목: 휴대폰 번호</li>
                            <li>개인정보 수집 목적: 이로움돌봄 앱 다운로드 메시지 발송</li>
                            <li>개인정보 보유 기간: 수집 목적 달성 시 즉시 파기</li>
                        </ul>
        
                    </div>
        
                    <div class="h40"></div>
        
                    <div class="flex flex-col items-center items-end w-full gap-2">
                        <button id="sendSmsBtn" type="button" class="btn btn-primary2 disabled large w-50" onclick="sendAppLink();">동의하고 보내기</button>
                    </div>
        
                </div>
            </div>
        </div>
        
        <%-- 간단한 돌봄링크 모달 임시 사용 중단 --%>
        <%-- 
        <div class="modal modal-index fade" id="dbapp_modal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="text-title">이로움돌봄</h2>
                        <button data-bs-dismiss="modal" class="btn-close">모달 닫기</button>
                    </div>
        
                    <div class="h32" style="height: 1.25rem;"></div>
        
                    <div class="modal_ctn" style="font-size: 1rem;">
                        앱으로 더 쉽고 편리하게 확인하세요
                    </div>
        
                    <div class="h16"></div>
        
                    <div class="link_area">
                        <div class="qr_code_area">
        
                        </div>
                        <div class="google_area" style="justify-content: center;">
                            <a target="_blank" href="https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom"
                                class="btn_google">
                                <img src="/html/page/index/assets/images/dbapp_qrcode/btn_google.svg" alt="">
                            </a>
                        </div>
        
                    </div>
                </div>
            </div>
        </div>
        --%>


	<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
    <script>
    	var telchk = /^([0-9]{2,3})?-([0-9]{3,4})?-([0-9]{3,4})$/;      //전화번호 정규식
    
    	function changeSendSmsAgree() {
    		if (!$('#sendSmsAgree').is(':checked')) {
    			$('#sendSmsBtn').addClass('disabled');
    		} else {
    			$('#sendSmsBtn').removeClass('disabled');	
    		}
    	}
    	
    	function sendAppLink() {
    		//유효성 검사
    		if ($('#sendSmsAgree').is(':checked') === false) {
    			alert('휴대폰 번호 수집 및 이용동의를 확인해주세요');
    			return;
    		}
    		
    		var phone = $('#sendSmsPhone').val();
    		if (!phone) {
    			alert('휴대폰 번호를 확인해주세요');
    			return;
    		}
    		if (!telchk.test(phone)) {
    			alert('휴대폰 번호를 확인해주세요');
    			return;
    		}
    		
    		
    		callPostAjaxIfFailOnlyMsg(
   				'/main/dolbom/send/link',
   				{phone},
   				function() {
   					alert('문자가 발송되었어요');
   					$('#dbapp_modal .btn-close').trigger('click');
   				}
			);
    	}
    	
    	//모바일 환경인 경우 바로 마켓으로 이동
    	var isMobile = /Mobi/i.test(window.navigator.userAgent);
    	function checkMobile() {
    		if (isMobile) {
    			setTimeout(function() {
    				$('#dbapp_modal .btn-close').trigger('click');
    			}, 1000);
    			location.href = 'https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom';
    		}
    	}
    	
    	$(function() {
    		$('a[data-bs-target="#dbapp_modal"]').on('click', function() {
    			checkMobile();
    		});
    	});
    </script>
