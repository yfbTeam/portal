<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bottom.aspx.cs" Inherits="PMSWeb.YQSY.bottom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" /> 
    <title></title>
</head>
<body>
    <div class="bottom">
        <p><a>十一学校　版权所有 ©</a></p>
        <p><a href="/Admin/Index.aspx" target="_blank">后台入口</a></p>
        <div style="width:300px;margin:0 auto; text-align:center;">
		 	<a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=11022902000233" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">
                 <img src="/YQSY/images/police.png" style="float:left;">
                 <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#FFFFFF;">京公网安备 11022902000233号</p>
		 	</a>
		</div>
        <div style="width:300px;margin:0 auto; text-align:center;">
		 	<a target="_blank" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;">
                    <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#FFFFFF;">京ICP备 11016879号 </p>
		 	</a>
		</div>
    </div>
    <span id="_ideConac"><a href="//bszs.conac.cn/sitename?method=show&amp;id=2F53A122D984791AE053022819ACE9B8" target="_blank"><img id="imgConac" vspace="0" hspace="0" border="0" src="//dcs.conac.cn/image/blue.png" data-bd-imgshare-binded="1"></a></span>


        <div class="ADs" id="ADS">
	        <div class="cs_close"><a onclick="$('.ADs').fadeOut()" href="javascript:;"><span>关闭</span></a></div>
        </div>

    <script>
        $(function () {
            init();
        })
        function init() {
            $.ajax({
                type: "Post",
                url: "/Common.ashx",
                async: false,
                dataType: "json",
                data: {
                    "PageName": "DYYX/AdvertisingHandler.ashx",
                    "func": "GetAdvertising",
                    "MenuId": 5,
                    "IsDelete": 0,
                    "PageIndex": 1,
                    "PageSize":1,
                    "isPush": 1
                },
                success: function (json) {
                   
                    if (json.result.errMsg == "success") {
                        var imgSrc = json.result.retData[0].ImageUrl;
                        var str = '<a href="javascript:;"><img src="' + imgSrc + '" /></a>'
                        $('#ADS').append(str);

                    } else {
                        $('#ADS').hide();
                    }
                },
                error: OnError
            });
        }
    </script>
</body>
</html>
