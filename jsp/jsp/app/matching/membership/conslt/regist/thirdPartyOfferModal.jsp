<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div id="modal_third_party_offer" class="modal fullscreen hidden">
    <div class="modal_header">
        <h4 class="modal_title">개인정보 3자제공 동의</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content pad20 no_footer">
        <a class="input_basic fake_select bder_valid modal-trigger evt_history" href="#modal_history">이전 버전 보기</a>
        <div class="h16"></div>
        <div class="history_area">
        </div>
    </div>
</div>

<!-- modal_history -->
<div id="modal_history" class="modal bottom-sheet">
    <div class="modal_header">
        <h4 class="modal_title">이전 버전 보기</h4>
        <div class="close_x modal-close waves-effect"></div>
    </div>
    <div class="modal-content">
        <ul class="broad_area">
        </ul>
        <div class="h32"></div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/app/matching/common/modal/staticResourceModal.jsp" />

<script>
    let termsHisList;
    let activeTermsNo;

    $(function () {
        setupTermsModalOpen();
    })

    function setupTermsModalOpen() {
        $('#modal_third_party_offer').modal({
            onOpenStart: function () {
                if (termsHisList) return;
                $.ajax(
                    '/matching/membership/conslt/terms.json',
                    {
                        method: 'GET',
                        success: function (result) {
                            termsHisList = result.data;
                            drawTermsHisList();
                            $("#modal_third_party_offer .history_area").html(result.data[0].contentBody);
                            $("#modal_history .broad_area li").first().addClass("active");
                        }
                    }
                )
            }
        });
    }

    function drawTermsHisList() {
        termsHisList.forEach(terms => {
            $("#modal_history .broad_area").append(createTermsHisList(terms));
        });
    }

    function createTermsHisList(terms) {
        return `<li class="modal-close" data-terms-no="\${terms.termsNo}" onclick="selectTerms(\${terms.termsNo})">\${terms.termsDt}</li>`
    }

    function selectTerms(termsNo) {
        activeTermsNo = termsNo;
        $("#modal_third_party_offer .history_area").html(termsHisList.find(item => item.termsNo === termsNo).contentBody);
        $("#modal_history .broad_area li").removeClass("active");
        $("#modal_history .broad_area li[data-terms-no='" + termsNo + "']").addClass("active");
        $("#modal_third_party_offer .evt_history").text(termsHisList.find(item => item.termsNo === termsNo).termsDt);
    }
</script>
