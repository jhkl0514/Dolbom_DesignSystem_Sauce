<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script src="/html/page/membership/cntnts/assets/script/JsHouseMembershipTermsView.js?v=<spring:eval expression="@version['assets.version']"/>"></script>
<script>
	var ctlMaster;
	$(document).ready(function(){
		ctlMaster = new JsHouseMembershipTermsView();
		ctlMaster.fn_page_kind("terms");
		ctlMaster.fn_page_init();
	});
</script>

<main id="container">
    <header id="page-title">
        <h2>
            <span>이용약관</span>
        </h2>
    </header>
    
	<div id="page-content" class="layout page-content">
	    <div class="flex justify-end mb-2">
			<select name="" id="prevList" class="form-control form-small">
				<option value="${listHistoryVO[0].termsNo}">이전 버전 보기</option>

				<c:forEach items="${listHistoryVO}" var="iem"  varStatus="status">
				<option value="${iem.termsNo}">${iem.termsDt}</option>
				</c:forEach>
				
			</select>
		</div>
		<div class="terms contents">
			<div class="text-sm md:text-base">
				${termContent}
			</div>
			
		</div>

	</div>
</main>