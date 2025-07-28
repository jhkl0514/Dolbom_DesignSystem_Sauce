class JsHouseMngShopOrderCancel{
    constructor(container, cssSelector){
        this._cls_info = { container, pagePrefix:cssSelector};
    }

    fn_init(){
        this.fn_init_addevent();

    }
    fn_show_popup(param){
        this._cls_info.searched_param = param;

        $(this._cls_info.pagePrefix).modal('show');
    }
    
    fn_code_received(param){
        this._cls_info.codeData = param;
        
        if (this._cls_info.codeData.SHOP_ORDER_CANCEL_LIST){
            var objTarget = $(this._cls_info.pagePrefix + " #ddlCancelType");
            objTarget.empty();

            var option = $("<option value=''>취소 사유 선택</option>");
            objTarget.append(option);

            for(var ifor=0 ; ifor<this._cls_info.codeData.SHOP_ORDER_CANCEL_LIST.length ; ifor++){
                var itemone = this._cls_info.codeData.SHOP_ORDER_CANCEL_LIST[ifor];
                var option = $("<option value='"+itemone.key+"'>"+itemone.value+"</option>");
                objTarget.append(option);
            }
            
        }
    }

    fn_init_component(){
        
    }

    fn_init_addevent(){
        var owner = this;

        $(this._cls_info.pagePrefix + " .btn.update.canclResn").off("click").on("click", function(event){
            event.preventDefault()
            owner.fn_order_cancel_call();
        });

        $(this._cls_info.pagePrefix + " #ddlCancelType").off("change").on("change", function(event){
            owner.fn_ddlCancelType_changed($(this));
        });

    }

    fn_ddlCancelType_changed(jobjTarget){
        if (jobjTarget.val() == "ETC"){
            $(this._cls_info.pagePrefix + " #canclResn").removeClass("hidden");
        }else{
            $(this._cls_info.pagePrefix + " #canclResn").addClass("hidden");
        }

    }
    fn_order_cancel_call(){
        var jobjCancelType = $(this._cls_info.pagePrefix + " #ddlCancelType");
        if (jobjCancelType.val() == ""){
            alert("취소 사유를 선택하여 주십시오.")
            return;
        }else if (jobjCancelType.val() == "ETC"){
            if ($(this._cls_info.pagePrefix + " #canclResn").val().length < 2){
                alert("취소 사유를 입력하여 주십시오.")
                return;
            }
        }

        if (!confirm("주문을 취소하시겠습니까?")){
            return;
        }

        var data = Object.assign({}, this._cls_info.searched_param);
        data.cancelType = jobjCancelType.val();
        if (jobjCancelType.val() == "ETC"){
            data.canclResn = $(this._cls_info.pagePrefix + " #canclResn").val();
        }else{
            data.canclResn = "";
        }
        

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/cancel.json", 'fn_order_cancel_cb', data, null);
    }
    fn_order_cancel_cb(result, fail, data, param){
        if (result == null || result.commonCheckVO == null){
            return;
        }

        if (result.commonCheckVO.errorMsg != undefined && result.commonCheckVO.errorMsg.length > 0){
            alert(result.commonCheckVO.errorMsg);
            return;
        }

        this._cls_info.container.fn_popup_selected('reload');
        alert("취소 되었습니다.")
    }
}

class JsHouseMngShopOrderDetail{
    constructor(container, cssSelector, consultAbleTypeAllNum, consultAbleTypeInitNum){
        this._cls_info = { pagePrefix:cssSelector, pagePopPrefix:undefined
            
            , searched_param : null/* 뷰화면에서 받은 post값(리스트에서 항목을 선택한 후 뷰화면으로 이동을 한뒤)*/
            , receivedData : null/*데이터를 호출 한 후 받은 값*/
        };

        this._cls_info.searching_items = false;
        this._cls_info.searching_memo = false;
        this._cls_info.searching_status = false;

        var jsHouseMngBplcModalOption = {"consultAbleTypeAllNum": consultAbleTypeAllNum, "consultAbleTypeInitNum": consultAbleTypeInitNum};
        this._cls_info.jsHouseMngBplcModal = new JsHouseMngBplcModal(this, "#bplcModal.modal", "JsHouseMngBplcModal", 1, "", "/_mng/members/bplc/bplcSearchList2409.json", jsHouseMngBplcModalOption);
    
        this._cls_info.jsHouseMngShopOrderItems = new JsHouseMngShopOrderItems(this, cssSelector + " div.order.items");
        this._cls_info.jsHouseMngShopOrderItems.fn_init();

        this._cls_info.jsHouseMngShopOrderCancel = new JsHouseMngShopOrderCancel(this, cssSelector + " .modal.order.cancel");
        this._cls_info.jsHouseMngShopOrderCancel.fn_init();
    }

