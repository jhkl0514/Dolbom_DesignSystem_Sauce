
/*
	popOptions.consultAbleTypeInitNum
*/
class JsHouseMngBplcModal extends JsPopupLoadingFormDataBaseWithDataTables{
	constructor(container, cssSelector, popName, popStep, popUrl, dataUrl, popOptions) {
        
        super(container, cssSelector, popName, popStep, popUrl, dataUrl, popOptions);

		this._cls_info.searched_yn = "N"
		this._cls_info.searched_param = null;

		var gridOptions = {width : 1200, height:360
						, cmTemplate: {sortable: false}
						, "colModel":this.fn_initgrid_columns()
						, "fn_page_paging_call":"fn_page_paging_call"
						, "onSelectRow":"fn_grid_row_click"
						, "onCellSelect":"fn_grid_cell_click"};

		this._cls_info.popupJqgrid = new JsHouse2309PopupJqgrid(this, cssSelector, "#popGrdMaster", "#popGrdPager"
				, gridOptions);

				
    }

	fn_msg_empty_datatable(){
        return '해당하는 사업소가 존재하지 않습니다.';
    }

	fn_set_consult_sttus(str){
		if (str != undefined && str.length > 0){
			this._cls_info.consultStatus = JSON.parse(str);
		}
		
	}
	fn_set_prevPathJson(str){
		if (str != undefined && str.length > 0){
			this._cls_info.prevPathJson = JSON.parse(str);
		}
		
	}

	fn_loading_form_cls(){
          
    }

	fn_init_third_component(){
		var owner = this;

		var consultAbleTypeAllNum = this._cls_info.popOptions.consultAbleTypeAllNum;
		var consultAbleTypeInitNum = this._cls_info.popOptions.consultAbleTypeInitNum;

		var jsConsultAbleType = owner._cls_info.jsConsultAbleType = new JsCheckboxAll3StateList(owner._cls_info.pageModalfix + " .checkbox-group.searchAllConsultAbleType-group", "searchAllConsultAbleType", consultAbleTypeAllNum);
		jsConsultAbleType.set_checked_values(consultAbleTypeInitNum);

		this._cls_info.jsConsultAbleType = jsConsultAbleType;

		if (hangjungdong.sido != undefined && hangjungdong.sido.length > 0){
			var ifor, ilen = hangjungdong.sido.length;
			var option;
			for(ifor=0 ; ifor<ilen ; ifor++){
				option = '<option value="'+hangjungdong.sido[ifor].sido+'">'+hangjungdong.sido[ifor].codeNm+'</option>';
				
				$(owner._cls_info.pageModalfix + " #modalSrchSido").append(option);
			}
		}

		this.fn_loading_form_cls();
    }

	
	fn_modal_bplc_search_gugun_bind(sido){
		var owner = this;
		if (hangjungdong.sigugun == undefined && hangjungdong.sigugun.length == 0){
			return;
		}
		
		$(owner._cls_info.pageModalfix + " #modalSrchGugun").empty();
	
		var founded = hangjungdong.sigugun.filter((item) => item.sido == sido);
		var ifor, ilen = founded.length;
		var option = '<option value="">선택</option>';
		
		$(owner._cls_info.pageModalfix + " #modalSrchGugun").append(option);
		for(ifor=0 ; ifor<ilen ; ifor++){
			option = '<option value="'+founded[ifor].sigugun+'" code="'+founded[ifor].code+'" latitude="'+founded[ifor].latitude+'" longitude="'+founded[ifor].longitude+'">'+founded[ifor].codeNm+'</option>';
			
			$(owner._cls_info.pageModalfix + " #modalSrchGugun").append(option);
		}
	}

