

<link rel="stylesheet" href="/html/core/script/free-jqgrid/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="/html/core/style/jqgrid.css">

<script type="text/javascript" src="/html/core/script/free-jqgrid/jquery.jqgrid.src.js"></script>

<script type="text/javascript" src="/html/core/script/JsHouse2309PageJqgridBase.js"></script>

<script type="text/javascript" src="/html/page/admin/assets/script/_mng/sysmng/moauth2/JsHouse2309PageUserIntList.js"></script>

<div class="page-content" width="800px">
    <div class="grid-con" width="100%">
        <table id="grdMaster" width="98%"></table>
        <div id="grdMPager"></div>
    </div>
    
</div>

<div class="modal-con">
    
</div>

<script>
    //<![CDATA[
    var grdMaster = null;

    $(document).ready(function(){
        grdMaster = new JsHouse2309PageUserIntList(".con-con", ".modal-con");

        grdMaster.fn_page_init();
        grdMaster.fn_initgrid_main("#grdMaster", "#grdMPager", {});
        grdMaster.fn_page_second_call();

        // $("select.branch").searchable();
    });

    //]]>
    </script>