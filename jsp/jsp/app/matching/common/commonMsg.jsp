<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
$(async function() {
	var appMsg = '${commonMsgVO.getMessage()}';
	var appLocation = '${commonMsgVO.getLocation()}';
	if (appMsg) {
		await showAlertPopup(appMsg);
	}

	if (appLocation) {
		// location.href = appLocation;

        setTimeout(function() {
            location.href = appLocation; 
        }, 10);
    }
	
});
</script>