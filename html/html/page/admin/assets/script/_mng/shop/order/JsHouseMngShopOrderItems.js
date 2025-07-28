class JsHouseMngShopOrderItems{
    constructor(container, cssSelector){
        this._cls_info = { pagePrefix:cssSelector, pagePopPrefix:undefined
            
            , searched_data : null/* 뷰화면에서 받은 post값(리스트에서 항목을 선택한 후 뷰화면으로 이동을 한뒤)*/
            , codeData : null
            , detail_data : null
            , received_data_last : null
            , received_data_origin : null
        };

        var gridOptionsLast = {width : 1500, height:160
            , cmTemplate: {sortable: false}
            , "colModel":this.fn_initgrid_columnsLast()
            // , "fn_page_paging_call":"fn_page_paging_call"
            // , "onSelectRow":"fn_grid_row_click"
            // , "onCellSelect":"fn_grid_cell_click"
            , "loadComplete":"fn_grid_loadCompleteLast"
        };


        this._cls_info.jqgridItemsLast = new JsHouse2309PopupJqgrid(this, cssSelector, "#popGrdItemsLast", ""
            , gridOptionsLast);

        var gridOptionsOrigin = {width : 1500, height:160
                , cmTemplate: {sortable: false}
                , "colModel":this.fn_initgrid_columnsOrigin()
                // , "fn_page_paging_call":"fn_page_paging_call"
                // , "onSelectRow":"fn_grid_row_click"
                // , "onCellSelect":"fn_grid_cell_click"
                , "loadComplete":"fn_grid_loadCompleteOrigin"
            };
        this._cls_info.jqgridItemsOrigin = new JsHouse2309PopupJqgrid(this, cssSelector, "#popGrdItemsOrigin", ""
            , gridOptionsOrigin);
    }

    fn_detail_get_cb(result){
        this._cls_info.detail_data = result;

        if (this._cls_info.received_data_last){
            this.fn_grid_bind();
        }
    }

    /** jq그리드 컬럼 정의 */
	fn_initgrid_columnsLast(){
		var owner = this;
		return [
			{ name: "ordIId", hidden: true },
            { name: "delYn", hidden: true  },
            { name: "itId", hidden: true },
            { name: "ioId", hidden: true },
            { name: "careIoId", hidden: true  },
            { name: "ordStatusCd", hidden: true },
            
            { name: "longtermCategoryName", label: "카테고리", width: 50 ,classes : "h44"},
            { name: "itIdDisp", label: "상품/옵션", formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_itId_disp(cellvalue, options, rowObject)
            }},
            { name: "ordQuantity", label: "수량", width: 25, align:'right', formatter : "integer"},
            { name: "ordSelfPrice", label: "본인부담금", width: 50, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_ordSelfPrice(cellvalue, options, rowObject)
            }},
            { name: "ordStatusDisp", label: "주문상태", width: 50, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_orderStatusCd(cellvalue, options, rowObject)
            }},
            { name: "deliveryNum", label: "송장번호/취소및반품사유", width: 100, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_deliveryNum(cellvalue, options, rowObject);
            }},
		];
	}

    fn_initgrid_columnsOrigin(){
		var owner = this;
		return [
			{ name: "ordIId", hidden: true },
            { name: "delYn", hidden: true  },
            { name: "tempDelYn", hidden: true },
            { name: "deliveryCompanyCd", hidden: true },
            { name: "itId", hidden: true  },
            { name: "ioId", hidden: true  },
            { name: "careIoId", hidden: true  },
            { name: "ordStatusCd", hidden: true },
            
            { name: "longtermCategoryName", label: "카테고리", width: 50 ,classes : "h44"},
            { name: "itIdDisp", label: "상품/옵션", formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_itId_disp(cellvalue, options, rowObject)
            }},
            { name: "ordQuantity", label: "수량", width: 25, align:'right', formatter : "integer"},
            { name: "ordSelfPrice", label: "본인부담금", width: 50, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_ordSelfPrice(cellvalue, options, rowObject)
            }},
            { name: "ordStatusDisp", label: "주문상태", width: 50, formatter:function (cellvalue, options, rowObject){
                return owner.fn_grid_formatter_orderStatusCd(cellvalue, options, rowObject)
            }},
            { name: "deliveryNum", label: "송장번호", width: 100, formatter:function (cellvalue, options, rowObject){
                return "-"
            }},
		];
	}
    fn_carehost(carehost){
        this._cls_info.carehost = carehost;
    }
    fn_init(){
        // this.fn_init_addevent();

    }

    fn_code_received(param){
        this._cls_info.codeData = param;
    }

    fn_show_popup(param){
        
        this._cls_info.searched_param = param;

        // $(this._cls_info.pagePrefix).modal('show');

        this.fn_search_call();
    }

    fn_search_call(){
        let data = this._cls_info.searched_param;
        

        jsCallApi.call_api_post_json(this, "/_mng/dolbom/shop/order/items.json", 'fn_search_cb', data, null)
    }
    fn_search_cb(result, fail, data, param){
        if (result == null || result.commonResponseListVO == null || !result.commonResponseListVO.success || result.commonResponseListVO.customList == null){
            return;
        }
        
        this._cls_info.received_data_origin = null;
        this._cls_info.received_data_last = result.commonResponseListVO.customList;
        
        

        $(this._cls_info.pagePrefix + " #DELIVERYFirstMEMO").addClass('hidden');
        if (result.commonResponseListVO.customMap != null){
            if (result.commonResponseListVO.customMap.shopOrderDeliveryInfo != null){
                $(this._cls_info.pagePrefix + " #DELIVERYMEMO .table-detail tr td").html(result.commonResponseListVO.customMap.shopOrderDeliveryInfo.deliveryMemoEtc);
            }else{
                $(this._cls_info.pagePrefix + " #DELIVERYMEMO .table-detail tr td").html('');
            }

            if (result.commonResponseListVO.customMap.shopOrderDeliveryFirstInfo != null){
                $(this._cls_info.pagePrefix + " #DELIVERYFirstMEMO .table-detail tr td").html(result.commonResponseListVO.customMap.shopOrderDeliveryFirstInfo.deliveryMemoEtc);
                $(this._cls_info.pagePrefix + " #DELIVERYFirstMEMO").removeClass('hidden');

                $(this._cls_info.pagePrefix + " #DELIVERYMEMO .text-title2").html('최종 배송메모');
                
            }else{
                $(this._cls_info.pagePrefix + " #DELIVERYMEMO .text-title2").html('배송메모');
            }
            
            if (result.commonResponseListVO.customMap.listAll != null){
                this._cls_info.received_data_origin = result.commonResponseListVO.customMap.listAll;
            }
            if (result.commonResponseListVO.customMap.listCareDeliveryNumVO != null){
                this._cls_info.received_data_caredelivery = result.commonResponseListVO.customMap.listCareDeliveryNumVO;
            }

            if (result.commonResponseListVO.customList.length == result.commonResponseListVO.customMap.listAll.length){
                $(this._cls_info.pagePrefix + " .fsItemsOrigin").addClass("hidden");
                $(this._cls_info.pagePrefix + " .fsItemsLast .text-title2").html("주문요청상품");
                
            }else{
                $(this._cls_info.pagePrefix + " .fsItemsOrigin").removeClass("hidden");
                $(this._cls_info.pagePrefix + " .fsItemsLast .text-title2").html("최종 주문요청상품");
            }

            if (result.commonResponseListVO.customMap.shopOrderMemoLItemDel != null){
                if (result.commonResponseListVO.customMap.shopOrderMemoLItemDel.length < 1){
                    $(this._cls_info.pagePrefix + " #ITEMDEL").addClass("hidden");
                }else{
                    $(this._cls_info.pagePrefix + " #ITEMDEL").removeClass("hidden");
                    $(this._cls_info.pagePrefix + " #ITEMDEL .table-detail tr").remove();

                    var itemone, str, list = [];
                    for(var ifor=0 ; ifor<result.commonResponseListVO.customMap.shopOrderMemoLItemDel.length ; ifor++){
                        itemone = result.commonResponseListVO.customMap.shopOrderMemoLItemDel[ifor];
                        str = "<tr><td>"+itemone.memoTxt+"</td></tr>"
                        list.push(str);
                    }
    
                    $(this._cls_info.pagePrefix + " #ITEMDEL .table-detail").html(list.join(''))
                }
                
            }
        }
        
        
        if (this._cls_info.detail_data){
            this.fn_grid_bind();
        }
        
    }

    fn_grid_bind(){
        this._cls_info.jqgridItemsLast.fn_data_bind(1, 99999999, 99999999, this._cls_info.received_data_last);
        if (this._cls_info.received_data_origin && this._cls_info.received_data_origin.length > 0){
            this._cls_info.jqgridItemsOrigin.fn_data_bind(1, 99999999, 99999999, this._cls_info.received_data_origin);
        }
    }

    fn_grid_loadCompleteLast(){
        console.log('fn_grid_loadCompleteLast')
    }
    fn_grid_loadCompleteOrigin(){
        var owner = this;
        $(this._cls_info.pagePrefix + " .btn.delivery.trace").off("click").on("click", function(event){
            owner.fn_delivery_trace($(this));
         });
    }
    
    
    fn_grid_formatter_itId_disp(cellvalue, options, rowObject){
        var arrItems = undefined;
        if (options.gid == 'popGrdItemsOrigin' ){
            if (this._cls_info.received_data_origin != undefined){
                arrItems = this._cls_info.received_data_origin;
            }
        }else{
            if (this._cls_info.received_data_last != undefined){
                arrItems = this._cls_info.received_data_last;
            }
        }
        
        if (arrItems == undefined) return;

        const find2 = arrItems.find((element, index, arr) => element.ordIId == rowObject["ordIId"]);


        let itName = rowObject["itName"], ioId = rowObject["ioId"];

        if (!ioId) ioId = '';

        if (ioId.length > 0){
            var jsonIoId = null;

            try{
                jsonIoId = JSON.parse(rowObject["ioId"])
            }catch{

            }

            if (jsonIoId){
                var ioList = [];
                for(var ifor=0 ; ifor<jsonIoId.length ; ifor++){
                    var itemone = jsonIoId[ifor];

                    ioList.push(itemone.title + ": " + itemone.value);
                }

                ioId = "<br>"+ioList.join('/ ')
            }
            
        }
        
        return itName + ioId;
    }

    fn_grid_formatter_orderStatusCd(cellvalue, options, rowObject){
        if (rowObject["delYn"] == 'Y'){
            return '상품삭제';
        }
        if (this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[rowObject["ordStatusCd"]] == undefined){
            return rowObject["ordStatusCd"];    
        }

        return this._cls_info.codeData.SHOP_ORDER_STATUS_MNG[rowObject["ordStatusCd"]];
    }

    fn_grid_formatter_deliveryNum(cellvalue, options, rowObject){
        if (options.gid == 'popGrdItemsOrigin' ) return '-';
        
        var strTemp;
        if (rowObject["ordStatusCd"] && rowObject["canclResn"]  && rowObject["canclResn"] != "" && (rowObject["ordStatusCd"] == 'DBO510' || rowObject["ordStatusCd"] == 'DBO820' || rowObject["ordStatusCd"] == 'DBO830') ){
            strTemp = rowObject["canclResn"];
        }else if (false && cellvalue && cellvalue.length > 1 && rowObject["deliveryCompanyCd"] && rowObject["deliveryCompanyCd"].length > 1 ){
            /*기존 db방식에서 wmdscall방식으로 변경*/
            var deliveryNm = this._cls_info.codeData.SHOP_ORDER_DELIVERY_COMPANY_MAP[rowObject["deliveryCompanyCd"].toUpperCase()];
            if (!deliveryNm) deliveryNm = rowObject["deliveryCompanyCd"];
        
             strTemp = '<p class="btn delivery trace shadow w-full diflex" deliveryNm="{0}" deliveryNum="{1}">{0}<br>({1})</p>'.format(deliveryNm, cellvalue);
        }else if (this._cls_info.received_data_caredelivery && this._cls_info.received_data_caredelivery.length > 0){
            
            return this.fn_grid_find_DeliveryNum(this._cls_info.detail_data.shopOrderMasterVO.ordMCd, rowObject["itId"], rowObject["careIoId"]);
        }else{
            strTemp = '';
        }

        return  strTemp;
    }

    fn_grid_find_DeliveryNum(ordMCd, itId, ioId){
        if (this._cls_info.received_data_caredelivery == null || this._cls_info.received_data_caredelivery.length < 1){
            return '';
        }

        var item = this._cls_info.received_data_caredelivery.find((item) => {return item.ordMCd==ordMCd && item.itId==itId && item.ioId==ioId});
        if (!item) return '';

        var deliveryNm = this._cls_info.codeData.SHOP_ORDER_DELIVERY_COMPANY_MAP[item["ctDeliveryCompany"].toUpperCase()];
        if (!deliveryNm){
            deliveryNm = item["ctDeliveryCompany"].toUpperCase();
        }

        return '<p class="btn delivery trace shadow w-full diflex" deliveryNm="{0}" deliveryNum="{1}">{0}<br>({1})</p>'.format(deliveryNm, item["ctDeliveryNum"]);
    }
    
    fn_grid_formatter_ordSelfPrice(cellvalue, options, rowObject){
        return cellvalue.format_money() + "("+this._cls_info.searched_param.selfBndRt+"%)";
    }
     
    fn_delivery_trace(jobj){
        if (!jobj.attr("deliveryNm") ){
            return;
        }
        if (!jobj.attr("deliveryNum") ){
            return;
        }

        const encoded = encodeURI(jobj.attr("deliveryNm") + " " + jobj.attr("deliveryNum"));
        
        
        var url = "https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=0&ie=utf8&query=";
        url = url + encoded ;
        window.open(url, '_blank');
    }
}