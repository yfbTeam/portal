<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YQSYIndex.aspx.cs" Inherits="PMSWeb.YQSYIndex" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>北京市延庆区十一学校</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" /> 
    <link href="/YQSY/css/reset.css" rel="stylesheet" type="text/css" />
    <link href="/YQSY/css/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="/Scripts/jquery-1.11.2.min.js"></script>
    <script src="/Scripts/Common.js"></script>
    <script src="/YQSY/js/common.js"></script>
    <script src="/Scripts/jquery.tmpl.js"></script>
    <script src="/YQSY/js/jquery.SuperSlide.2.1.1.js"></script>
    <style>
        .slider {
            width: 485px;
            height: 272px;
            position: relative;
            overflow: hidden;
            float: left;
        }

            .slider li {
                width: 485px;
                height: 272px;
            }

                .slider li a {
                    display: block;
                    width: 485px;
                    height: 272px;
                    overflow: hidden;
                }

                    .slider li a img {
                        width: 100%;
                    }

            .slider .prev {
                cursor: pointer;
                display: none;
                position: absolute;
                width: 45px;
                height: 45px;
                top: 0;
                left: 0;
                bottom: 0;
                margin: auto auto auto 5px;
                z-index: 100;
                background: url(/YQSY/images/sprite-clean.png) no-repeat -1px -1px;
            }

            .slider .next {
                cursor: pointer;
                display: none;
                position: absolute;
                width: 45px;
                height: 45px;
                top: 0;
                right: 0;
                bottom: 0;
                margin: auto 5px auto auto;
                background: url(/YQSY/images/sprite-clean.png) no-repeat -1px -47px;
                z-index: 100;
            }

        .descrition_bg {
            height: 35px;
            width: 485px;
            background: #000;
            opacity: 0.8;
            filter: alpha(opacity=80);
            position: absolute;
            bottom: 0px;
            z-index: 100;
        }

        .descrition {
            height: 35px;
            width: 485px;
            text-align: center;
            font-size: 14px;
            color: #fff;
            line-height: 35px;
            position: absolute;
            bottom: 0px;
            z-index: 111;
        }
    </style>
    <script id="item_zxdd" type="text/x-jquery-tmpl">
        <li>
            <span class="mun">${pageIndex()}</span>
            <span class="text">
                <a href="/YQSY/SitePages/BeforeView.aspx?id=${MenuId}&advId=${Id}" target="_blank">${NameLengthUpdate(Description,25)}</a>
            </span>
            <span class="date"><a>${DateTimeConvert(CreateTime,'MM-dd')}</a></span>
        </li>
    </script>
     <script id="item_zxddimg" type="text/x-jquery-tmpl">
        <li>
            <a href="/YQSY/SitePages/BeforeView.aspx?id=${MenuId}&advId=${Id}" target="_blank">
                <img src="${Img}" />
                <div class="descrition_bg"></div>
                <p class="descrition">${NameLengthUpdate(Description,15)}</p>
            </a>
        </li>
    </script>
     <script type="text/x-jquery-tmpl" id="modult">
         <div class="center_left fl">
            <div class="entrance">
                <div class="title">
                    <p>
                        <span class="tit_left fl">
                            <img src="/YQSY/images/icon01.png">
                            <a class="tit">${Name}</a>
                        </span>
                        <span class="tit_right fr" style="display: block">
                            <a href="/YQSY/SitePages/BeforeItemList.aspx?pid=0&id=${Id}""">更多</a>
                        </span>
                    </p>
                </div>
                <div class="content">
                    <div>
                        <ul class="icon" style="display: block">
                            <li>
                                <img src="/YQSY/images/contents_pic${index}.jpg">
                            </li>
                        </ul>
                    </div>
                    <ul class="li_list" id="lists_${Id}">   
                        
                    </ul>    
                </div>
            </div>
        </div>
    </script>
    <script id="item_list" type="text/x-jquery-tmpl">
        <li>
            <img src="/YQSY/images/point.png" />
            <span class="text"><a href="/YQSY/Sitepages/BeforeView.aspx?id=${MenuId}&advId=${Id}&selectPid=${p_ID}" target="_blank">${Description}</a></span>
            <span class="date">
                <a>${DateTimeConvert(CreateTime,'MM-dd')}</a>
            </span>
        </li>
    </script>
    <script type="text/x-jquery-tmpl" id="item_syslink">
        <li>
            <a target="_blank" href="${Href}" style="background: url(${ImageUrl}) no-repeat scroll center center rgba(0, 0, 0, 0);background-size:cover;"></a>
        </li>
    </script>
    <script>
        $(function () {
            $("#header_top").load('/YQSY/Header.aspx');
            $('#footer').load('/YQSY/bottom.aspx');
        })
    </script>
