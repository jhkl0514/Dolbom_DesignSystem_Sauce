class JsHouseMngShopItemsRcmdRegister {
    constructor(container, cssSelector, popName) {

        this._cls_info = { container
            , popName
            , pagePrefix:cssSelector
            , searched_param : null/* 뷰화면에서 받은 post값(리스트에서 항목을 선택한 후 뷰화면으로 이동을 한뒤)*/
        };

        this._cls_info.jqgridFormatter = new JsHouseJqgridFormatter();
        var gridOptions = {width : 740, height:360
            , cmTemplate: {sortable: false}
            , "colModel":this.fn_initgrid_columns()
            // , "fn_page_paging_call":"fn_page_paging_call"
            , "onSelectRow":"fn_grid_row_click"
            // , "onCellSelect":"fn_grid_cell_click"
            , "loadComplete":"fn_grid_loadComplete"
        };

        this._cls_info.jqgridMaster = new JsHouse2309PopupJqgrid(this, cssSelector, "#popGrdMaster", ""
        , gridOptions);

        this.fn_init_addevent();
    }

    fn_init_addevent(){
        var owner = this;
        $(this._cls_info.pagePrefix + " button[type='button'].btn.search").off("click").on("click", function(event){
           owner.fn_search_call();
        });

        $(this._cls_info.pagePrefix + " button[type='button'].btn.f_modalSelect").off("click").on("click", function(event){
            owner.fn_item_choice();
         });
        
    }


    /** jq그리드 컬럼 정의 */
    fn_initgrid_columns(){
        var owner = this;
        return [
            { name: "caId", hidden: true},
            {name :'radioBox',  index :'radioBox',   align:'center', cellattr: function () { return " class='items'" }
                    , label:'선택'/**/
                    , editable: false, edittype:"radio",editoptions: {value:"Y:N"},formatter:owner.fn_grdm_rdo_formatter
                    , formatoptions:{disabled:false}, sortable:false, width:20, classes : 'ctl checkbox'},
            { name: "itId", label: "상품ID", width: 100},
            
            { name: "itName", label: "상품명", width: 100},
        ];
    }

    fn_grdm_rdo_formatter(cellvalue, options, rowObject){
        var name = options.colModel.name;
        
        var row_id = rowObject.id;
        var id = row_id + "_" + options.colModel.name;

        var str = '<input type="radio" name="'+name+'" id="' + id + '"  row_id="' + row_id + '"   itName="'+rowObject.itName+'" value="'+rowObject.itId+'" ';

        if (options.colModel.name == "extend_yn"){/*팝업에서 사용함*/
            if (rowObject["sale_kind_cd"] != "R"){
                str += ' disabled="true" ';
            }
            if (cellvalue == "Y"){
                str += ' checked ';
            }
        }
        
        str += ' >';
        
        // console.log('fn_grdm_chk_formatter name=' + name + ', id='+id + ', value='+rowObject.order_item_id);
        return str;
    };
    
    fn_show_popup(param){
        
        this._cls_info.searched_param = param;

        $(this._cls_info.pagePrefix).modal('show');

    }

    fn_search_call(curPage){
        var data = Object.assign({}, this._cls_info.searched_param);
        data.itName = $(this._cls_info.pagePrefix + " #srchValue").val();

        if (!data.itName || data.itName.length < 2){
            alert("2글자 이상 입력 후 검색해주세요.")
            return;
        }

		jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/connectapi_item_list.json", 'fn_search_cb', data, null)

        // console.log(data)
    }
    fn_search_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || result.commonResponseListVO.customList == null){
            return;
        }

        if (result.commonResponseListVO.customList.length == 0){
            alert("검색된 결과가 없습니다.")
        }
        this._cls_info.jqgridMaster.fn_data_bind(data.curPage, result.commonResponseListVO.cntPerPage, result.commonResponseListVO.listTotalCount, result.commonResponseListVO.customList);
    }

    fn_grid_loadComplete(){

        $(this._cls_info.pagePrefix + " #grdMaster input[name='sortNo']").addClass("keycontrol numberonly");
        if (jsCommon) jsCommon.fn_keycontrol()

    }

    fn_item_choice(){
        var obj = $(this._cls_info.pagePrefix +  " input[type='radio'][name='radioBox']:checked")
        if (!obj || obj.length < 1){
            alert("선택한 상품이 없습니다.")
            return;
        }
        var data = {"itId":obj.val(), "itName":obj.attr("itName"), "caId":this._cls_info.searched_param.caId}
        
        this._cls_info.container.fn_popup_selected('confirm', this._cls_info.popName, this._cls_info.searched_param, data, null);

        $(this._cls_info.pagePrefix + " button[type='button'].btn.f_modalCancel").click();
        
    }

    fn_grid_row_click(rowid, status, e){
        var rowData = this._cls_info.jqgridMaster.fn_get_grid_data(rowid);

        $(this._cls_info.pagePrefix +  " input[type='radio'][name='radioBox'][value!='"+rowData.itId+"']").removeAttr("checked")
        $(this._cls_info.pagePrefix +  " input[type='radio'][name='radioBox'][value ='"+rowData.itId+"']").prop("checked", true);
    }
}

