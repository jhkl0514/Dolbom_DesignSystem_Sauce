<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/html/page/admin/assets/style/new_modal.css?v=<spring:eval expression="@version['assets.version']"/>"/>

    <div class="modal fade" id="simple-test-result" tabindex="-1">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <p>수급자 상담정보 상세</p>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="close"></button>
                </div>
                <div class="modal-body">
                    <iframe  src="/matching/outservice/simpletest?prevPath=${mbrConsltVO.prevPath}&recipientsNo=${mbrConsltVO.recipientsNo}&source=eroumon"
                         onload="fn_load_simpletest_result(event, this)"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary btn-large" onclick="$(this).closest('.modal').find('.modal-header .btn-close').click()">
                        확인
                    </button>
                </div>
           </div>
        </div>
	</div>
    <script>
        function fn_load_simpletest_result(e, element){
            var objContent = (e.currentTarget.contentDocument.body||e.currentTarget.contentDocument).children[0];

            $("#simple-test-result .modal-body").html(objContent.outerHTML);
        }
    </script>