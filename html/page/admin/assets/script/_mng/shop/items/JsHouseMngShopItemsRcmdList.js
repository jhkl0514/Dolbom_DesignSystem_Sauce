class JsHouseMngShopItemsRcmdList extends JsHouseMngListSearch{
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

        this._cls_info.jqgridMaster = new JsHouse2309PopupJqgrid(this, cssSelector, "#grdMaster", ""
        , gridOptions);
    }

    /** jq그리드 컬럼 정의 */
	fn_initgrid_columns(){
		var owner = this;
		return [
            { name: "caParName", hidden: true },
            { name: "caOrder", label: "노출순위", width: 15, align:'center' ,classes : "h44", formatter:owner.fn_grid_formatter_caOrder},
            { name: "caId", label: "분류코드", width: 20},
            { name: "saleKindNm", label: "구분", width: 20, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_saleKindNm(cellvalue, options, rowObject)
            }},
            { name: "caName", label: "카테고리", width: 100, formatter:owner.fn_grid_formatter_caName},
            { name: "caMove", label: "추천상품 관리", width: 20, align:'center', formatter:owner.fn_grid_formatter_caMove},
		];
	}
    
    fn_init(){
        this.fn_init_addevent();

        this.fn_search_call();
    }

    fn_init_addevent(){
        var owner = this;
        $(this._cls_info.pagePrefix + " button[type='button'].btn.search").off("click").on("click", function(event){
           owner.fn_search_call();
        });
        $(this._cls_info.pagePrefix + " button[type='button'].btn.category.order.update").off("click").on("click", function(event){
            owner.fn_category_order_call();
        });
    }

    fn_search_data(curPage){
        if (curPage == undefined || curPage.length < 1) curPage = 1;

        var param = {};

        param.categoryNm = $(this._cls_info.pagePrefix + " #srchValue").val();
        
        return param;
    }

    fn_search_call(curPage){
        var data = this.fn_search_data(curPage);
		
		this._cls_info.searched_param = data;

		jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/category_list.json", 'fn_search_cb', data, null)

        // console.log(data)
    }
    fn_search_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || result.commonResponseListVO.customList == null){
            return;
        }

        this._cls_info.jqgridMaster.fn_data_bind(data.curPage, result.commonResponseListVO.cntPerPage, result.commonResponseListVO.listTotalCount, result.commonResponseListVO.customList);
    }

    fn_grid_formatter_caOrder(cellvalue, options, rowObject){
        var str = '<input type="text" class="form-control text-center" name="caOrder" caId="'+rowObject.caId+'" value="'+cellvalue+'" origin="'+cellvalue+'">'

        return str;
    }
    fn_grid_formatter_caName(cellvalue, options, rowObject){
        if (rowObject.caParName){
            cellvalue = rowObject.caParName + " > "+ cellvalue
        }
        return cellvalue;
    }

    fn_grid_formatter_saleKindNm(cellvalue, options, rowObject){
        if (rowObject.caId && rowObject.caId.length > 2){
            if (rowObject.caId.substr(0, 2) == "10"){
                return "판매";
            } else if (rowObject.caId.substr(0, 2) == "20"){
                return "대여";
            }
        }
        return cellvalue;
    }

    fn_grid_formatter_caMove(cellvalue, options, rowObject){
        var str = '<button type="button" class="btn-primary btn caMove" caId="'+rowObject.caId+'">등록/관리</button>'
        return str;
    }

    fn_grid_loadComplete(){
        var owner = this;

        $(this._cls_info.pagePrefix + " #grdMaster input[name='caOrder']").addClass("keycontrol numberonly");
        if (jsCommon) jsCommon.fn_keycontrol()

        $(this._cls_info.pagePrefix + " button.btn.caMove").off("click").on("click", function(event){
            var uri = './rcmdView.form' + location.search;
            
            var data = Object.assign({}, owner._cls_info.searched_param);
            data.caId = $(this).attr('caId');
            // console.log(data);
            
            jsCallApi.call_svr_post_move(uri, data);
        });

    }

    fn_category_order_call(){
        var data = {};
        var ifor, ilen = $(this._cls_info.pagePrefix + " #grdMaster input[name='caOrder']").length;
        var joTarget;
        for(ifor=0 ; ifor<ilen ; ifor++){
            joTarget = $($(this._cls_info.pagePrefix + " #grdMaster input[name='caOrder']")[ifor]);

            if (joTarget.val() == ""){
                alert("노출 순위를 입력하여 주십시오.")
                return;    
            }
            if (joTarget.val() != joTarget.attr("origin")){
                data[joTarget.attr("caId")] = joTarget.val();
            }
            
        }

        if (Object.keys(data).length < 1){
            alert("변경된 노출 순위가 존재하지 않습니다.")
            return;
        }

        if (!confirm("현재 설정된 노출 순위 전체 업데이트합니다. 업데이트 하시겠습니까?")){
            return;
        }

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/items/category_order.json", 'fn_category_order_cb', data, null)

        // console.log(data)
    }
    fn_category_order_cb(result, fail, data, param){
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
}