	/** jq그리드 컬럼 정의 */
	fn_initgrid_columns(){
		var owner = this;
		return [
			{ name: "uniqueId", hidden: true },
			{ name: "bplcId", hidden: true },
			{ name: "rcmdCnt", hidden: true },
			{ name: "consltCs04BplcUniqueId", hidden: true },
			{ name: "rejectBplcUniqueId", hidden: true },
			{ name: "radio", label: "", width: 15 ,classes : "addclass", align:'center', formatter :  owner.fn_grid_radio_fotmat},
			{ name: "bplcNm", label: "장기요양기관명", width: 70 ,classes : "addclass"},
			{ name: "addr", label: "주소", classes : "addclass"},
			{ name: "picTelno", label: "전화번호<br>(담당자)", width: 40 ,classes : "addclass"},
			{ name: "dist", label: "거리<br>(km)", width: 25 ,classes : "addclass", align:'center' , formatter :  owner.fn_grid_dist_fotmat},
			{ name: "autoMatchingPoint", label: "순위", width: 15 ,classes : "addclass", align:'center'},
			{ name: "manualMatchingCnt", label: "수동매칭<br>(지난30일)", width: 25, align:'center'},
			{ name: "lastHistory", label: "이전이력", width: 70
				, formatter : function (cellValue, option){
									return owner.fn_grid_lastHistory_fotmat(cellValue, option);
								}
			},
		];
	}
	
	fn_grid_radio_fotmat(cellValue, option){
		return '<input type="radio" name="radio_' + option.gid + '" rowId="' + option.rowId + '" value="' + option.rowData.uniqueId + '"/>';
	}
	fn_grid_dist_fotmat(cellValue, option){
		if (cellValue == undefined){
			return "";
		}else if (cellValue == "-1.0000"){
			return "없음";
		}else if (cellValue == "-2.0000"){
			return "-";
		}

		var dist = undefined;
		try{
			dist = parseInt(cellValue)
		}catch{

		}

		if (dist != undefined){
			return dist.format_money();
		}else{
			return cellValue;
		}
	}
	fn_grid_lastHistory_fotmat(cellValue, option){
		

		if (option.rowData != undefined){
			if (option.rowData.consltCs04BplcUniqueId != undefined && option.rowData.consltCs04BplcUniqueId.length > 0){
				return "매칭 제외 기관";
			}
			if (option.rowData.rejectBplcUniqueId != undefined && option.rowData.rejectBplcUniqueId.length > 0){
				return "기존 매칭 거절";
			}
		}
		
		if (cellValue == undefined || cellValue.length < 1) return "";

		var jObj;
		try{
			jObj = JSON.parse(cellValue);
		}catch{
			return "";
		}

		if (jObj.type == "MBR_CONSLT"){
			var consultStatus = "", prevPathNm = "";
			if (jObj.CONSLT_STTUS == undefined || jObj.CONSLT_STTUS.length < 1) {
				consultStatus = "";
			}else if (!this._cls_info.consultStatus || this._cls_info.consultStatus[jObj.CONSLT_STTUS] == undefined){
				consultStatus = "";	
			}else{
				consultStatus = this._cls_info.consultStatus[jObj.CONSLT_STTUS]
			}
			if (jObj.PREV_PATH == undefined || jObj.PREV_PATH.length < 1) {
				prevPathNm = "";
			}else if (!this._cls_info.prevPathJson || this._cls_info.prevPathJson[jObj.PREV_PATH] == undefined){
				prevPathNm = "";	
			}else{
				prevPathNm = this._cls_info.prevPathJson[jObj.PREV_PATH]
			}

			if (prevPathNm == "" && consultStatus == ""){
				return "";
			}

			return prevPathNm + " / " +  consultStatus + " / " + jObj.REG_DT.formatDate("yyyy.MM.dd");
			
		}else{
			return "";
		}
		
	}

	fn_page_init_click(){
        var owner = this;

		$(owner._cls_info.pageModalfix + ' ul.nav.tab-list li.nav-item a').off('click').on('click', function(){
            owner.fn_tab_changed();
        });

		$(owner._cls_info.pageModalfix + ' #modalSrchBplcBtn').off('click').on('click', function(){
            owner.fn_modal_bplc_search_call(1);
        });

        $(owner._cls_info.pageModalfix + ' #modalSrchBplcBtn').off('click').on('click', function(){
            owner.fn_modal_bplc_search_call(1);
        });

		$(owner._cls_info.pageModalfix + ' .f_modalSelBplc').off('click').on('click', function(){
            owner.fn_modal_select_click();
        });

        
        $(owner._cls_info.pageModalfix + " #modalSrchSido").change(function() {
			owner.fn_modal_bplc_search_gugun_bind($(this).val());
		});
    }

