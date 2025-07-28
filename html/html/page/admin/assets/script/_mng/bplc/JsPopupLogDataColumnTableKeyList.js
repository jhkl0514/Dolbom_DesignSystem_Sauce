class JsPopupLogDataColumnTableKeyList extends JsPopupLoadingFormDataBaseWithDataTables{
	constructor(container, cssSelector, popName, popStep, popUrl, dataUrl, popOptions) {
        
        super(container, cssSelector, popName, popStep, popUrl, dataUrl, popOptions);

		this._cls_info.searched_yn = "N"
		this._cls_info.searched_param = null;
        this._cls_info.loadedFormYn = true;

		this._cls_info.codeData = {};
		this._cls_info.codeData.consultAbleType = {"0":"없음", "16" : "인정등급", "32" : "복지용구", "64" : "재가센터", "128" : "요양정보", "240" : "전체"};

		var gridOptions = {width : 1200, height:300
						, cmTemplate: {sortable: false}
						, "colModel":this.fn_initgrid_columns()
						};

		this._cls_info.popupJqgrid = new JsHouse2309PopupJqgrid(this, cssSelector, "#popGrdMaster", ""
				, gridOptions);

				
    }

    
	/** jq그리드 컬럼 정의 */
	fn_initgrid_columns(){
		var owner = this;
		return [
			{ name: "logMSeq", hidden: true },
			{ name: "logDSeq", hidden: true },
			{ name: "tableNm", hidden: true },
            { name: "originKey1", hidden: true },
            { name: "originKey2", hidden: true },
			{ name: "columnNm", label: "컬럼명", width: 70 ,classes : "addclass"},
            { name: "columnDisp", label: "컬럼설명", width: 70 ,classes : "addclass"},
			{ name: "originVal", label: "수정 전", classes : "addclass", formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_ConsltAbleType(cellvalue, options, rowObject)
            }},
			{ name: "changedVal", label: "수정 후", classes : "addclass", formatter :  function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_ConsltAbleType(cellvalue, options, rowObject)
            }},
            { name: "mngrId", label: "변경자", width: 50 ,classes : "addclass"},
			{ name: "regDt", label: "변경일자", width: 70 ,classes : "addclass"},
			
			
			/*{ name: "lastHistory", label: "이전이력", width: 35 },*/
		];
	}
	
    fn_loading_all_result_data(){
        this._cls_info.popupJqgrid.fn_data_bind(1, 1000, 1000, this._cls_info.dataAllResult.customList);
    }
	
	fn_grid_formatter_ConsltAbleType(cellvalue, options, rowObject){
		
		if (rowObject["tableNm"] == 'BPLC' && rowObject["columnNm"] == 'consultAbleType'){
			if (cellvalue == "0") return this._cls_info.codeData.consultAbleType[cellvalue];
			else if (cellvalue == "240") return this._cls_info.codeData.consultAbleType[cellvalue];

			return this.fn_convert_ConsltAbleType(cellvalue);
		}else{
			return cellvalue;
		}
	}

	fn_convert_ConsltAbleType(consltAbleType){
		consltAbleType = parseInt(consltAbleType);

		var list = [];
		var val;

		val = 128; if (val > 0 && (consltAbleType & val) > 0){ consltAbleType -= val; list.push(this._cls_info.codeData.consultAbleType[val.toString()]); }
		val =  64; if (val > 0 && (consltAbleType & val) > 0){ consltAbleType -= val; list.push(this._cls_info.codeData.consultAbleType[val.toString()]); }
		val =  32; if (val > 0 && (consltAbleType & val) > 0){ consltAbleType -= val; list.push(this._cls_info.codeData.consultAbleType[val.toString()]); }
		val =  16; if (val > 0 && (consltAbleType & val) > 0){ consltAbleType -= val; list.push(this._cls_info.codeData.consultAbleType[val.toString()]); }

		return list.join(", ")
	}
}