<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<style>
		.login-tooltip {
			position: absolute;
			background-color: #fff;
			color: #000;
			width: 80px;
			text-align: center;
			padding: 3px;
			border-radius: 5px;
			font-size: 13px;
		}
		.login-tooltip::after {
			content: '';
			position: absolute;
			background-color: #fff;
			width: 7px;
			height: 7px;
			transform: rotate(45deg) translateX(-50%);
			left: 0;
			top: 13px;
		}
		
		.eroum-login-tooltip {
			left: 420px;
    		top: 12px;
		}
		.sns-login-tooltip {
			left: 290px;
			top: 14px;
		}
		@media (max-width: 768px) {
		  .sns-login-tooltip {
		  	left: 290px;
			top: 14px;
		  }
		}
		@media (max-width: 576px) {
		  .eroum-login-tooltip {
			left: 300px;
    		top: 200px;
		  }
		  .sns-login-tooltip {
		  	left: 360px;
			top: 14px;
		  }
		}
		@media (max-width: 510px) {
		  .sns-login-tooltip {
		  	left: 320px;
			top: 14px;
		  }
		}
		@media (max-width: 460px) {
		  .eroum-login-tooltip {
			left: 250px;
    		top: 200px;
		  }
		  .sns-login-tooltip {
		  	left: 280px;
			top: 14px;
		  }
		}
		@media (max-width: 420px) {
		  .sns-login-tooltip {
		  	left: 260px;
			top: 14px;
		  }
		}
	</style>

	<%-- 로그인 --%>
    <main id="container">
        <header id="page-title">
            <h2>
                <span>로그인</span>
                <small>Login</small>
            </h2>
        </header>

        <div id="page-content">
            <form action="/membership/loginAction" method="post" id="loginFrm" name="loginFrm" class="login_form login_integrate">
	            <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus}">
				<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent}">
				<input type="hidden" id="encPw" name="encPw" value="">
                <fieldset>

					<div class="login_ctn_txt">하나의 아이디로 이로움ON 통합 서비스를 이용할 수 있습니다.</div>

                    <div class="h24"></div>

					<label class="text-gray5">아이디</label>
                    <input type="text" class="form-control w100p marT08" id="mbrId" name="mbrId">
                    <!-- <div id="loginId-error" class="text-danger">! 아이디를 입력해 주세요.</div> -->

                    <div class="h24"></div>

                    <label class="text-gray5">비밀번호</label>
                    <input type="password" class="form-control w100p marT08" id="mbrPw" name="mbrPw">
					<!-- <div id="loginId-error" class="text-danger">! 비밀번호를 입력해 주세요.</div> -->

                    <div class="h24"></div>

					<div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="saveId" name="saveId" value="Y">
                        <label class="form-check-label" for="saveId">아이디 저장</label>
                    </div>


                    <div class="h24"></div>
					<div class="relative">
						<c:if test="${ recentLgnTy eq 'E' }">
							<span class="tool_tip">최근로그인</span>
						</c:if>
						<button class="btn_2 btn_primary_total w100p form-submit" type="submit">로그인</button>
					</div>
					



                    <div class="h24"></div>

                    <ul class="login_sh_area">
                        <li><a href="${_membershipPath}/srchId">아이디 찾기</a></li >
                        <li><a href="${_membershipPath}/srchId?#tab-search2">비밀번호 찾기</a></li>
                        <li><a href="${_membershipPath}/regist">회원가입</a></li>
                    </ul>

                    <div class="h56"></div>

					<div class="relative">
						<c:if test="${ recentLgnTy eq 'K' }">
	                    	<span class="tool_tip">최근로그인</span>
	                    </c:if>
						<a href="${_membershipPath}/kakao/auth" class="w-full btn btn-kakao">카카오 로그인</a>
					</div>
                    
                    
                    <div class="h12"></div>

                    <div class="relative">
						<c:if test="${ recentLgnTy eq 'N' }">
	                    	<span class="tool_tip">최근로그인</span>
	                    </c:if>
                        <a href="${_membershipPath}/naver/get" class="w-full btn btn-naver">네이버 로그인</a>
                    </div>


                    
                </fieldset>
            </form>

            <!-- <div style="text-align: center;">
            	<a href="<c:choose><c:when test="${returnUrl eq '/test/physical'}">/main/cntnts/test</c:when> <c:when test="${!empty returnUrl}">${returnUrl}</c:when> <c:otherwise>/</c:otherwise></c:choose>" 
            	   class="btn btn-large" 
            	   style="margin-top: 50px;width: 270px;height: 60px;">취소
            	</a>
            </div> -->
        </div>
    </main>
    <script src="/html/core/vendor/rsa/RSA.min.js" /></script>
 	<script>
    $(function(){
    	const f_rsa_enc = function(v, rpkm, rpke) {
			let rsa = new RSAKey();
			rsa.setPublic(rpkm,rpke);
			return rsa.encrypt(v);
		}

    	$('#loginFrm')
	    	.submit(function(e){e.preventDefault();})
			.validate({
				onkeyup: false,
	            rules: {
	            	mbrId: { required: true }
	                , mbrPw: { required: true }
	            },
	            messages : {
	            	mbrId : {required : "! 아이디를 입력해 주세요."}
	            	, mbrPw : {required : "! 비밀번호를 입력해 주세요."}
				},
		  	    onfocusout: function(el) { // 추가
	                if (!this.checkable(el)){this.element(el); }
	            },
	    	    errorPlacement: function(error, element) {
	    		    var group = element.closest('.search-group');
	    		    if (group.length) {
	    		        group.after(error.addClass('text-danger'));
	    		    } else {
	    		        element.after(error.addClass('text-danger'));
	    		    }
	    		},
			    submitHandler: function (frm) {
					var rsaPublicKeyModulus = document.getElementById("rsaPublicKeyModulus").value;
				    var rsaPublicKeyExponent = document.getElementById("rsaPublicKeyExponent").value;
				    var encPassword = f_rsa_enc(document.getElementById("mbrPw").value, rsaPublicKeyModulus, rsaPublicKeyExponent);

					$('<form>', {
						'action': 'loginAction',
						'method': 'post'
					}).append($('<input>',{
						'name': 'mbrId',
						'value': frm.mbrId.value,
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'encPw',
						'value': encPassword,
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'saveId',
						'value': frm.saveId.checked ? "Y" : "N",
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'returnUrl',
						'value': '${returnUrl}',
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'loginRedirectUrl',
						'value': '${loginRedirectUrl}',
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'loginRedirectMethod',
						'value': '${loginRedirectMethod}',
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'loginRedirectParam',
						'value': '${loginRedirectParam}',
						'type': 'hidden'
					})).append($('<input>',{
						'name': 'loginRedirectDoubleSubmit',
						'value': '${loginRedirectDoubleSubmit}',
						'type': 'hidden'
					})).appendTo('body').submit();
					return false;
			    }
	        });

		<c:if test="${!empty saveId}">
			$("#mbrId").val("${saveId}");
			$("#saveId").prop("checked", true);
		</c:if>

    });
    </script>