﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeList.aspx.cs" Inherits="PMSWeb.DYYX.SitePages.NoticeList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" /> 
    <title>大峪第一小学</title>
    <link href="/DYYX/css/reset.css" rel="stylesheet" />
    <link href="/DYYX/css/layout.css" rel="stylesheet" id="mystylesheet" />
    <script src="/Scripts/jquery-1.11.2.min.js"></script>
    <script src="/Scripts/Common.js"></script>
    <script src="/DYYX/js/layout.js"></script>
    <script src="/Scripts/jquery.tmpl.js"></script>
    <script src="/Scripts/PageBar.js"></script>
    <script src="/Scripts/layer/layer.js"></script>
     <script>
         $(function () {
             $('#header').load('/DYYX/Header.aspx');
             $('#footer').load('/DYYX/bottom.aspx');
         })
    </script>
    <script id="tr_leftTree" type="text/x-jquery-tmpl">
        {{if PId!=0}}
        <li>{{if Id!=$("#HMenuId").val()}}
            <a href="${BeforeUrl}" target="_self" class="">${Name}</a>
            {{else}}
            <a href="${BeforeUrl}" target="_self" class="visited">${Name}</a>
            {{/if}}
        </li>
        {{/if}}
    </script>
    <script id="item_data" type="text/x-jquery-tmpl">
        <li>
            <img src="/DYYX/images/point.png">
            <span class="text"><a href="/DYYX/SitePages/NoticeView.aspx?id=${MenuId}&advId=${Id}" target="_blank">${Title}</a></span>
            <span class="date">
                <a>${DateTimeConvert(CreateTime,'yyyy-MM-dd')}</a>
            </span>
        </li>
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HMenuId" runat="server" />
        <asp:HiddenField ID="HPMenuId" runat="server" />
        <asp:HiddenField ID="PageNumber" runat="server" />
        <div class="ADs">
            <div class="cs_close">
                <a href="javascript:;" onclick="$('.ADs').fadeOut()"><span>关闭</span></a>
            </div>
            <img src="/DYYX/images/ads.jpg" />
        </div>
                 <div id="header" style="height:400px;"></div>


        <div class="clear"></div>
        <div class="center">
            <div class="centercontent">
                <div class="center_con main" id="initheight">
                    <div class="maintopLeft" style="float: left;">
                        <div class="left_nav">
                            <h2 id="hTitle"></h2>
                            <div class="left_navcon">
                                <ul class="con_wenzi" id="div_leftTree">
                                </ul>
                            </div>
                            <div class="footer"></div>
                        </div>
                    </div>
                    <div class="maintopRight">
                        <div id="crumb">
                           <div><a href="/DYYXIndex.aspx">首页</a> &gt;&gt;<a href="#" id="menuPNav"></a>&gt;&gt;<a href="#" id="menuNav"></a></div>
                        </div>
                        <div class="entrance">
                            <div class="moretitle">
                                <p>
                                    <span class="tit_left fl">
                                        <img src="/DYYX/images/icon01.png">
                                        <a class="tit">课程建设</a>
                                        <a class="english"></a>
                                    </span>
                                    <span class="tit_right" style="display: none">
                                        <a href="">更多</a>
                                    </span>
                                </p>
                            </div>
                            <div class="content">
                                <ul class="li_list" id="list_data">
                                </ul>
                            </div>
                        </div>
                        <div class="pagination">
                            <span id="pageBar"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--footer-->

        <div id="footer" style="height:68px;"></div>

        <div id="top"></div>
    </form>
    <script type="text/javascript">
        $(function () {
            getData(1, 5);
            leftTree();
        })

        function getData(startIndex, pageSize) {
            //初始化序号 
            pageNum = (startIndex - 1) * pageSize + 1;
            $.ajax({
                url: "/Common.ashx",
                type: "post",
                async: false,
                dataType: "json",
                data: {
                    "PageName": "DYYX/NoticesHandler.ashx",
                    "func": "GetPageList",
                    "PageIndex": startIndex,
                    "PageSize": pageSize,
                    "isPush": 1,
                    "MenuId": $("#HMenuId").val()
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        $("#list_data").html('');
                        $("#item_data").tmpl(json.result.retData.PagedData).appendTo("#list_data");
                        makePageBar(getData, document.getElementById("pageBar"), json.result.retData.PageIndex, json.result.retData.PageCount, pageSize, json.result.retData.RowCount);
                    }
                    else {
                        $("#list_data").html(" <li> 暂无数据！ </li>");
                        $("#pageBar").html("");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

        function leftTree() {
            $.ajax({
                url: "/Common.ashx",
                type: "post",
                async: false,
                dataType: "json",
                data: {
                    PageName: "DYYX/AdminManagerHandler.ashx",
                    Func: "GetPortalTreeDataForChildId",
                    MenuId: $("#HMenuId").val()
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        $("#div_leftTree").html('');
                        var items = json.result.retData;
                        $("#tr_leftTree").tmpl(items).appendTo("#div_leftTree");
                        if (items != null) {
                            for (var i = 0; i < items.length; i++) {
                                if (items[i].PId == "0") {
                                    $("#hTitle").html(items[i].Name);
                                    $("#menuPNav").html(items[i].Name);
                                    $('#menuPNav').attr('href', items[i].BeforeUrl)
                                }
                                if (items[i].Id == $("#HMenuId").val()) {
                                    $("#menuNav").html(items[i].Name);
                                    $('#menuNav').attr('href', items[i].BeforeUrl)
                                    $(".tit").html(items[i].Name);
                                    $(".english").html(items[i].EnName);
                                }
                            }
                        }
                    }
                    else {
                        $("#div_leftTree").html("暂无数据！");
                    }
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {

                }
            });
        }

    </script>
</body>
</html>