class JsHouseMngShopItemsRcmdView extends JsHouseMngListSearch{
    constructor(container, cssSelector) {
        super();

        this._cls_info = { pagePrefix:cssSelector
            , searched_param : null/* 뷰화면에서 받은 post값(리스트에서 항목을 선택한 후 뷰화면으로 이동을 한뒤)*/
            , receivedData : null/*데이터를 호출 한 후 받은 값*/
            , codeData : null/*검색 조건 등 코드성 데이터*/
        };

        this._cls_info.jqgridFormatter = new JsHouseJqgridFormatter();
        var gridOptions = {width : 1500, height:360
            , cmTemplate: {sortable: false}
            , "colModel":this.fn_initgrid_columns()
            // , "fn_page_paging_call":"fn_page_paging_call"
            // , "onSelectRow":"fn_grid_row_click"
            // , "onCellSelect":"fn_grid_cell_click"
            , "loadComplete":"fn_grid_loadComplete"
        };

        this._cls_info.jsRcmdRegister = new JsHouseMngShopItemsRcmdRegister(this, cssSelector + " .modal.item.register", "jsRcmdRegister");
        this._cls_info.jqgridMaster = new JsHouse2309PopupJqgrid(this, cssSelector, "#grdMaster", ""
        , gridOptions);
    }

    fn_popup_selected(alert_val, popName, popup_param, data, extra){
        console.log(alert_val, popName, popup_param, data)
        if (alert_val !== 'confirm'){
            return;
        }

        if (popName == 'jsRcmdRegister'){
            this.fn_item_add_call(data);
        }
    }

    /** jq그리드 컬럼 정의 */
	fn_initgrid_columns(){
		var owner = this;
		return [
            { name: "caId", hidden: true},
            {name :'checkBox',  index :'checkBox',   align:'center', cellattr: function () { return " class='items'" }
                    , label:'<input type="checkbox" onclick="jsCommon.fn_checkbox_name_checkall(\'checkBox\', this.checked)">'/**/
                    , editable: false, edittype:"checkbox",editoptions: {value:"Y:N"},formatter:owner.fn_grdm_chk_formatter
                    , formatoptions:{disabled:false}, sortable:false, width:20, classes : 'ctl checkbox'},
            { name: "sortNo", label: "노출순위", width: 30, align:'center' ,classes : "h44", formatter:owner.fn_grid_formatter_sortNo},
            { name: "itId", label: "상품ID", width: 100},
            
            { name: "itName", label: "상품명", width: 100},
            { name: "useYn", label: "노출여부", width: 20, align:'center', formatter:owner.fn_grid_formatter_useYn},
		];
	}
    
