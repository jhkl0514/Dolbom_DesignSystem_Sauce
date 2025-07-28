<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/html/core/vendor/swiperjs/swiper-bundle.min.css" />
<script src="/html/core/vendor/swiperjs/swiper-bundle.min.js"></script>

<style>
</style>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function () {
    const modals = document.querySelectorAll('.modal');
    M.Modal.init(modals);
});
</script>

<div id="modal_orderMemo" class="modal bottom-sheet">
	<div class="modal_header">
	    <h4 class="modal_title">${param.memoTitle}</h4>
	    <div class="close_x modal-close waves-effect"></div>
	</div>
	<div class="modal-content">
		<div class="color_t_s font_sbmr">
		   ${param.memoTxt}
		</div>
	    <div class="h32"></div>
	</div>
	<div class="modal-footer">
		<div class="btn_area d-flex">
			<a class="modal-close waves-effect btn btn-large w100p btn_primary">확인</a>
		</div>
	</div>
</div>