	fn_tab_changed(){
		
		var rcmdtnYn = $(this._cls_info.pageModalfix + ' ul.nav.tab-list li.nav-item a.active').data("rcmdtn-yn")

		if (rcmdtnYn == "Y"){
			this._cls_info.popupJqgrid.fn_grid_height(360);
		}else{
			this._cls_info.popupJqgrid.fn_grid_height(160);
		}
		
		this.fn_modal_bplc_search_call(1);
	}

	fn_apply_hangjungdong(param){
		if (hangjungdong.sido != undefined && hangjungdong.sido.length > 0){
			$(this._cls_info.pageModalfix + " #modalSrchSido option:contains('" + param.sidoNm + "')").attr("selected", "selected");

			this.fn_modal_bplc_search_gugun_bind($(this._cls_info.pageModalfix + " #modalSrchSido").val());

			$(this._cls_info.pageModalfix + " #modalSrchGugun option:contains('" + param.sigugunNm + "')").attr("selected", "selected");
		}
	}

	fn_show_popup(param){
		super.fn_show_popup(param);

		if (this._cls_info.searched_yn == "N"){
			this.fn_apply_hangjungdong(param);

			this.fn_modal_bplc_search_call(1);
		}
		
	}

	fn_grid_row_click(rowid, status, e){
		var rowdata = this._cls_info.popupJqgrid.fn_get_grid_data(rowid);

		$(this._cls_info.pageModalfix + ' ' + this._cls_info.popupJqgrid._cls_info.gridId +' input[type="radio"][name="radio_popGrdMaster"][rowid="'+rowid+'"]').prop('checked', 'checked');		

		console.log('fn_grid_row_click', rowdata)
	}
	fn_grid_cell_click(rowid, iCol, cellcontent, e){
		console.log('fn_grid_cell_click')
	}
	
	
	fn_modal_bplc_search_option(){
		var owner = this;
		var rcmdtnYn = $(owner._cls_info.pageModalfix +" .nav.tab-list .active").data("rcmdtn-yn");

		var param = {"rcmdTab":rcmdtnYn, lat:owner._cls_info.popup_param.lat, lot:owner._cls_info.popup_param.lot};
		
		if (owner._cls_info.popup_param.consltNo){
			param.consltNo = owner._cls_info.popup_param.consltNo;
		}else if (owner._cls_info.popup_param.ordMId){
			param.ordMId = owner._cls_info.popup_param.ordMId;
		}
		
		param.mbrUniqueId = owner._cls_info.popup_param.mbrUniqueId;
		param.recipientsNo = owner._cls_info.popup_param.recipientsNo;
		
		if (owner._cls_info.popup_param.zipHCode != undefined && owner._cls_info.popup_param.zipHCode.length > 5){
			param.srchConsltGugunHCd5 = owner._cls_info.popup_param.zipHCode.substring(0,5);
		}else{
			param.srchConsltGugunHCd5 = '';
		}

		param.mbGiupMatching = 'Y';
		if (rcmdtnYn == 'Y'){
			param.srchInsteadRcperrcognYn = $(owner._cls_info.pageModalfix +" input[name='searchRcmdtnInsteadRcperrcognYn']:checked").val();
			param.srchConsultAbleType = owner._cls_info.popup_param.matchingAbleTypeNum;

			if (owner._cls_info.popup_param.recipientsLongtermConfirmYn == undefined || owner._cls_info.popup_param.recipientsLongtermConfirmYn != 'Y'){
				param.srchHandleNoRcperrcognYn = "Y";
			}

			if (owner._cls_info.popup_param.zipHCode != undefined && owner._cls_info.popup_param.zipHCode.length > 5){
				param.srchGugunHCd5 = owner._cls_info.popup_param.zipHCode.substring(0,5);
			}
		}else{
			var sum = 0; 
			this._cls_info.jsConsultAbleType.get_checked_values().forEach( num => { sum += parseInt(num); });
			param.srchConsultAbleType = sum;

			param.srchInsteadRcperrcognYn = $(owner._cls_info.pageModalfix +" input[name='searchAllInsteadRcperrcognYn']:checked").val(); 
			param.srchHandleNoRcperrcognYn = $(owner._cls_info.pageModalfix +" input[name='searchAllHandleNoRcperrcognYn']:checked") .val();
			// param.srchConsltAutoTy = $(owner._cls_info.pageModalfix +" input[name='searchAllConsltAutoTy']:checked").val();

			param.srchSidoHCd = ($(owner._cls_info.pageModalfix +" #modalSrchSido").val() == ""?  "":$(owner._cls_info.pageModalfix +" #modalSrchSido").val());
			param.srchGugunHCd5 = ($(owner._cls_info.pageModalfix +" #modalSrchGugun").val() == "")?"":$(owner._cls_info.pageModalfix +" #modalSrchGugun option:selected").attr("code").substring(0,5);
			param.srchBplcNm = $(owner._cls_info.pageModalfix +" #modalSrchText").val();
			param.srchBplcCd = $(owner._cls_info.pageModalfix +" #modalSrchId").val();
		}
		
		return param;
	}

