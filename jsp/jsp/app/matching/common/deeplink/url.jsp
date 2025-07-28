<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--
<a id="aTagDeeplink" href="intent://home?type=uri&uri=${uri}
#Intent;
	scheme=eroumdolbom;
	action=android.intent.action.VIEW;
	category=android.intent.category.BROWSABLE;
	package=kr.co.eroum.dolbom;
end;">
딥링크
</a>
--%>


<script>
	$(function() {
        airbridge.openDeeplink({
            type: "redirect",
            deeplinks: {
                android: "eroumdolbom://home?type=uri&uri=${uri}",
                ios: "https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom",
                desktop: "https://play.google.com/store/apps/details?id=kr.co.eroum.dolbom"
            },
            fallbacks: {
                android: "google-play"
            },
        });
	});
</script>