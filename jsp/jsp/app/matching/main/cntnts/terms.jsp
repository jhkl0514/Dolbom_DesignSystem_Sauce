<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

	<script src="/html/core/vendor/jquery/jquery-3.6.0.min.js"></script>

	<!-- style.css -->
    <link rel="stylesheet" href="/html/page/index/assets/style/style.min.css">
</head>
<body>
	${termsVO.contentBody}
</body>
</html>

<script>
	$(document).ready(function() {
		$(document).on('click', '[data-static-resource-url]', function(e) {
			e.preventDefault();
			const staticResourceUrl = $(this).data('static-resource-url');
			// 부모 페이지로 메시지 전달
			window.parent.postMessage({
				type: 'openStaticResourceModal',
				staticResourceUrl: staticResourceUrl
			}, '*');
		})
	});
</script>