	fn_modal_bplc_search_call(curPage){
		var param = this.fn_modal_bplc_search_option();

		param.curPage = curPage;
		param.cntPerPage = this._cls_info.popupJqgrid.fn_get_cntPerPage();
		
		this._cls_info.searched_param = param;

		jsCallApi.call_api_post_json(this, "/_mng/members/bplc/bplcSearchListWithConslt.json", 'fn_modal_bplc_search_cb', param, null)
	}
	fn_modal_bplc_search_cb(result, fail, data, param){
		this._cls_info.searched_yn = "Y";
		console.log(data)
		console.log(result)
		// this.fn_loading_all_result_convert();

		this._cls_info.popupJqgrid.fn_data_bind(data.curPage, result.iTotalDisplayRecords, result.iTotalRecords, result.aaData);
	}

	fn_modal_bplc_search_cb_convert(aaData){
		var ifor, ilen = aaData.length;
		var objJson;
		var stemp ;
		for(ifor=0 ; ifor<ilen ; ifor++){
			if (aaData[ifor].lastHistory != undefined && aaData[ifor].lastHistory.length > 0){
				stemp = "";
				objJson = JSON.parse(aaData[ifor].lastHistory);
				
				if (objJson.CONSLT_STTUS != undefined && this._cls_info.consultStatus[objJson.CONSLT_STTUS] != undefined){
					stemp += this._cls_info.consultStatus[objJson.CONSLT_STTUS];
					
				}
				if (objJson.REG_DT != undefined){
					stemp += " " + objJson.REG_DT.formatDate("yyyy.MM.dd")
				}

				aaData[ifor].lastHistory = stemp;
			}
			
		}

		return aaData;
	}

	fn_modal_select_click(){
		var owner = this;
		var objChecked = $(this._cls_info.pageModalfix + ' ' + this._cls_info.popupJqgrid._cls_info.gridId +' input[type="radio"][name="radio_popGrdMaster"]:checked');	

		if (objChecked == null || objChecked.length < 1){
			alert("선택된 사업소가 없습니다.");
			return;
		}

		var rowData = this._cls_info.popupJqgrid.fn_get_grid_data();

		let uniqueId = rowData.uniqueId;
		let bplcId = rowData.bplcId;
		let bplcNm = rowData.bplcNm;
		let picTelno = rowData.picTelno;
		let rcmdCnt = rowData.rcmdCnt;

		if (this._cls_info.popup_param && this._cls_info.popup_param.originBplcUniqueId == uniqueId){
			alert("기존 사업소와 동일한 사업소입니다.")
			return;
		}

		var data = {uniqueId, bplcId, bplcNm, picTelno, rcmdCnt};

		this._cls_info.container.fn_popup_selected('confirm', this._cls_info.popName, this._cls_info.popup_param, data, null);

		$(owner._cls_info.pageModalfix + " .f_modalCancel").click();
	}

	fn_page_paging_call(curPage){
		this.fn_modal_bplc_search_call(curPage);
	}
}
