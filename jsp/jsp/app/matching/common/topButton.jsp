<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<header>
      <nav class="top">
       <a class="btn_back waves-effect" onclick="backBtnEvent();">
         <c:if test="${param == null || empty param.noBackButtion}">
          <span class="icon"></span>
         </c:if>

         
         <c:if test="${param != null && !empty param.addTitle}">
          <span class="txt">${param.addTitle}</span>
         </c:if>
         
       </a>
       
       <div class="d-flex">
	       <c:if test="${param != null && !empty param.addHome}">
	       	 <div class="icon_area waves-effect">
	         	<div class="icon_btn i_home" onclick="location.href='/matching/main/service';"></div>
	         </div>
	       </c:if>
	       <c:if test="${param != null && !empty param.addButton}">
	         <a class="waves-effect top_txt" href="#">${param.addButton}</a>
	       </c:if>
	       <c:if test="${param != null && !empty param.addShare}">
	         <div class="icon_area waves-effect">
	         	<div class="icon_btn i_share" onclick="$('#modal_share').modal('open');"></div>
	         </div>
	       </c:if>
	       <c:if test="${param != null && !empty param.addCustom1}">
	        <c:if test="${param != null && !empty param.addCustom1ModalTrigger}">
	          <a class="top_txt modal-trigger ${param.addCustom1CssClass}" data-target="${param.addCustom1ModalTrigger}">${param.addCustom1Text}</a>
	        </c:if>
	        <c:if test="${param != null && empty param.addCustom1ModalTrigger}">
	          <a class="waves-effect top_txt addCustom1 ${param.addCustom1CssClass}">${param.addCustom1Text}</a> 
	        </c:if>
	       </c:if>
	       <c:if test="${param != null && !empty param.addSetting}">
	         <div class="icon_area waves-effect">
	             <div class="icon_btn i_setting" onclick="location.href='/matching/membership/info/setting';"></div>
	         </div>
	       </c:if>
       </div>
     </nav>
   </header>
   
   <!-- 공유하기 바텀시트 추가 -->
   <c:if test="${param != null && !empty param.addShare}">
	   <jsp:include page="/WEB-INF/jsp/app/matching/main/share/bottomSheet.jsp">
			<jsp:param value="공유하기" name="title" />
		</jsp:include>
	</c:if>
   
   
	<script>
		<c:if test="${param != null && !empty param.noBackButtion}">
			$(function() {
				backBtnEvent = function() {}
			})
		</c:if>
	</script>
   