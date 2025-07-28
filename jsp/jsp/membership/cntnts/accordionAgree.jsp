<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

				<input type="hidden" id="termsDt" name="termsDt" value="<fmt:formatDate value="${mbrAgreementVO.termsDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" id="privacyDt" name="privacyDt" value="<fmt:formatDate value="${mbrAgreementVO.privacyDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" id="marketingReceptionDt" name="marketingReceptionDt" value="<fmt:formatDate value="${mbrAgreementVO.marketingReceptionDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				<input type="hidden" id="nightReceptionDt" name="nightReceptionDt" value="<fmt:formatDate value="${mbrAgreementVO.nightReceptionDt}" pattern="yyyy-MM-dd HH:mm:ss" />" />
				
				<div class="content-accordion" id="accordionAgree">
					<div class="accordion-item">
						<div class="accordion-header">
							<div class="form-check">
								<input class="form-check-input agree-check" type="checkbox" id="termsYn" name="termsYn" value="Y">
								<label class="form-check-label" for="termsYn">
									통합 서비스 이용약관 (필수)
								</label>
							</div>
							<button class="accordion-button" type="button" data-bs-target="#collapse-agree1" data-bs-toggle="collapse" aria-expanded="false">펼치기/접기</button>
						</div>
						<div id="collapse-agree1" class="accordion-collapse collapse" data-bs-parent="#accordionAgree">
	                        <div class="accordion-body py-3.5 px-4">
								${termsTerms}
	                        </div>
						</div>
					</div>
					<div class="accordion-item">
						<div class="accordion-header">
							<div class="form-check">
								<input class="form-check-input agree-check" type="checkbox" id="privacyYn" name="privacyYn" value="Y">
								<label class="form-check-label" for="privacyYn">
									개인정보 수집 이용 동의 (필수)
								</label>
							</div>
							<button class="accordion-button" type="button" data-bs-target="#collapse-agree2" data-bs-toggle="collapse" aria-expanded="false">펼치기/접기</button>
						</div>
						<div id="collapse-agree2" class="accordion-collapse collapse" data-bs-parent="#accordionAgree">
	                        <div class="accordion-body py-3.5 px-4">
	                            ${termsPrivacy}
	                        </div>
						</div>
					</div>
					<div class="accordion-item">
						<div class="accordion-header">
							<div class="form-check">
								<input class="form-check-input agree-check" type="checkbox" id="marketingReceptionYn" name="marketingReceptionYn" value="Y">
								<label class="form-check-label" for="marketingReceptionYn">
									이벤트 및 마케팅 정보 수신 동의 (선택)
								</label>
							</div>
							<button class="accordion-button" type="button" data-bs-target="#collapse-agree3" data-bs-toggle="collapse" aria-expanded="false">펼치기/접기</button>
						</div>
						<div id="collapse-agree3" class="accordion-collapse collapse" data-bs-parent="#accordionAgree">
	                        <div class="accordion-body py-3.5 px-4">
	                            ${marketingReception}
	                        </div>
						</div>
					</div>
					<div class="accordion-item">
						<div class="accordion-header">
							<div class="form-check">
								<input class="form-check-input agree-check" type="checkbox" id="nightReceptionYn" name="nightReceptionYn" value="Y">
								<label class="form-check-label" for="nightReceptionYn">
									야간 혜택 수신 동의 (선택)
								</label>
							</div>
							<button class="accordion-button" type="button" data-bs-target="#collapse-agree4" data-bs-toggle="collapse" aria-expanded="false">펼치기/접기</button>
						</div>
						<div id="collapse-agree4" class="accordion-collapse collapse" data-bs-parent="#accordionAgree">
	                        <div class="accordion-body py-3.5 px-4">
	                            ${nightReception}
	                        </div>
						</div>
					</div>

				</div>
				
				<script>
					$(function() {
						function dateFormat(date) {
					        let month = date.getMonth() + 1;
					        let day = date.getDate();
					        let hour = date.getHours();
					        let minute = date.getMinutes();
					        let second = date.getSeconds();

					        month = month >= 10 ? month : '0' + month;
					        day = day >= 10 ? day : '0' + day;
					        hour = hour >= 10 ? hour : '0' + hour;
					        minute = minute >= 10 ? minute : '0' + minute;
					        second = second >= 10 ? second : '0' + second;

					        return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
						}
						
						// 전체 약관 동의
						$("#check-all").on("click",function(){
							if(!$("#check-all").is(":checked")){
								$("#termsYn, #privacyYn, #marketingReceptionYn, #nightReceptionYn").prop("checked",false);
							}else{
								$("#termsYn, #privacyYn, #marketingReceptionYn, #nightReceptionYn").prop("checked",true);
							}
							
							$('#termsDt').attr('value', dateFormat(new Date()));
							$('#privacyDt').attr('value', dateFormat(new Date()));
							$('#marketingReceptionDt').attr('value', dateFormat(new Date()));
							$('#nightReceptionDt').attr('value', dateFormat(new Date()));
						});
						
						$(".agree-check").on("click",function(){
							if(!$(this).is(":checked")){
								$("#check-all").prop("checked",false);
							}else{
								if($(".agree-check:checked").length == 4){
									$("#check-all").prop("checked",true);
								}
							}
							
							var inputName = $(this).attr('name');
							$('#' + inputName.replace('Yn', '') + 'Dt').attr('value', dateFormat(new Date()));
						});
					});
				</script>