</head>
<body>
    <div id="header_top" style="min-height:355px;"></div>
    <div class="center" id="centerwrap">
         <!--最新动态-->
        <div id="newRead" class="center_con_top main clearfix">
            <div class="slider">
                <ul class="51buypic" id="list_zxddimg">
                </ul>
                <div class="prev"></div>
                <div class="next"></div>
            </div>
            <div class="campus_alerts fr">
                <div class="title">
                    <p>
                        <span class="tit_left fl">
                            <img src="/YQSY/Images/icon.png" /><a class="tit">最新导读</a><a class="english"></a></span>
                    </p>
                </div>
                <div class="content">
                    <ul class="li_list" id="list_zxdd">

                    </ul>
                </div>
            </div>
        </div>
        <div class="center_con_center main" >
            <div id="modult_wrap" style="margin-left:-20px;">>

            </div>
        </div>
        <div class="center_con_bottom main">
            <div class="entrance_link main">
		        <div class="title">
                    <p>
                        <span class="tit_left fl"><a href="javascript:;">友情链接</a></span>
                        <span class="tit_right fr"><a href="javascript:;"></a></span>
                    </p>
                </div>
		        <div class="content_link img_show">
		           <ul id="list_SysLink">
                   </ul>
		        </div>
		    </div>
        </div>
    </div>
    <div id="footer" style="height:112px;"></div>

    <script type="text/javascript">
        var PortalTreeDataListDic = new Array();;
        function GetPortalTreeDataByPId() {
            $.ajax({
                url: "/Common.ashx",
                type: "post",
                dataType: "json",
                data: {
                    PageName: "DYYX/AdminManagerHandler.ashx",
                    Func: "GetPortalTreeDataByPId",
                    IsDelete: 0,
                    Display: 0,
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        var items = [];
                        items = json.result.retData;
                        for (var i = 0; i < items.length; i++) {
                            PortalTreeDataListDic[items[i].Id] = items[i];
                        }
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        $(function () {
            //GetPortalTreeDataByPId();
            initZXDD(1, 9);
            initModult();
            initLINK();
        })
        function initZXDD(startIndex, pageSize) {
            $.ajax({
                url: "/Common.ashx",
                type: "post",
                async: false,
                dataType: "json",
                data: {
                    PageName: "DYYX/AdvertisingHandler.ashx",
                    Func: "GetPageListForMenuId",
                    PageIndex: startIndex,
                    PageSize: pageSize,
                    isPush: 1
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        $("#list_zxdd").html('');
                        var items = json.result.retData.PagedData;
                        var newItems = items;
                        var imgs = [];
                        if (newItems != null && newItems.length > 0) {
                            for (var i = 0; i < newItems.length; i++) {
                                if (newItems[i].ImageUrl != "") {
                                    var img = ImgIndex(newItems[i].ImageUrl);
                                    var obj = new Object();
                                    obj.Img = img;
                                    obj.Description = newItems[i].Description;
                                    obj.Id = newItems[i].Id;
                                    obj.MenuId = newItems[i].MenuId;
                                    imgs.push(obj);
                                }
                            }
                            if (imgs.length > 0) {
                                $("#item_zxddimg").tmpl(imgs).appendTo("#list_zxddimg");
                                jQuery(".slider").hover(function () { jQuery(this).find(".prev,.next").stop(true, true).fadeIn() }, function () { jQuery(this).find(".prev,.next").fadeOut() });
                                $(".slider").slide({
                                    titCell: ".num ul", mainCell: ".51buypic", effect: "fold", autoPlay: true, delayTime: 1200, autoPage: true
                                });
                            } else {
                                $("#list_zxddimg").html("<li><img src=\"/YQSY/images/default.jpg\" /></li>");
                            }
                            $("#item_zxdd").tmpl(items).appendTo("#list_zxdd");
                        } else {
                            $("#list_zxddimg").html("<li><img src=\"/YQSY/images/default.jpg\" /></li>");
                        }

                    }
                    else {
                        $("#list_zxdd").html("<li>暂无信息！</li>");
                        $("#list_zxddimg").html("<li><img src=\"/YQSY/images/default.jpg\" /></li>");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function initModult() {
            $.ajax({
                type: "Post",
                url: "/Common.ashx",
                dataType: "json",
                data: {
                    "PageName": "DYYX/AdvertisingHandler.ashx",
                    "func": "GetMenusItemsData",
                    "IsDelete": 0,
                    "PageIndex": 1,
                    "isPush": 1,
                    "isAll": true,
                    "IsShowIndex": 1,
                    "DisplayCount": 5
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        $('#modult_wrap').html('');
                        var titles = json.result.retData;
                        titles = titles.map(function (obj, index) {
                            obj.index = index+1;
                            return obj
                        })
                        if (titles != null && titles.length > 0) {
                            $("#modult").tmpl(titles).appendTo("#modult_wrap");
                        } else {
                            $("#modult").html("暂无数据");
                        }
                        for (i = 0; i < titles.length; i++) {
                            var title = titles[i];
                            var newlists = title.ListData;
                            //使用循环遍历的模式将赋予 selectedID(通过这种方式进行变色的依据，数据绑定)
                            if (newlists != null && newlists.PagedData != null) {
                                var _list = newlists.PagedData;
                                for (var j in _list) {
                                    _list[j].p_ID = title.Id;
                                }
                            }

                            //数据绑定
                            if (newlists != null && newlists.PagedData.length > 0) {
                                $("#item_list").tmpl(newlists.PagedData).appendTo('#lists_' + title.Id);
                            } else {
                                $('#lists_' + title.Id).html('<li><img src="/YQSY/images/point.png"><span class="text"><a href="javascript:;" target="_blank">暂无数据</a></span></li>');
                            }
                        }
                    } else {
                        $("#modult").html("暂无数据");
                    }
                },
                error: OnError
            });

        }
        //友情链接
        function initLINK() {
            $.ajax({
                url: "/Common.ashx",
                type: "post",
                async: false,
                dataType: "json",
                data: {
                    PageName: "/DYYX/AdminManagerHandler.ashx",
                    Func: "GetLinkList",
                    IsPage: true,
                    PageIndex: 1,
                    pageSize: 12
                },
                success: function (json) {
                    if (json.result.errNum.toString() == "0") {
                        $("#list_SysLink").html('');
                        var items = json.result.retData.PagedData;
                        if (items != null && items.length > 0) {
                            $("#item_syslink").tmpl(items).appendTo("#list_SysLink");
                        } else {
                            $("#list_SysLink").html("暂无数据");
                        }
                    }
                    else {
                        $("#list_SysLink").html("暂无数据");
                    }
                },
                error: OnError
            });
        }
        function ImgIndex(path) {
            if (path == null || path == "") return "";
            var imgs = path.split(',');
            return imgs[0];
        }

    </script>
</body>
</html>