    fn_popup_selected(alert_val, popName, popup_param, data, extra){
        console.log(alert_val, popName, popup_param, data)
        if (alert_val == 'confirm'){
            if (popName == 'JsHouseMngBplcModal'){
                if (data.uniqueId == $(this._cls_info.pagePrefix + " input#originBplcUniqueId").val()){
                    alert("기존 사업소와 동일한 사업소입니다.")
                    return;
                }
                $(this._cls_info.pagePrefix + " input#bplcUniqueId").val(data.uniqueId);
                $(this._cls_info.pagePrefix + " .addBplcNm").html(data.bplcNm);
            }
        } else if (alert_val == 'reload'){
            location.reload();
        } else if (alert_val == 'move_list'){
            this.fn_move_list();
        }
    }

    fn_move_list(){

        var data = jsCommon.fn_queryString_toMap(location.search);
        delete data["mbrUniqueId"];
        delete data["recipientsNo"];
        delete data["ordMCd"];

        var search = jsCommon.fn_queryString_fromMap(data);

        var uri = './list.form' + ((search && search.length> 0) ? '?'+search : '' );
        
        jsCallApi.call_svr_post_move(uri, this._cls_info.searched_param);
    }
    
    fn_carehost(carehost){
        this._cls_info.carehost = carehost;
        this._cls_info.jsHouseMngShopOrderItems.fn_carehost(carehost);
    }
    fn_init(param){
        param.srchValue = decodeURI(param.srchValue)
        this._cls_info.searched_param = param;

        // console.log(this._cls_info.searched_param)
        if (param.ordStatusCd == "DBO110" || param.ordStatusCd == "DBO210"){
            $(this._cls_info.pagePrefix + " button.f_srchBplc").removeClass("hidden");
            $(this._cls_info.pagePrefix + " button.btn.order.save").removeClass("hidden");
            $(this._cls_info.pagePrefix + " button.btn.order.cancel").removeClass("hidden");
        }else if (param.ordStatusCd == "DBO220"){
            $(this._cls_info.pagePrefix + " button.f_srchBplc").remove();
            $(this._cls_info.pagePrefix + " button.btn.order.save").remove();
        }else {
            $(this._cls_info.pagePrefix + " button.f_srchBplc").remove();
            $(this._cls_info.pagePrefix + " button.btn.order.save").remove();
            $(this._cls_info.pagePrefix + " button.btn.order.cancel").remove();
        }

        this._cls_info.jsHouseMngShopOrderItems.fn_init(param);

        this.fn_init_addevent();

        this.fn_code_get_call();

        
    }

