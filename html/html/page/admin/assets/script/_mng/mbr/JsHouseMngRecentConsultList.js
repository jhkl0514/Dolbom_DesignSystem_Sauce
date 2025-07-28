class JsHouseMngRecentConsultList extends JsHouseMngListSearch{
    constructor(container, cssSelector) {
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

        this._cls_info.jqgridMaster = new JsHouse2309PopupJqgrid(this, cssSelector, "#grdMaster", "#grdPager"
        , gridOptions);
    }
    fn_post_data(postdata){/*이전 검색 조건*/
        this._cls_info.searched_param = postdata;
    }

    fn_init(){
        // $(this._cls_info.pagePrefix + " button[type='button'].btn.search").click();

        this.fn_code_get_call(["CONSLT_STTUS3", "PREV_PATH"])
    }

    fn_code_get_cb(result, fail, data, param){
        if (result == null || result.commonCheckVO == null || !result.commonCheckVO.success || result.commonCheckVO.customMap == null){
            return;
        }
        this._cls_info.codeData = result.commonCheckVO.customMap;
        
        this.fn_search_call(1);
    }

    
    /** jq그리드 컬럼 정의 */
	fn_initgrid_columns(){
		var owner = this;
		return [
			{ name: "mbrUniqueId", hidden: true },
            { name: "recipientsNo", hidden: true },
            { name: "consltSttus", hidden: true},
            { name: "prevPath", hidden: true},
            { name: "consltNo", label: "번호", width: 15, align:'center' ,classes : "h44"},
            // { name: "ordStatusCd", label: "주문상태", width: 25, formatter:function (cellvalue, options, rowObject){
            //     return owner.fn_grid_formatter_ordStatusCd(cellvalue, options, rowObject)
            // }},
            { name: "regDt", label: "상담 신청일시", width: 25, formatter:'date', formatoptions: {newformat:'Y-m-d H:i:s'}, formatter:owner._cls_info.jqgridFormatter.fn_formatter_timestamp_date},
            { name: "consltSttusNm", label: "상담 진행상태", width: 25, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_consltSttusNm(cellvalue, options, rowObject)
            }},
            { name: "prevPathNm", label: "상담 유형", width: 25, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_prevPathNm(cellvalue, options, rowObject)
            }},
            { name: "consltResultList", label: "사업소 배정", formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_consltResultList(cellvalue, options, rowObject)
            }},
		];
	}

    fn_search_recipient(recipientsNo){
        this._cls_info.searched_param.recipientsNo = recipientsNo;

        this.fn_search_call(1);
    }

    fn_search_call(curPage){
        var data = Object.assign({}, this._cls_info.searched_param);
		data.curPage = curPage;
        data.cntPerPage = this._cls_info.jqgridMaster.fn_get_cntPerPage();
		// this._cls_info.searched_param = data;

		jsCallApi.call_api_post_json(this, "/_mng/mbr/recipients/getRecentlyConsult.json", 'fn_search_cb', data, null)

        // console.log(data)
    }
    fn_search_cb(result, fail, data, param){
        if (result == null || result.customList == null){
            return;
        }

        this._cls_info.jqgridMaster.fn_data_bind(result.curPage, result.cntPerPage, result.listTotalCount, result.customList);
    }

    fn_grid_formatter_prevPathNm(cellvalue, options, rowObject){
        if (this._cls_info.codeData.PREV_PATH && this._cls_info.codeData.PREV_PATH[rowObject["prevPath"]]){
            return this._cls_info.codeData.PREV_PATH[rowObject["prevPath"]];
        }else{
            return rowObject["prevPath"];
        }

        
    }
    fn_grid_formatter_consltSttusNm(cellvalue, options, rowObject){
        if (this._cls_info.codeData.CONSLT_STTUS3 && this._cls_info.codeData.CONSLT_STTUS3[rowObject["consltSttus"]]){
            return this._cls_info.codeData.CONSLT_STTUS3[rowObject["consltSttus"]];
        }else{
            return rowObject["consltSttus"];
        }
    }
    fn_grid_formatter_consltResultList(cellvalue, options, rowObject){
        if (!rowObject.consltSttus || rowObject.consltSttus == 'CS01' || !rowObject.consltResultList || rowObject.consltResultList.length < 1){
            return '-';
        }
        
        var arrTemp = [], itemone;
        for(var ifor=0 ; ifor<rowObject.consltResultList.length ; ifor++){
            itemone = rowObject.consltResultList[ifor];
            arrTemp.push((ifor+1)+"차 : " + itemone.bplcNm + "("+(new Date(itemone.regDt)).format("yyyy-MM-dd HH:mm")+")")
        }

        return arrTemp.join('');
    }
    
    fn_grid_loadComplete(data){
        console.log('fn_grid_loadComplete', data)
        var owner = this;
    }

    fn_page_paging_call(pageNo){
        this.fn_search_call(pageNo);
    }
}