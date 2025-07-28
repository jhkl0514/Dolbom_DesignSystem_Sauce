
class JsHouseMngShopOrderList extends JsHouseMngListSearch {
    constructor(container, cssSelector, postdata) {
        super();

        this._cls_info = { pagePrefix:cssSelector
            , searched_param : null/* 뷰화면에서 받은 post값(리스트에서 항목을 선택한 후 뷰화면으로 이동을 한뒤)*/
            , receivedData : null/*데이터를 호출 한 후 받은 값*/
            , codeData : null/*검색 조건 등 코드성 데이터*/
            , curPage : 1
            , cntPerPage : 10
        };

        this._cls_info.jqgridFormatter = new JsHouseJqgridFormatter();
        var gridOptions = {width : 1500, height:440
            , cmTemplate: {sortable: false}
            , "colModel":this.fn_initgrid_columns()
            , "fn_page_paging_call":"fn_page_paging_call"
            // , "onSelectRow":"fn_grid_row_click"
            // , "onCellSelect":"fn_grid_cell_click"
            , "loadComplete":"fn_grid_loadComplete"
        };

        if (postdata) this.fn_post_data(postdata);

        if (postdata && postdata.cntPerPage){
            gridOptions.rowNum = postdata.cntPerPage;
        }

        this._cls_info.jqgridFormatter = new JsHouseJqgridFormatter();
        this._cls_info.jqgridMaster = new JsHouse2309PopupJqgrid(this, cssSelector, "#grdMaster", "#grdPager", gridOptions);

        if (postdata && postdata.curPage){
            this._cls_info.jqgridMaster.fn_set_cntPerPage(postdata.cntPerPage);
        }
    }

    fn_post_data(postdata){/*이전 검색 조건*/
        super.fn_post_data(postdata);

        if (postdata && postdata.cntPerPage){
            this._cls_info.cntPerPage = postdata.cntPerPage;
        } 
        if (postdata && postdata.curPage) this._cls_info.curPage = postdata.curPage;
    }

    fn_init(){
        // $(this._cls_info.pagePrefix + " button[type='button'].btn.search").click();

        this.fn_code_get_call(["SHOP_ORDER_STATUS_MNG", "WELTOOL_ITEMGRP_NM1_FOR_MATCHING"])
    }

    fn_code_get_cb(result, fail, data, param){
        if (result == null || result.commonCheckVO == null || !result.commonCheckVO.success || result.commonCheckVO.customMap == null){
            return;
        }
        this._cls_info.codeData = result.commonCheckVO.customMap;
        
        this.fn_init_component();

        this.fn_init_addevent();

        this.fn_search_call(this._cls_info.curPage);
    }

    fn_init_component(){
        if (this._cls_info.searched_param == null){
            this.fn_srchDaySet('day', -90);
            return;
        }

        if (this._cls_info.searched_param.srchBgngDt == null || this._cls_info.searched_param.srchEndDt == null){
            this.fn_srchDaySet('day', -90);
        }else{

            $(this._cls_info.pagePrefix + " #srchBgngDt").val(this._cls_info.searched_param.srchBgngDt.date8To10("-"));
            $(this._cls_info.pagePrefix + " #srchEndDt").val(this._cls_info.searched_param.srchEndDt.date8To10("-"));
        }
        
        if (this._cls_info.searched_param.srchKind){
            $(this._cls_info.pagePrefix + " #srchKind").val(this._cls_info.searched_param.srchKind).attr("selected", "selected");
        }
        if (this._cls_info.searched_param.srchValue != undefined && this._cls_info.searched_param.srchValue != 'undefined'){
            $(this._cls_info.pagePrefix + " #srchValue").val(decodeURI(this._cls_info.searched_param.srchValue));
        }else{
            $(this._cls_info.pagePrefix + " #srchValue").val("");
        }

        $(this._cls_info.pagePrefix + " #srchOrdStautsCd").val(this._cls_info.searched_param.srchOrdStautsCd).attr("selected", "selected");
        $(this._cls_info.pagePrefix + " #srchBplcMatchingYn").val(this._cls_info.searched_param.srchBplcMatchingYn).attr("selected", "selected");
        
        // param.curPage = curPage;
		// param.cntPerPage = this._cls_info.jqgridMaster.fn_get_cntPerPage();

        
    }

