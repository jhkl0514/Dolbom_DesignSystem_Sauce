<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<main id="container">
	<header id="page-title" style="margin-bottom:0px;">
		<h2>
			<span>
				<c:choose>
					<c:when test="${tempMbrVO.joinTy eq 'E'}">
						회원가입
					</c:when>
					<c:otherwise>
						간편 회원가입
					</c:otherwise>
				</c:choose>
			</span>
			<small>Member Join</small>
		</h2>
	</header>

	<div id="page-content">
		<div class="member-join">
			<form class="member-join-content mb-13" style="border:none;">
				<div style="margin-bottom:40px; text-align:center;">
					<div style="margin-bottom:10px; font-size: 1.5rem; font-weight:bold;">
						이미 가입된 계정이 있어요
					</div>
					<div style="font-size: 1.2rem;">
						<c:choose>
							<c:when test="${isContainNoEmlKakao}">
								로그인하여 본인인증(최초 1회)을 진행해 주세요
							</c:when>
							<c:when test="${isContainNoEmlNaver}">
								로그인하여 본인인증(최초 1회)을 진행해 주세요
							</c:when>
							<c:when test="${tempMbrVO.joinTy eq 'E'}">
								이로움ON 아이디를 만들어 연결할 수 있어요
							</c:when>
							<c:when test="${tempMbrVO.joinTy eq 'K'}">
								카카오 계정도 추가로 연결할 수 있어요
							</c:when>
							<c:when test="${tempMbrVO.joinTy eq 'N'}">
								네이버 계정도 추가로 연결할 수 있어요
							</c:when>
						</c:choose>
					</div>
				</div>
			
				<dl class="content-auth">
					<dt>계정 정보</dt>
				</dl>
				<table class="table-detail">
					<colgroup>
						<col class="w-29 xs:w-32">
						<col>
					</colgroup>
					<tbody>
						<tr class="top-border">
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
	
				<div class="mt-4 content-auth-phone" style="display:block;">
					<c:if test="${ !empty eroumAuthInfo }">
						<div class="flex w-full mb-4">
							<img style="flex:1 1 0; border-radius:100%; width:40px; max-width:40px; height:40px;" src="/html/core/images/ico-eroum2.png">
							<div style="flex:5 5 0; line-height:40px;">이로움ON <span style="color:gray; opacity:0.6;">&nbsp;|&nbsp;</span> ${eroumAuthInfo.mbrId}</div>
							<a style="flex:1 1 0; width:100px; max-width:100px; height:40px;" href="/membership/login" class="btn btn-outline-primary">로그인</a>
						</div>
					</c:if>

					<c:if test="${ !empty kakaoAuthInfo }">
						<div class="flex w-full mb-4">
							<img style="flex:1 1 0; border-radius:100%; width:40px; max-width:40px; height:40px;" src="/html/core/images/ico-kakao.png">
							<div style="flex:5 5 0; line-height:40px;">
								카카오 
								<span style="color:gray; opacity:0.6;">&nbsp;|&nbsp;</span> 
								${isContainNoEmlKakao ? '본인인증 필요' : (!empty kakaoAuthInfo.eml ? kakaoAuthInfo.eml : kakaoAuthInfo.mblTelno) }
							</div>
							<a style="flex:1 1 0; width:100px; max-width:100px; height:40px;" href="/membership/kakao/auth" class="btn btn-outline-primary">로그인</a>
						</div>
					</c:if>
					
					<c:if test="${ !empty naverAuthInfo }">
						<div class="flex w-full mb-4">
							<img style="flex:1 1 0; border-radius:100%; width:40px; max-width:40px; height:40px;" src="/html/core/images/ico-naver.png">
							<div style="flex:5 5 0; line-height:40px;">
								네이버 
								<span style="color:gray; opacity:0.6;">&nbsp;|&nbsp;</span> 
								${isContainNoEmlNaver ? '본인인증 필요' : naverAuthInfo.eml}
							</div>
							<a style="flex:1 1 0; width:100px; max-width:100px; height:40px;" href="/membership/naver/get" class="btn btn-outline-primary">로그인</a>
						</div>
					</c:if>
				</div>
	
				<div class="content-button mt-9" style="flex-direction: column;">
					<c:choose>
						<c:when test="${isContainNoEmlKakao}">
							<div style="border: 1px solid #EEEEEE;border-radius: 10px;background: #EEEEEE;text-align: center;font-size: 14px;padding: 15px 0px;font-weight: 500;">
								이로움ON 회원정책 변경으로 인해 기존에 가입한 계정의 본인인증이 필요합니다.
							</div>
						</c:when>
						<c:when test="${isContainNoEmlNaver}">
							<div style="border: 1px solid #EEEEEE;border-radius: 10px;background: #EEEEEE;text-align: center;font-size: 14px;padding: 15px 0px;font-weight: 500;">
								이로움ON 회원정책 변경으로 인해 기존에 가입한 계정의 본인인증이 필요합니다.
							</div>
						</c:when>
						<c:when test="${tempMbrVO.joinTy eq 'E'}">
							<a class="w-full btn btn-eroum" onclick="bindMbrEroum();">
				                <span style="width:200px">이로움ON 아이디 만들기</span>
				            </a>
						</c:when>
						<c:when test="${tempMbrVO.joinTy eq 'K'}">
							<a class="w-full btn btn-kakao" onclick="bindMbrSns();">
		                    	<span style="width:200px">카카오 계정 연결하기</span>
		                    </a>
						</c:when>
						<c:when test="${tempMbrVO.joinTy eq 'N'}">
							<a class="w-full btn btn-naver" onclick="bindMbrSns();">
		                    	<span style="width:200px">네이버 계정 연결하기</span>
		                    </a>
						</c:when>
					</c:choose>
				</div>
			</form>
		</div>
	</div>

</main>

	<!-- 이로움온 회원 인증정보 저장 모달(아이디, 패스워드) -->
	<jsp:include page="/WEB-INF/jsp/common/modal/add_eroum_auth_modal.jsp" />


<script src="/html/core/script/matchingAjaxCallApi.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
<script>
	function bindMbrSns() {
		callPostAjaxIfFailOnlyMsg(
			'/membership/sns/binding.json',
			{},
			function(result) {
				location.href = '/';					
			}
		);
	}
	
	function bindMbrEroum() {
		openRegistEroumAuthModal(true);
	}
</script>