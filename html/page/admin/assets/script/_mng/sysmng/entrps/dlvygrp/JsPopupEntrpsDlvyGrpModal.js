class JsPopupEntrpsDlvyGrpModal extends JsPopupLoadingFormDataBase{
    fn_page_init_click(){
        var owner = this;

        $(owner._cls_info.pageModalfix + ' .btn.f_confm_save').off('click').on('click', function(){
            owner.fn_save_click();
        });
        
    }

    fn_loading_form_cls(){
        (new JsCommon()).fn_keycontrol(this._cls_info.pageModalfix + " .keycontrol");
    }

    fn_loading_all_result_data(){
        if (this._cls_info != undefined && this._cls_info.popup_param != undefined){
            if (this._cls_info.popup_param.entrpsNo != undefined && this._cls_info.popup_param.entrpsNo.length > 0){
                $(this._cls_info.pageModalfix + " select[name=entrpsList]").val(this._cls_info.popup_param.entrpsNo);
            }
            
            if (this._cls_info.popup_param.chgEntrpsNo != undefined && this._cls_info.popup_param.chgEntrpsNo){
                $(this._cls_info.pageModalfix + " select[name=entrpsList]").removeAttr("disabled");
            }else{
                $(this._cls_info.pageModalfix + " select[name=entrpsList]").prop("disabled", "true");
            }
            
        }


        if (this._cls_info.orginData == undefined) this._cls_info.orginData = {};
        if (this._cls_info.dataAllResult != undefined && this._cls_info.dataAllResult.resultData != undefined ){
            this._cls_info.orginData.dlvyAditAmt = this._cls_info.dataAllResult.resultData.dlvyAditAmt

            $(this._cls_info.pageModalfix + " input[name='entrpsDlvygrpNo']").val(this._cls_info.dataAllResult.resultData.entrpsDlvygrpNo);
            $(this._cls_info.pageModalfix + " input[name='entrpsDlvygrpNm']").val(this._cls_info.dataAllResult.resultData.entrpsDlvygrpNm);
            $(this._cls_info.pageModalfix + " input[name='dlvyAditAmt']").val(this._cls_info.dataAllResult.resultData.dlvyAditAmt.format_money());

            $(this._cls_info.pageModalfix + " input[name='dlvyCalcTy'][value!='" + this._cls_info.dataAllResult.resultData.dlvyCalcTy + "']").removeAttr("checked");
            $(this._cls_info.pageModalfix + " input[name='dlvyCalcTy'][value ='" + this._cls_info.dataAllResult.resultData.dlvyCalcTy + "']").prop("checked", "checked");
            

            $(this._cls_info.pageModalfix + " input[name='useYn'][value!='" + this._cls_info.dataAllResult.resultData.useYn + "']").removeAttr("checked");
            $(this._cls_info.pageModalfix + " input[name='useYn'][value ='" + this._cls_info.dataAllResult.resultData.useYn + "']").prop("checked", "checked");
            
            
        }else{
            this._cls_info.orginData.dlvyAditAmt = 0;
            $(this._cls_info.pageModalfix + " input[name='entrpsDlvygrpNo']").val("0");
            $(this._cls_info.pageModalfix + " input[name='entrpsDlvygrpNm']").val("");
            $(this._cls_info.pageModalfix + " input[name='dlvyAditAmt']").val("5000");

            $(this._cls_info.pageModalfix + " input[name='dlvyCalcTy'][value!='MIN']").removeAttr("checked");/*기본이 최소값으로 설정*/
            $(this._cls_info.pageModalfix + " input[name='dlvyCalcTy'][value ='MIN']").prop("checked", "checked");

        }

        
    }
    
    fn_save_click(){
        this._cls_info.saveUrl = "/_mng/sysmng/entrps/dlvygrp/dlvygrpmodalaction.json";

        var objDlvyCalcTy = $(this._cls_info.pageModalfix + " input[name='dlvyCalcTy']:checked");
        var data = {entrpsNo : $(this._cls_info.pageModalfix + " select[name=entrpsList]").val()
                    , entrpsDlvygrpNo : $(this._cls_info.pageModalfix + " input[name='entrpsDlvygrpNo']").val()
                    , entrpsDlvygrpNm : $(this._cls_info.pageModalfix + " input[name='entrpsDlvygrpNm']").val()
                    , dlvyCalcTy : objDlvyCalcTy.val()
                    , dlvyAditAmt : $(this._cls_info.pageModalfix + " input[name='dlvyAditAmt']").val().replace(",", "")
                    , originDlvyAditAmt : this._cls_info.orginData.dlvyAditAmt
                    , useYn : $(this._cls_info.pageModalfix + " input[name='useYn']:checked").val()};

        if (data.entrpsNo == undefined || data.entrpsNo.length < 1 || data.entrpsNo == "0"){
            alert("입점업체를 선택하여 주십시오.")
            return;
        }

        if (data.entrpsDlvygrpNm == undefined || data.entrpsDlvygrpNm.length < 2){
            alert("묶음그룹명을 입력하여 주십시오.")
            return;
        }

        jsCallApi.call_api_post_json(this, this._cls_info.saveUrl, 'fn_save_cb', data);
        
    }
    fn_save_cb(result, fail, data, param){
        if (result != undefined && result.success){
            if (result.sucmsg != undefined && result.sucmsg.length > 0){
                alert(result.sucmsg)

                this._cls_info.popup_param.isChanged = 1;
                
                this.fn_close_popup();

                if (this._cls_info.popup_param != null && this._cls_info.popup_param.choice){
                    if (result.entrpsDlvygrpNo != undefined && result.entrpsDlvygrpNo != "" && result.entrpsDlvygrpNo != "0"){
                        data.entrpsDlvygrpNo = result.entrpsDlvygrpNo;
                    }
    
                    if (this._cls_info.container != undefined && this._cls_info.container['fn_popup_selected'] != undefined){
                        var objRadio = $(this._cls_info.pageModalfix + " input[name='dlvyCalcTy']:checked");
                        data.dlvyCalcTyNm  = objRadio.attr("dlvyCalcTyNm");
                        data.dlvyCalcTyNm2 = objRadio.attr("dlvyCalcTyNm2");

                        objRadio = $(this._cls_info.pageModalfix + " input[name='useYn']:checked");
                        data.useYnNm = objRadio.attr("useYnNm");
                        this._cls_info.container['fn_popup_selected']('confirm', this._cls_info.popName, this._cls_info.popup_param, data, null);
                    }
                }
                
            }
        }
    }
}