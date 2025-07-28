<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
	
    <!-- 상단 뒤로가기 버튼 추가 -->
    <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
        <jsp:param value="" name="addButton" />
        <jsp:param value="이로움ON" name="addTitle" />
    </jsp:include>

    
    <main>
        
    </main>

</div>

<script>
	(function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.")}var ch=function(){ch.c(arguments)};ch.q=[];ch.c=function(args){ch.q.push(args)};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x)}}if(document.readyState==="complete"){l()}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l)}})();
	
	ChannelIO('boot', {
	  "pluginKey": "${talkPluginKey}"
	  , "hideChannelButtonOnBoot": true
	  <c:if test="${!empty customProfileVO}">
		, "memberId": "${customProfileVO.memberId}"
		, "memberHash": "${customProfileVO.memberHash}"
		, "unsubscribeTexting" : ${customProfileVO.unsubscribeTexting}
		, "unsubscribeEmail" : ${customProfileVO.unsubscribeEmail}
		
	    ,"profile": {
	      "name": "${customProfileVO.mbrNm}"
	      , "mobileNumber": "${customProfileVO.mblTelno}"
	      , "email": "${customProfileVO.eml}"
	      , "mbrConsltCnt" : ${customProfileVO.mbrConsltCnt}
	      , "registerRecipient" : ${customProfileVO.registerRecipient}
	      , "existTestResult": "${customProfileVO.existTestResult}"
	   	  , "existLNumber": "${customProfileVO.existLNumber}"
	   	  , "existConslt": "${customProfileVO.existConslt}"
	   	  , "coupon": ${customProfileVO.coupon}
	    }
	  </c:if>
	});
	
	ChannelIO('showMessenger');
	
	ChannelIO('onHideMessenger', function () {
		backBtnEvent()
	});
</script>