    fn_srchDaySet(kind, interval){
        this.fn_srchDayBetweenSet(kind, interval, "#srchBgngDt", "#srchEndDt");
    }

    fn_init_addevent(){
        var owner = this;
        $(this._cls_info.pagePrefix + " button[type='button'].btn.search").off("click").on("click", function(event){
           owner.fn_search_call();
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.excel").off("click").on("click", function(event){
            owner.fn_search_excel_call();
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.excel").off("click").on("click", function(event){
            owner.fn_search_excel_call();
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.send.biztalk.confirm").off("click").on("click", function(event){
            owner.fn_send_biztalk_confirm_call();
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.send.biztalk.inprogress").off("click").on("click", function(event){
            owner.fn_send_biztalk_inprogress_call();
        });
    }

    fn_msg_empty_datatable(){
        return '해당하는 사업소가 존재하지 않습니다.';
    }

    /** jq그리드 컬럼 정의 */
	fn_initgrid_columns(){
		var owner = this;
		return [
			{ name: "mbrUniqueId", hidden: true },
            { name: "recipientsNo", hidden: true },
            { name: "ordStatusCd", hidden: true },
            { name: "ordMCdSeq", hidden: true },
            { name: "bplcUniqueId", hidden: true },
            {name :'checkBox',  index :'checkBox',   align:'center', cellattr: function () { return " class='items'" }
                    , label:'<input type="checkbox" onclick="jsCommon.fn_checkbox_name_checkall(\'checkBox\', this.checked)">'/**/
                    , editable: false, edittype:"checkbox",editoptions: {value:"Y:N"},formatter:owner.fn_formatter_checkbox
                    , formatoptions:{disabled:false}, sortable:false, width:10, classes : 'ctl checkbox'},

            { name: "ordMId", label: "번호", width: 15, align:'center' ,classes : "h44"},
            { name: "ordStatusNm", label: "주문상태", width: 25},
            { name: "itName", label: "상품명", width: 25},
            { name: "ordMCd", label: "주문서번호", width: 25},
            { name: "bplcNm", label: "사업소배정", width: 25},
            { name: "recipientsNm", label: "수급자성명", width: 25, formatter:owner._cls_info.jqgridFormatter.fn_formatter_mbr_recipient},
            { name: "deliveryTel", label: "휴대폰번호", width: 25},
            { name: "deliveryAddr1", label: "배송지 주소", width: 40},
            { name: "ordDt8", label: "주문일", width: 20, align:'center', formatter:owner._cls_info.jqgridFormatter.fn_formatter_dt8_dash_dt10},
            { name: "mbrNm", label: "회원이름<br>(회원코드)", width: 25, formatter : owner._cls_info.jqgridFormatter.fn_formatter_mbr_name_uniqueid
            }
		];
	}

    fn_formatter_checkbox(cellvalue, options, rowObject){
        var grdName = options.gid;
        var name = options.colModel.name;
        
        var row_id = rowObject.id;
        var id = row_id + "_" + options.colModel.name;

        var str = '<input type="checkbox" name="'+name+'" id="' + id + '" row_id="' + row_id + '" value="'+rowObject.ordMId+'" ';
        str += ' ordStatusCd="'+rowObject.ordStatusCd+'" ';
        str += ' bplcUniqueId="'+rowObject.bplcUniqueId+'" ';
        str += ' ordIId="'+rowObject.ordIId+'" ';
        str += ' ordMCd="'+rowObject.ordMCd+'" ';
        str += ' ordMId="'+rowObject.ordMId+'" ';
        str += ' >';
        
        // console.log('fn_grdm_chk_formatter name=' + name + ', id='+id + ', value='+rowObject.order_item_id);
        return str;
    };

