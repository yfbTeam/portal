<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Header.aspx.cs" Inherits="PMSWeb.YQSY.Header" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
     <div class="toptop">
        <div class="top">
            <!--头部上面的logo-->
            <div class="top_top">
                <div class="top_top_con main clearfix" id="SearchAdd">
                    <div class="logo fl">
                        <a onclick="ResponstUrl('/YQSYIndex.aspx')">
                            <img src="/YQSY/images/logo.png" /></a>
                    </div>
                </div>
            </div>
            <!--头部下面的 nav-->
            <div class="top_bottom">
                <div class="nav">
                    <div id="navbar" class="main">
                        <div class="nav_a">
                            <ul class="nav_b" id="menuList">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bannertop"></div>
    <script>
        $(function () {
            initMenu();
        })
        function initMenu() {
            $.ajax({
                type: "Post",
                url: "/Common.ashx",
                async: false,
                dataType: "json",
                data: {
                    "PageName": "DYYX/AdminManagerHandler.ashx",
                    "func": "GetBeforeMenu",
                    "IsDelete": 0,
                    "Display": 0,
                    "BeforeAfter": 0
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        $("#menuList").html("");
                        $("#menuList").html(json.result.retData);

                        $('.xiala').hover(function () {
                            $(this).find('dt').addClass('hover');
                            $(this).find(".lie").show();
                        }, function () {
                            $(this).find('dt').removeClass('hover');
                            $(this).find(".lie").hide();
                        });
                        //var length = $('#menuList>li').length;
                        //var width = 100 / length + '%';
                        //$('#menuList>li').width(width);
                       // $('.lie ul.liea li').css('width', '100%');
                    }
                },
                error: OnError
            });
        }
        function ResponstUrl(url) {
            window.parent.window.location.href = url;
        }
    </script>
</body>
</html>
