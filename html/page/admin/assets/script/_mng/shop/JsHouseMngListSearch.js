class JsHouseMngListSearch {
    fn_srchDayBetweenSet(kind, interval, beginDt, endDt){
        //srchOrdrYmdBgng, srchOrdrYmdEnd
        $(this._cls_info.pagePrefix + " " + endDt).val(jsCommon.fn_getToday());
        if (kind == 'day'){
            if(interval == "0"){//오늘
                $(this._cls_info.pagePrefix + " " + beginDt).val(jsCommon.fn_getToday());
            }else {
                $(this._cls_info.pagePrefix + " " + beginDt).val(jsCommon.fn_getDate(interval));
            }
        }
        
    }

    fn_code_get_call(arrCodeList){
        // arrCodeList = ["SHOP_ORDER_STATUS_MNG"]
        let data = {"arrCodeList":arrCodeList};
        jsCallApi.call_api_post_json(this, "/_mng/code/list.json", 'fn_code_get_cb', data, null)
    }

    fn_code_get_cb(result, fail, data, param){
        if (result == null || result.commonCheckVO == null || !result.commonCheckVO.success || result.commonCheckVO.customMap == null){
            return;
        }

        // this._cls_info.jsHouseMngShopOrderItems.fn_code_received(result.commonCheckVO.customMap);
        // this._cls_info.jsHouseMngShopOrderCancel.fn_code_received(result.commonCheckVO.customMap);
    }

    fn_post_data(postdata){/*이전 검색 조건*/
        this._cls_info.searched_param = postdata;
    }

    fn_msg_empty_datatable(){
        return '해당하는 리스트가 존재하지 않습니다.';
    }
}