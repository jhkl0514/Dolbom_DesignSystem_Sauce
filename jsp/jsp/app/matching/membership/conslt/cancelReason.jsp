<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="wrapper">
  <jsp:include page="/WEB-INF/jsp/app/matching/common/topButton.jsp">
    <jsp:param value="상담취소" name="addTitle" />
  </jsp:include>

  <main>
    <section class="intro">
      <h3 class="title">
        상담 신청에서<br>
        아쉬웠던 점이 있나요?<br>
        취소하는 이유를 알려주세요.
      </h3>

      <div class="h40"></div>

      <div class="rd_area">

        <input type="radio" id="chk_cancel_01" class="chk01_2 large" name="cancelReason">
        <label for="chk_cancel_01">알고있던 장기요양기관에 요청할게요.</label>

        <input type="radio" id="chk_cancel_02" class="chk01_2 large" name="cancelReason">
        <label for="chk_cancel_02">만 65세 미만이고 노인성질병이 없어서 대상자가 아니에요.</label>

        <input type="radio" id="chk_cancel_03" class="chk01_2 large" name="cancelReason">
        <label for="chk_cancel_03">다른 유형의 상담을 신청할게요.</label>

        <input type="radio" id="chk_cancel_04" class="chk01_2 large evtRadio_etc" name="cancelReason">
        <label for="chk_cancel_04">기타</label>

      </div>

      <div class="h20"></div>

      <br>

      <div class="evtTextarea_etc">
        <div class="relative">
                    <textarea
                            id="cancelReasonTextArea"
                            rows="3"
                            class="input_basic textBox"
                            required="required"
                            placeholder="취소 사유를 입력해주세요"
                            maxlength="20"
                            style="height:110px !important;"
                    ></textarea>
          <div class="textLengthWrap">
            <span class="textCount">0</span>
            <span class="textTotal">/20</span>
          </div>
        </div>
        <div id="cancelReasonWarning" class="vaild_txt error" style="display: none;">취소사유를 입력해주세요</div>
      </div>
    </section>
  </main>

  <footer class="page-footer">
    <div class="d-flex gap08">
      <a class="modal-close waves-effect btn btn-large w100p btn_cancel" onclick="backBtnEvent()">상담유지</a>
      <a id="cancelBtn" class="modal-close waves-effect btn btn-large w100p btn_primary disabled" onclick="handleCancelBtnClick()">상담취소</a>
    </div>
  </footer>
</div>

<script>
  const KEY_LAST_CANCELED_CONSLT_NO = 'KEY_LAST_CANCELED_CONSLT_NO';

  function handleCancelBtnClick() {
    const consltNo = '${param.consltNo}';
    const canclResn = getFinalCanclResn();
    if (!canclResn) {
      showReasonEmptyWarning();
      return;
    }
    callPostAjaxIfFailOnlyMsg(
            '/matching/membership/conslt/canclConslt.json',
            {consltNo, canclResn},
            function() {
              saveInLocalStorage(KEY_LAST_CANCELED_CONSLT_NO, consltNo);
              location.href = popHistoryStack(-1);
            }
    );
  }

  function getFinalCanclResn() {
    var canclResn = getCheckedCanclResn();
    if (!canclResn) return;
    if (canclResn == '기타') canclResn = $('#cancelReasonTextArea').val();
    return canclResn;
  }

  function showReasonEmptyWarning() {
    $('#cancelReasonTextArea').addClass('bder_danger');
    $('#cancelReasonWarning').show();
  }

  $(document).ready(function() {
    setupReasonRadioBtns();
    setupReasonTextBox();
  });

  function setupReasonRadioBtns() {
    $('.evtTextarea_etc').hide();
    $('.rd_area input[type="radio"]').on('change', function() {
      const canclResn = getCheckedCanclResn();
      if (!canclResn) {
        $('.evtTextarea_etc').hide();
        $('#cancelBtn').addClass('disabled');
        return;
      }
      $('#cancelBtn').removeClass('disabled');
      if (canclResn == '기타') {
        $('.evtTextarea_etc').show();
      } else {
        $('.evtTextarea_etc').hide();
      }
    });
  }

  function getCheckedCanclResn() {
    const checkedRadio = $('input[name="cancelReason"]:checked');
    if (checkedRadio.length == 0) return;
    return $('label[for="' + checkedRadio.attr('id') + '"]').text();
  }

  function setupReasonTextBox() {
    // 타이핑 제한
    $('.textBox').on('input propertychange keyup', function (e) {
      let content = $(this).val();

      // 글자수 세기
      if (content.length == 0 || content == '') {
        $('.textCount').text('0');
      } else {
        $('.textCount').text(content.length);
      }

      // 글자수 제한
      if (content.length > 20) {
        // 20자 부터는 타이핑 되지 않도록
        $(this).val(content.substring(0, 20));
        $('.textCount').text('20'); // 글자수 표시를 20으로 고정
      }
    });

    //줄 제한
    $('.textBox').keydown(function(){
      var rows = $('.textBox').val().split('\n').length;
      var maxRows = 2;
      if(rows > maxRows){
        modifiedText = $('.textBox').val().split("\n").slice(0, maxRows);
        $('.textBox').val(modifiedText.join("\n"));
      }
    });
  }
</script>