    fn_init(){
        this.fn_init_addevent();

        this.fn_search_call();
    }

    fn_init_addevent(){
        var owner = this;
        $(this._cls_info.pagePrefix + " .btn.list").off("click").on("click", function(event){
            owner.fn_move_list();
         });

        // $(this._cls_info.pagePrefix + " button[type='button'].btn.search").off("click").on("click", function(event){
        //    owner.fn_search_call();
        // });

        $(this._cls_info.pagePrefix + " button[type='button'].btn.item.register").off("click").on("click", function(event){
            owner._cls_info.jsRcmdRegister.fn_show_popup(owner._cls_info.searched_param)
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.item.sort.update").off("click").on("click", function(event){
            owner.fn_item_sort_call();
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.item.delete").off("click").on("click", function(event){
            owner.fn_item_del_call();
        });
    }

    fn_move_list(){
        var uri = './rcmdList.form' + location.search;
        
        jsCallApi.call_svr_post_move(uri, this._cls_info.searched_param);
    }

    fn_search_data(curPage){
        if (curPage == undefined || curPage.length < 1) curPage = 1;

        var param = {};

        param.categoryNm = $(this._cls_info.pagePrefix + " #srchValue").val();
        
        return param;
    }

    fn_search_call(curPage){
        var data = this._cls_info.searched_param;

		jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/category_item_list.json", 'fn_search_cb', data, null)

        // console.log(data)
    }
    fn_search_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || result.commonResponseListVO.customList == null){
            return;
        }

        this._cls_info.jqgridMaster.fn_data_bind(data.curPage, result.commonResponseListVO.cntPerPage, result.commonResponseListVO.listTotalCount, result.commonResponseListVO.customList);
    }

    fn_grid_formatter_sortNo(cellvalue, options, rowObject){
        var str = '<input type="text" class="form-control text-center" name="sortNo" itId="'+rowObject.itId+'" value="'+cellvalue+'" origin="'+cellvalue+'">'

        return str;
    }

    fn_grid_formatter_useYn(cellvalue, options, rowObject){
        var name = options.colModel.name;
        
        var row_id = rowObject.id;
        var id = row_id + "_" + options.colModel.name;

        var str = '<input type="checkbox" name="'+name+'" id="' + id + '"  row_id="' + row_id + '" itId="'+rowObject.itId+'" value="'+rowObject.itId+'"  origin="'+cellvalue+'" ';

        if (cellvalue == "Y"){
            str += ' checked ';
        }
        
        str += ' >';
        
        // console.log('fn_grdm_chk_formatter name=' + name + ', id='+id + ', value='+rowObject.order_item_id);
        return str;
    }

    fn_grid_loadComplete(){

        $(this._cls_info.pagePrefix + " #grdMaster input[name='sortNo']").addClass("keycontrol numberonly");
        if (jsCommon) jsCommon.fn_keycontrol()

    }

    fn_grdm_chk_formatter(cellvalue, options, rowObject){
        var grdName = options.gid;
        var name = options.colModel.name;
        
        var row_id = rowObject.id;
        var id = row_id + "_" + options.colModel.name;

        var str = '<input type="checkbox" name="'+name+'" id="' + id + '"  row_id="' + row_id + '" caId="'+rowObject.caId+'"  value="'+rowObject.itId+'" ';

        if (options.colModel.name == "extend_yn"){/*팝업에서 사용함*/
            if (rowObject["sale_kind_cd"] != "R"){
                str += ' disabled="true" ';
            }
            if (cellvalue == "Y"){
                str += ' checked ';
            }
        }
        
        str += ' >';
        
        // console.log('fn_grdm_chk_formatter name=' + name + ', id='+id + ', value='+rowObject.order_item_id);
        return str;
    };

    fn_item_sort_call(){
        
        var ifor, ilen = $(this._cls_info.pagePrefix + " #grdMaster input[name='sortNo']").length;
        var itIds = [], sortNos = [], useYns = [];;

        if (ilen != $(this._cls_info.pagePrefix + " #grdMaster input[name='useYn']").length){
            alert("갯수 오류")
            return;
        }
        var joTarget1, joTarget2;
        for(ifor=0 ; ifor<ilen ; ifor++){
            joTarget1 = $($(this._cls_info.pagePrefix + " #grdMaster input[name='sortNo']")[ifor]);
            joTarget2 = $($(this._cls_info.pagePrefix + " #grdMaster input[name='useYn']")[ifor]);
            
            if (joTarget1.val() == joTarget1.attr("origin") 
                && (joTarget2.is(':checked')?"Y":"N") == joTarget2.attr("origin")){
                continue;
            }

            if (joTarget1.val() == ""){
                alert("노출 순위를 입력하여 주십시오.")
                return;    
            }
            
            itIds.push(joTarget1.attr("itId"));
            sortNos.push(joTarget1.val()==""?0:joTarget1.val());
            useYns.push(joTarget2.is(':checked')?"Y":"N");
        }

        if (itIds.length < 1){
            alert("상태 변경할 대상이 존재하지 않습니다.")
            return;
        }

        if (!confirm("현재 설정된 노출 순위 및 노출 여부 상태를 전체 업데이트합니다. 업데이트 하시겠습니까?")){
            return;
        }

        var data = {"caId":this._cls_info.searched_param.caId, itIds, sortNos, useYns};

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/category_item_sort.json", 'fn_item_sort_cb', data, null)

        // console.log(data)
    }
    fn_item_sort_cb(result, fail, data, param){
        if (result == null || result.commonCheckVO == null){
            return;
        }

        if (result.commonCheckVO.errorMsg){
            alert(result.commonCheckVO.errorMsg)
            return;
        }

        this.fn_search_call();        

        alert("변경 되었습니다.")
    }

    fn_item_add_call(data){
        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/category_item_add.json", 'fn_item_add_cb', data, null)
    }
    fn_item_add_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null){
            return;
        }

        if (result.commonResponseListVO.errorMsg){
            alert(result.commonResponseListVO.errorMsg)
            return;
        }

        alert("추가 되었습니다.")

        this._cls_info.jqgridMaster.fn_data_bind(1, 99999, result.commonResponseListVO.listTotalCount, result.commonResponseListVO.customList);
    
    }

    fn_item_del_call(){
        var ifor, ilen = $(this._cls_info.pagePrefix + " #grdMaster input[name='checkBox']").length;
        var itIds = [];;

        var joTarget1, joTarget2;
        for(ifor=0 ; ifor<ilen ; ifor++){
            joTarget1 = $($(this._cls_info.pagePrefix + " #grdMaster input[name='checkBox']")[ifor]);
            if (!joTarget1.is(':checked')) {
                continue;
            }

            joTarget2 = $(this._cls_info.pagePrefix + " #grdMaster input[name='useYn'][itId='"+joTarget1.val()+"']");
            if (joTarget2.is(':checked')){
                alert("노출된 상품은 삭제가 불가능합니다.")
                return;
            }
            itIds.push(joTarget1.val());
        }

        if (itIds.length < 1){
            alert("삭제할 대상이 존재하지 않습니다.")
            return;
        }

        if (!confirm("삭제하시겠습니까?")){
            return;
        }

        var data = {"caId":this._cls_info.searched_param.caId, itIds};

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/category_item_del.json", 'fn_item_del_cb', data, null)

    }

    fn_item_del_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null){
            return;
        }

        if (result.commonResponseListVO.errorMsg){
            alert(result.commonResponseListVO.errorMsg)
            return;
        }

        this.fn_search_call();

        alert("삭제 되었습니다.")

        this._cls_info.jqgridMaster.fn_data_bind(1, 99999, result.commonResponseListVO.listTotalCount, result.commonResponseListVO.customList);
    }
}