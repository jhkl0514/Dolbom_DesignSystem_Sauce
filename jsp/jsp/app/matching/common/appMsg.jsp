<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/WEB-INF/jsp/app/matching/common/appCommon.jsp" />

<script>
$(async function() {
    const title = '${title}';
	const appMsg = '${appMsg}';
	const appLocation = '${appLocation}';
	if (title || appMsg) await showAlertPopup2(title, appMsg);
    
    if (appLocation) {
        location.href = appLocation;
    } else {
        backBtnEvent();
    }
});
</script>