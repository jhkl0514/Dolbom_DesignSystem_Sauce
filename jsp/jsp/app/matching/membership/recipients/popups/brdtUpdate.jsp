<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!--wrapper
    \app\matching\assets\src\pages\F_SNR_002_eld_regi04.html
-->
        <!-- Modal fullsreen -->
        <div class="modal custom allocate fullscreen recipients popups brdtUpdate">

            <div class="modal_header">
              <h4 class="modal_title"></h4>
              <div class="close_x modal-close waves-effect"></div>
            </div>
      
            <div class="modal-content pad020">
                <div class="h40"></div>
    
                <h3 class="title">
                    정확한 서비스 제공을 위해<br>
                    어르신의 생년월일을<br>
                    입력해주세요
                </h3>
    
                <div class="h40"></div>
    
                <input type="text" class="input_basic evt_input2 recipients popups brdtUpdate keycontrol birthdt10 filled_date10slash_enabled" targetFilledEnabled=".btn.recipients.popups.brdtUpdate" placeholder="1958/01/01" value="${birth}" maxlength="10">
                <div class="vaild_txt birthdt10 disNone error name">다시 확인해 주세요.</div>
      
            </div>
            <!-- modal-content -->
      
            <div class="modal-footer">
              <div class="btn_area d-flex">
                <a class="waves-effect btn btn-large w100p btn_primary btn_disable evt_btn2 recipients popups brdtUpdate">저장하기</a>
              </div>
            </div>
      
      
      
          </div>
    
    <!-- wrapper -->
    <script>
        var _modalRecipientsBrdtUpdate;

        $(function(){
          
        });

        async function fn_recipients_brdtUpdate_init(recipientsNo){
          await showAlertPopup("서비스 제공을 위해 정확한 어르신 정보를 입력해주세요.");

          var jsCommon = new JsCommon();
          jsCommon.fn_keycontrol();

          _modalRecipientsBrdtUpdate = jsCommon.fn_get_modal_controller(".modal.recipients.brdtUpdate");

          _modalRecipientsBrdtUpdate.open();

          $(".modal.recipients.brdtUpdate .btn.recipients.brdtUpdate").off('click').on('click', function(){
            fn_recipients_brdtUpdate_click(recipientsNo);
          });
        }
        function fn_recipients_brdtUpdate_click(recipientsNo){
          var qsMap = {};
          qsMap["recipientsNo"] = recipientsNo;
          qsMap["brdt"] = $(".input_basic.recipients.brdtUpdate").val();

          var temp = qsMap["brdt"].split('/');
          if (new Date().getFullYear() - 10 <= temp[0] ){
            fn_recipients_brdtUpdate_error_disp(true, "다시 확인해주세요.");
            return;
          }else{
            fn_recipients_brdtUpdate_error_disp(false, "");
          }
        
          callPostAjaxIfFailOnlyMsg('/matching/membership/recipients/updateMbrRecipientBrdt.json', qsMap, fn_recipients_brdtUpdate_cb);
        }
        async function fn_recipients_brdtUpdate_cb(result){
          if (result != null && result.errorMsg != undefined && result.errorMsg.length > 0){
            
            await showAlertPopup(result.errorMsg)
            
            location.href = '/matching/main/service';
            return;
          }else{
            await showAlertPopup("저장되었습니다.");
          }

          location.reload();

        }

        function fn_recipients_brdtUpdate_error_disp(bError, msg){
          var jobjTarget = $('.modal.recipients.brdtUpdate .input_basic.birthdt10');
          var jobjError = $(".modal.recipients.brdtUpdate .vaild_txt.birthdt10");

          if (bError){
              jobjError.html(msg)
              jobjError.removeClass("disNone");
              jobjTarget.addClass("bder_danger");
          }else{
              jobjError.addClass("disNone");
              jobjTarget.removeClass("bder_danger");
          }

      }
    </script>