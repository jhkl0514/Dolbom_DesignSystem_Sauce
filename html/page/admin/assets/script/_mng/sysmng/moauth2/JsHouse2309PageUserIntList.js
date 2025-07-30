
class JsHouse2309PageUserIntList extends JsHouse2309PageJqgridBase{
    fn_page_condition(){
        return {
                curPage:this._cls_info.grdMasterPageNo
                , cntPerPage:this._cls_info.grdMasterPageSize
            };
    }
    fn_page_sub(){
        this._cls_info.urlService = "/_mng/sysmng/moauth2/list.json"
    }

    /** jq그리드 컬럼 정의 */
    fn_initgrid_columns(){
        var owner = this;
        return [
            { name: "userNm", label: "이름", width: 100 ,classes : "addclass"},
            { name: "brDt", label: "생년월일", width: 75, align: "center", sorttype: "date",
                formatter: "date", formatoptions: { newformat: "Y-m-d" } , formatter:owner.fn_grdm_date_formatter},
            { name: "phoneNo", label: "전화번호", width: 65},
            { name: "eml", label: "이메일", width: 59 },
            { name: "gender", label: "성별", width: 87, align: "center", formatter: "select",
                formatoptions: { value: "M:남성;W:여성" } }
        ];
    }

    fn_grdm_date_formatter(cellvalue, options, rowObject){
        return new Date(cellvalue).format("yyyy-MM-dd");
    }
}