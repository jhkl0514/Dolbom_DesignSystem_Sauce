<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/app/matching/common/appCommon.jsp" />

<script>
$(async function() {
	var appTitle = '${appTitle}';
	var appBtn = '${appBtn}';
	var appMsg = '${appMsg}';
	var appLocation = '${appLocation}';
	if (appMsg) {
		var answer = await showConfirmPopup(appTitle, appMsg, appBtn);
		
		if (answer == 'confirm') {
			location.href = appLocation;
		}else{
			var history = popHistoryStack(-1);
	  		if (history) {
	  			location.href = history;
	  		} else {
	  			//이력이 없는 경우 메인으로 이동
	  			location.href = '/matching';
	  		}
		}
		
	}
});
</script>