    fn_init_addevent(){
        var owner = this;

        $(this._cls_info.pagePrefix + " .btn.list").off("click").on("click", function(event){
            owner.fn_move_list();
        });

        $(this._cls_info.pagePrefix + " button.btn.order.save").off("click").on("click", function(event){
            owner.fn_order_save_call();
        });

        $(this._cls_info.pagePrefix + " button.f_srchBplc").off("click").on("click", function(event){
            owner.fn_popup_bplc_show();
        });
        $(this._cls_info.pagePrefix + " .btn.memo.save").off("click").on("click", function(event){
            owner.fn_memo_save_call();
        });

        // $(this._cls_info.pagePrefix + " button[type='button'].btn.order.items").off("click").on("click", function(event){
        //     owner._cls_info.jsHouseMngShopOrderItems.fn_show_popup(owner._cls_info.searched_param);
        // });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.order.cancel").off("click").on("click", function(event){
            owner._cls_info.jsHouseMngShopOrderCancel.fn_show_popup(owner._cls_info.searched_param);
        });
    }
    fn_code_get_call(){
        let data = {"arrCodeList":["SHOP_ORDER_STATUS_MNG", "SHOP_ORDER_DELIVERY_COMPANY_MAP", "SHOP_ORDER_CANCEL_LIST"]};
        jsCallApi.call_api_post_json(this, "/_mng/code/list.json", 'fn_code_get_cb', data, null)
    }
    fn_code_get_cb(result, fail, data, param){
        if (result == null || result.commonCheckVO == null || !result.commonCheckVO.success || result.commonCheckVO.customMap == null){
            return;
        }

        this._cls_info.codeData = result.commonCheckVO.customMap;
        this._cls_info.jsHouseMngShopOrderItems.fn_code_received(result.commonCheckVO.customMap);
        this._cls_info.jsHouseMngShopOrderCancel.fn_code_received(result.commonCheckVO.customMap);

        this.fn_disp_order_status(this._cls_info.searched_param.ordStatusCd);

        this._cls_info.received_memo = null;
        this._cls_info.received_status = null;
        this.fn_detail_get_call();

        this._cls_info.jsHouseMngShopOrderItems.fn_show_popup(this._cls_info.searched_param);
    }

    fn_detail_get_call(){
        let data = this._cls_info.searched_param;
        if (this._cls_info.searching_status){
            return
        }
        this._cls_info.searching_status = true;

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/detail.json", 'fn_detail_get_cb', data, null)
    }
    fn_detail_get_cb(result, fail, data, param){
        this._cls_info.searching_status = false;

        if (result == null || result.commonCheckVO == null || !result.commonCheckVO.success || result.commonCheckVO.customMap == null){
            return;
        }
        this._cls_info.matchingAbleTypeNum = result.commonCheckVO.customMap.matchingAbleTypeNum;
        this._cls_info.shopOrderMasterVO = result.commonCheckVO.customMap.shopOrderMasterVO;

        this.fn_bplc_log_disp(result.commonCheckVO.customMap.bplcLogList);

        this._cls_info.received_memo = result.commonCheckVO.customMap.memoList;

        if (result.commonCheckVO.customMap.statusList.length > 0){
            for(var ifor=0 ; ifor<result.commonCheckVO.customMap.statusList.length ; ifor++){
                this.fn_convert_status_detail2_memo(result.commonCheckVO.customMap.statusList[ifor]);
            }
        }
        this._cls_info.received_status = result.commonCheckVO.customMap.statusList;
        
        this._cls_info.jsHouseMngShopOrderItems.fn_detail_get_cb(result.commonCheckVO.customMap);
        this.fn_memo_status_disp();
    }

    fn_bplc_log_disp(bplcLogList){

        
        $(this._cls_info.pagePrefix + " .bplcLi .addBplcNm").html('');

        $(this._cls_info.pagePrefix + " .bplcLi .bplcLogList").html('');

        var liDisp = [];

        for(var ifor=0 ; ifor<bplcLogList.length ; ifor++){
            if (bplcLogList[ifor].bplcUniqueId){
                var str = '<li>{0} {1}</li>'.format(bplcLogList[ifor].bplcNm, (new Date(bplcLogList[ifor].regDt)).format("yyyy-MM-dd HH:mm") );

                liDisp.push(str)
            }
        }
        
        $(this._cls_info.pagePrefix + " .bplcLi .bplcLogList").html(liDisp.join(''));
    }

    fn_memo_status_disp(){
        /*
        2024-10-22 16:37:38 manager(manager) / 메모
        2024-10-22 15:58:52 이현진(MBR_00000274) 이력(자동) / 상태변경: [진행상태로 변경되었습니다.]
        */
        console.log(this._cls_info.received_memo)//MNGTXT, CANCEL
        console.log(this._cls_info.received_status)

        var arrList = [];
        var itemone, itemtemp;
        var ifor, ilen;
        var strTemp;
        
        ilen = this._cls_info.received_status.length;
        for(ifor=0 ; ifor<ilen ; ifor++){
            itemtemp = this._cls_info.received_status[ifor];

            itemone = {kind:"status", tableKey : itemtemp.ordStatusLogId, regDt : itemtemp.regDt, memo : itemtemp.memo};
            arrList.push(itemone);
        }

        const filtered = this._cls_info.received_memo.filter(element => {
            // 다중 조건을 결합하여 필터링
            return element.memoKind == 'MNGTXT' || element.memoKind == 'DELIVERYCHANGED';
        });

        ilen = filtered.length;
        for(ifor=0 ; ifor<ilen ; ifor++){
            itemtemp = filtered[ifor];
            strTemp = itemtemp.regUniqueNm + '(' + itemtemp.regUniqueCd + ') / '  + itemtemp.memoTxt;
            itemone = {kind:"memo", tableKey : itemtemp.ordMemoId, regDt : itemtemp.regDt, memo : strTemp};
            arrList.push(itemone);
        }

        arrList = arrList.sort(function(a, b){
            return a.regDt > b.regDt ? -1 : a.regDt < b.regDt ? 1 : 0;
        })

        ilen = arrList.length;
        for(ifor=0 ; ifor<ilen ; ifor++){
            itemtemp = arrList[ifor];
            arrList[ifor] = (new Date(itemtemp.regDt)).format("yyyy-MM-dd HH:mm") + ' ' + itemtemp.memo
        }

        $(this._cls_info.pagePrefix + " #historyTxt").val(arrList.join('\n'));
    }

    fn_memo_save_call(){
        if ($("#mngMemo").val() == ""){
            alert("상담내용을 입력하여 주십시오.")
            return;
        }
        if (!confirm('상담기록을 저장하시겠습니까?')) {
            return;
        }

        let data = {
			ordMId:this._cls_info.searched_param.ordMId
            , recipientsNo:this._cls_info.searched_param.recipientsNo
            , mbrUniqueId:this._cls_info.searched_param.mbrUniqueId
            , mngMemo:$("#mngMemo").val()
		};

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/memo/save.json", 'fn_memo_save_cb', data, null)
    }

    fn_memo_save_cb(result, fail, data, param){
        if (result == null){
            return;
        }

        $("#mngMemo").val('');
        
        this._cls_info.received_memo = result.commonResponseListVO.customList;
        this.fn_memo_status_disp();

        alert("저장되었습니다.")
    }

    fn_order_save_call(){
        if ($(this._cls_info.pagePrefix + " #bplcUniqueId").val() == ""){
            alert("변경할 사업소를 선택하여 주십시오.")
            return;
        }
        if ($(this._cls_info.pagePrefix + " #originBplcUniqueId").val() == $(this._cls_info.pagePrefix + " #bplcUniqueId").val()){
            alert("기존 사업소와 동일한 사업소입니다.")
            return;
        }
        
        if ($(this._cls_info.pagePrefix + " #originBplcUniqueId").val() == ""){
            if (!confirm('주문을 저장하시겠습니까?')) {
                return;
            }
        }else{
            if (!confirm('사업소를 변경할 경우 기존 사업소 주문정보는 삭제됩니다. 진행하시겠습니까?')) {
                return;
            }
        }
        

        let data = {
			ordMId:this._cls_info.searched_param.ordMId
            , recipientsNo:this._cls_info.searched_param.recipientsNo
            , mbrUniqueId:this._cls_info.searched_param.mbrUniqueId
            , bplcUniqueId: $(this._cls_info.pagePrefix + " #bplcUniqueId").val()
		};

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/save.json", 'fn_order_save_cb', data, null)
    }

    fn_order_save_cb(result, fail, data, param){
        if (result == null){
            return;
        }

        if (result.commonCheckVO && result.commonCheckVO.customMap  && result.commonCheckVO.customMap.shopOrderStatusCd ){
            var ordStatusCd = result.commonCheckVO.customMap.shopOrderStatusCd;
            this.fn_disp_order_status(ordStatusCd);
        }

        if (result.commonCheckVO.customMap.statusList.length > 0){
            for(var ifor=0 ; ifor<result.commonCheckVO.customMap.statusList.length ; ifor++){
                this.fn_convert_status_detail2_memo(result.commonCheckVO.customMap.statusList[ifor]);
            }

            this._cls_info.received_status = result.commonCheckVO.customMap.statusList;
            this.fn_memo_status_disp();
        }

        if (result.commonCheckVO.customMap.bplcLogList){
            this.fn_bplc_log_disp(result.commonCheckVO.customMap.bplcLogList);
        }
        

        $(this._cls_info.pagePrefix + " #originBplcUniqueId").val(data.bplcUniqueId)
        alert("저장되었습니다.")
    }

    fn_disp_order_status(ordStatusCd){
        if (this._cls_info.codeData.SHOP_ORDER_STATUS_MNG != undefined && this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[ordStatusCd] != null){
            // $(this._cls_info.pagePrefix + " #ordStatusNm").html(ordStatusCd + '->' +this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[ordStatusCd])
        }
    }

    fn_convert_status_detail2_memo(statusLogOne){
        
        var txt = (new Date(statusLogOne.regDt)).format("yyyy-MM-dd HH:mm") + " " + statusLogOne.regMbrNm +"("+statusLogOne.regMbrId+")";


        if (statusLogOne.memo && statusLogOne.memo != ''){
            txt += "/ 상태변경: ["+ statusLogOne.memo + "]";
        }

        statusLogOne.memo = txt;
    }

    fn_popup_bplc_show(){

        var data = {
            "matchingAbleTypeNum" : this._cls_info.matchingAbleTypeNum
            , "originBplcUniqueId":$(this._cls_info.pagePrefix + " input#originBplcUniqueId").val()
        };

        data.type = 'SHOP_ORDER'
        if (this._cls_info.shopOrderMasterVO){
            data.ordMId = this._cls_info.shopOrderMasterVO.ordMId;
            data.lat = this._cls_info.shopOrderMasterVO.deliveryLat;
            data.lot = this._cls_info.shopOrderMasterVO.deliveryLot;
            data.mbrUniqueId = this._cls_info.shopOrderMasterVO.mbrUniqueId;
            data.recipientsLongtermConfirmYn = "Y";
            data.recipientsNo = this._cls_info.shopOrderMasterVO.recipientsNo;
            data.zipHCode = this._cls_info.shopOrderMasterVO.deliveryZipHCode;

            var zip = findHangjungdongByZipHCode(data.zipHCode);
            if (zip){
                data.sidoNm = zip.sido;
                data.sigugunNm = zip.sigugun;
            }
        }

        this._cls_info.jsHouseMngBplcModal.fn_show_popup(data);
    }
}