    fn_search_data(curPage){
        if (curPage == undefined || curPage.length < 1) curPage = 1;

        var param = {};

        param.srchBgngDt = $(this._cls_info.pagePrefix + " #srchBgngDt").val().replaceAll('-', '');
        param.srchEndDt = $(this._cls_info.pagePrefix + " #srchEndDt").val().replaceAll('-', '');

        param.srchKind = $(this._cls_info.pagePrefix + " #srchKind").val();
        param.srchValue = $(this._cls_info.pagePrefix + " #srchValue").val();

        param.srchExceptStatusCancelYN = $(this._cls_info.pagePrefix + " #chkExceptCancel:checked").val();
        param.srchOrdItemStautsCd = $(this._cls_info.pagePrefix + " #srchOrdStautsCd").val();
        param.srchBplcMatchingYn = $(this._cls_info.pagePrefix + " input[name=srchBplcMatchingYn]:checked").val();
        
        param.curPage = curPage;
		param.cntPerPage = this._cls_info.jqgridMaster.fn_get_cntPerPage();
        
        return param;
    }

    fn_search_call(curPage){
        var data = this.fn_search_data(curPage);
		
		this._cls_info.searched_param = data;

		jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/list.json", 'fn_search_cb', data, null)

        // console.log(data)
    }
    fn_search_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || result.commonResponseListVO.customList == null){
            return;
        }

        this.fn_convert_data(result.commonResponseListVO.customList, false);
        this._cls_info.jqgridMaster.fn_data_bind(data.curPage, result.commonResponseListVO.cntPerPage, result.commonResponseListVO.listTotalCount, result.commonResponseListVO.customList);
    }

    fn_convert_data(responseList, isExcel){
        var itemone, key;
        for(var ifor=0 ; ifor<responseList.length ; ifor++){
            itemone = responseList[ifor];

            key = "ordStatusCd";
            if (itemone[key] && this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[itemone[key]]){
                itemone["ordStatusNm"] = this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[itemone[key]];
            }

            key = "date8To10";
            if (itemone[key]) itemone[key].date8To10('-');
            
            if (isExcel){
                key = "longtermCategoryKind";
                if ((itemone[key] == undefined || itemone[key].length < 1) && this._cls_info.codeData.WELTOOL_ITEMGRP_NM1_FOR_MATCHING[itemone[key]]){
                    itemone["longtermCategoryName"] = this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[itemone[key]];
                }

                key = "ioId";
                if (itemone[key]) {
                    itemone[key] = this.fn_convert_ioid_disp(itemone[key]);
                }                
            }

        }
    }

    fn_convert_ioid_disp(str){
        var jsonArray = undefined;
        try{
            jsonArray = JSON.parse(str)
        }catch{

        }

        if (jsonArray == undefined || jsonArray.length < 1){
            return "";
        }

        var ioTemp = [];
        if (jsonArray && jsonArray.length > 0){
            for(var kfor=0 ; kfor<jsonArray.length ; kfor++){
                ioTemp.push(jsonArray[kfor].title + ":" + jsonArray[kfor].value);
            }
        }

        return ioTemp.join(", ");
    }

    fn_grid_loadComplete(data){
        // console.log('fn_grid_loadComplete', data)
        var owner = this;
        $(this._cls_info.pagePrefix + " #grdMaster tr td .btn.mbr_name_uniqueid").off("click").on("click", function(event){
            var rowid = $(this).attr("rowid");
            var rowdata = owner._cls_info.jqgridMaster.fn_get_grid_data(rowid);

            owner.fn_move_mbr(rowdata);
        });

        $(this._cls_info.pagePrefix + " #grdMaster tr td .btn.mbr_recipient").off("click").on("click", function(event){
            var rowid = $(this).attr("rowid");
            var rowdata = owner._cls_info.jqgridMaster.fn_get_grid_data(rowid);

            owner.fn_move_detail(rowdata);
        });
    }

    fn_move_detail(rowdata){
        var uri = './detail.form' + location.search;
        
        var data = Object.assign({}, this._cls_info.searched_param);
        data.mbrUniqueId = rowdata.mbrUniqueId;
        data.recipientsNo = rowdata.recipientsNo;
        data.ordMId = rowdata.ordMId;
        // data.ordMCd = rowdata.ordMCd;
        // data.ordMCdSeq = rowdata.ordMCdSeq;
        // console.log(data);
        
        jsCallApi.call_svr_post_move(uri, data);
    }

    fn_move_mbr(rowdata){
        var uri = '/_mng/mbr/'+rowdata.mbrUniqueId+'/view';
        
        window.open(uri, '_blank');
    }

    fn_page_paging_call(pageNo){
        this.fn_search_call(pageNo);
    }

    fn_get_bplcUbiqueId_checked(ordStatusCd){
        var ilen = $(this._cls_info.pagePrefix + " #grdMaster tr td input[name='checkBox']:checked").length;
        
        var ret = {"listBplcUniqueId":[]};/*, "listOrdMId":[], "listOrdMCd":[]*/
        var chk = {};
        var bplcUniqueId;/*, ordMId, ordMCd*/

        for(var ifor=0 ; ifor<ilen ; ifor++){
            var itemone = $($(this._cls_info.pagePrefix + " #grdMaster tr td input[name='checkBox']")[ifor]);
            
            if (itemone.attr("ordStatusCd") != ordStatusCd){
                alert("주문 상태를 확인하여 주십시오.")
                return null;
            }

            bplcUniqueId = itemone.attr("bplcUniqueId")
            // ordMId = itemone.attr("ordMId");
            // ordMCd = itemone.attr("ordMCd");
            if (chk[bplcUniqueId]){
                console.log(bplcUniqueId)
                continue;
            }

            chk[bplcUniqueId] = true;

            ret.listBplcUniqueId.push(itemone.attr("bplcUniqueId"));
            // ret.listOrdMId.push(itemone.attr("ordMId"));
            // ret.listOrdMCd.push(itemone.attr("ordMCd"));
            
        }

        console.log(ret)
        return ret;
    }

    fn_send_biztalk_confirm_call(){
        this.fn_send_biztalk_bplc_call('DBO210');
    }
    
    fn_send_biztalk_inprogress_call(){
        this.fn_send_biztalk_bplc_call('DBO220');
    }

    fn_send_biztalk_bplc_call(ordStatusCd){
        if (!(ordStatusCd == "DBO210" || ordStatusCd == "DBO220")){
            alert("주문 상태를 확인하여 주십시오.");
            return
        }

        var list = this.fn_get_bplcUbiqueId_checked(ordStatusCd);
        if (!list){
            return;
        }

        if (!list.listBplcUniqueId || list.listBplcUniqueId.length < 1){
            alert("주문을 선택하여 주십시오.");
            return
        }

        if (!confirm("알림톡을 발송 하시겠습니까?")){
            return;
        }
        var data = {ordStatusCd, "listBplcUniqueId":list.listBplcUniqueId};

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/alimtalk_bplc.json", 'fn_send_biztalk_bplc_cb', data, null)
    }

    fn_send_biztalk_bplc_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || result.commonResponseListVO.customList == null){
            return;
        }
    }
    async fn_search_excel_call(){
        var jsPopupExcelPwd = new JsPopupExcelPwd(this, '', 'jsPopupExcelPwd', 1, {});
		const asyncConfirm = await jsPopupExcelPwd.fn_show_popup({})
		if (asyncConfirm != "confirm") return;

        var data = Object.assign({}, this._cls_info.searched_param);

        data.curPage = 1;
		data.cntPerPage = 99999999;

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/excel.json", 'fn_search_excel_cb', data, null)
    }

    fn_search_excel_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || result.commonResponseListVO.customList == null){
            return;
        }
        
        this.fn_excel_convert(result.commonResponseListVO.customList);
    }

    async fn_excel_convert(responseList){
        var excelFileSubject = "수급자_주문관리_";

        var fieldList = ["rowNum", "ordStatusNm", "itName", "ordMCd", "bplcNm", "recipientsNm", "deliveryTel", "deliveryAddr1", "ordDt8", "mbrNm"
            , "mbrUniqueId", "recipientsNo", "bplcUniqueId", "deliveryName", "longtermCategoryName", "itId", "ioId"]
        var fieldNames = ["번호", "주문상태", "상품명", "주문서번호", "사업소배정", "수급자성명", "휴대폰번호", "배송지주소", "주문일", "회원이름"
            , "회원UniqueID", "수급자관리번호", "사업소UniqueID", "배송자명", "롱텀분류", "상품코드", "옵션"
        ];

        this.fn_convert_data(responseList, true);

        const jsExcelDownload = new JsExeclDownLoad();
        const excelFile = await jsExcelDownload.createExcelListObject(fieldNames, fieldList, responseList);
		await jsExcelDownload.download(excelFile, excelFileSubject);
    }

}