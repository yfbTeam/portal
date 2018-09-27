﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeEdit.aspx.cs" Inherits="PMSWeb.Admin.NoticeEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="renderer" content="webkit" />
    <title></title>
    <link rel="stylesheet" type="text/css" href="/Admin/AdminCss/reset.css" />
    <link rel="stylesheet" type="text/css" href="/Admin/AdminCss/common.css" />
    <link rel="stylesheet" type="text/css" href="/Admin/AdminCss/repository.css" />
    <link href="/Admin/AdminCss/onlinetest.css" rel="stylesheet" />
    <script src="/Scripts/jquery-1.11.2.min.js"></script>

    <%--      <script type="text/javascript" charset="utf-8" src="/Scripts/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Scripts/ueditor/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/Scripts/ueditor/lang/zh-cn/zh-cn.js"></script>--%>
    <script src="/Scripts/layer/layer.js"></script>
    <script src="/Scripts/ajaxfileupload.js"></script>
    <script src="/Scripts/KindUeditor/kindeditor.js"></script>
    <script src="/Scripts/KindUeditor/plugins/code/prettify.js"></script>
    <script src="/Scripts/KindUeditor/lang/zh_CN.js"></script>

    <script src="/Scripts/jquery.cookie.js"></script>
    <script src="/Scripts/Common.js"></script>
    <script src="/Scripts/My97DatePicker/WdatePicker.js"></script>
    <script>
        Check_CurrentUser();
    </script>
    <style>
        #dndArea {
            width: 475px;
        }

        .ui-upload-input {
            position: absolute;
            top: 0px;
            right: 0px;
            height: 100%;
            cursor: pointer;
            opacity: 0;
            filter: alpha(opacity:0);
            z-index: 999;
            font-size: 100px;
        }

        .ui-upload-holder {
            position: relative;
            width: 100px;
            height: 27px;
            border: 1px solid silver;
            overflow: hidden;
            border-radius: 3px;
            cursor: pointer;
        }

        .ui-upload-txt {
            position: absolute;
            top: 0px;
            left: 0px;
            width: 100px;
            height: 27px;
            line-height: 27px;
            text-align: center;
            background: #0097DD none repeat scroll 0% 0%;
            color: #fff;
            font: 12px "微软雅黑";
            vertical-align: middle;
            padding: 5px 0px;
            cursor: pointer;
        }

        .settingsd {
            padding: 20px;
        }

            .settingsd table tr td {
                border: 1px solid #ccc;
                padding: 10px;
            }

        .shgnchuanbottom {
            width: 102px;
            height: 30px;
            margin-left: 70px;
        }


        .h-ico {
            display: inline-block;
        }

        .imgShow {
            width: 80px;
            height: 100px;
        }

        .course_manage .crumbs {
            border: none;
        }

        .course_form_div label, .course_form_diva label {
            width: 70px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <input type="hidden" id="NoticeId" runat="server" />
        <asp:HiddenField ID="MenuId" runat="server" />
        <input type="hidden" id="HFilePath" />
        <input type="hidden" id="HFileName" />
        <input type="hidden" id="HUserName" />
        <div style="background: #fff">
            <div class="newcourse_dialog_detail">
                <div class="clearfix">

                    <div class="clearfix">
                        <div class="course_form_div clearfix">
                            <label for="">标题：</label>
                            <input type="text" placeholder="标题" class="text" id="Title" value="" />
                            <i class="stars"></i>
                        </div>
                        <div class="course_form_diva clearfix">
                            <label for="" class="fl">内容：</label>
                            <div style="width: 88%; float: left;">
                                <textarea id="editor_id" name="content" style="width: 100%; height: 500px;">
                                </textarea>
                                <%--   <script id="editor" type="text/plain" style="width: 100%;">
                            </script>--%>
                            </div>
                        </div>
                        <div class="course_form_div clearfix">
                            <label for="">是否置顶：</label>
                            <input type="radio" name="Hot" value="1" checked />是<input type="radio" name="Hot" value="0" />否
                        </div>
                        <div class="course_form_div clearfix">
                            <label for="">是否发布：</label>
                            <input type="radio" name="isPush" value="1" checked />是<input type="radio" name="isPush" value="0" />否
                        </div>
                        <div class="course_form_div clearfix">
                            <label for="">排序：</label>
                            <input type="text" placeholder="排序" class="text" id="SortId" />
                            <i class="stars"></i>
                        </div>
                        <div class="course_form_div clearfix">
                            <label for="">点击量：</label>
                            <input type="text" placeholder="点击量" class="text" id="ClickNum" />
                            <i class="stars"></i>
                        </div>
                        <div class="course_form_div clearfix">
                            <label for="">文档：</label>
                            <div class="shangchuan">
                                <div class="shgnchuantop fl mt5" id="imgshow1">
                                    <span id="filemsg"></span>
                                </div>
                                <div class="shgnchuanbottoma fl ml20">
                                    <div class="ui-upload-holder">
                                        <div class="ui-upload-txt">
                                            点击上传
                                        </div>
                                        <input id="fileToUpload1" type="file" size="45" name="fileToUpload1" class="input ui-upload-input bluebutton dianjisc"
                                            style="margin-top: 0;" />
                                    </div>
                                </div>
                                <div id="divUpload1" style="display: none;">
                                    <img id="loading1" src="AdminImg/ajaxfileloading.gif" class="img-rounded" />
                                </div>
                            </div>
                        </div>
                        <div class="course_form_div clearfix">
                            <label for="">时间：</label>
                            <input type="text" class="Wdate text" id="StarDate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="height: 26px; border: 1px solid #9ec5e2; border-radius: 2px; width: 178px;" runat="server" />
                            <i class="stars"></i>
                        </div>
                        <div style="clear: both"></div>

                        <div class="course_form_select clearfix tc">
                            <a class="course_btn confirm_btn" onclick="saveData()" id="btnCreate">确定</a>
                            <a href="javascript:window.history.go(-1);" class="course_btn confirm_btn">返回</a>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $("#fileToUpload1").on("change", function () {
                ajaxFileUpload($(this));
            });
            //window.UEDITOR_CONFIG.serverUrl = window.UEDITOR_CONFIG.serverUrl + "?UploadParams=UploadImgForAdvertContent";
            //window.editor = UE.getEditor('editor');
            //iniNotice();
            KindEditor.ready(function (K) {
                window.editor = K.create('#editor_id', {
                    uploadJson: '../../Handler/UploadImage.ashx?action=UploadImgForAdvertContent',
                    allowFileManager: false,//true时显示浏览服务器图片功能。
                    allowImageRemote: true,//网络图片
                    resizeType: 0,
                    items: [
                         'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'code', 'cut', 'copy', 'paste',
                         'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                         'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                         'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                         'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                         'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                          'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                         'anchor', 'link', 'unlink', '|', 'about'
                    ],
                    afterUpload: function (data) {
                        if (data.result) {
                            //data.url 处理
                        } else {

                        }
                    },
                    afterError: function (str) {
                        //alert('error: ' + str);
                    }
                });
                iniNotice();
            });
            GetUserInfoCookie();
        })

        function ajaxFileUpload(event) {
            var e = event ? event : (window.event ? window.event : null);
            var uploadId = $(e).attr("id");
            if (!/\.(doc|docx|xls|xlsx|pdf|ppt|pptx|swf|flv|mp4|rar|zip)$/.test($(e).val().toLowerCase())) {
                layer.alert("必须是文档、音频、视频中的一种类型！");
                return false;
            }
            if (uploadId == "fileToUpload1") {
                $("#divUpload1").show();
                $.ajaxFileUpload(
                    {
                        url: '/Handler/UploadImage.ashx',
                        secureuri: false,
                        fileElementId: 'fileToUpload1',
                        dataType: 'json',
                        data: { action: "UploadWordForContent" },
                        success: function (data, status) {
                            if (data.result) {
                                if (uploadId == "fileToUpload1") {
                                    var imgpath = decodeURIComponent(data.path);
                                    $("#HFilePath").val(imgpath);
                                    $("#HFileName").val(data.name);
                                    $("#filemsg").html(data.name);
                                    $("#divUpload1").hide();
                                }
                            } else {
                                $("#divUpload1").hide();
                                layer.msg(data.desc);
                            }

                        },
                        error: function (data, status, e) {
                            $("#divUpload1").hide();
                            layer.msg(e);
                        }
                    }
                )
            }
        }

        function iniNotice() {
            if ($("#NoticeId").val() != "") {
                $.ajax({
                    type: "Post",
                    url: "/Common.ashx",
                    async: false,
                    dataType: "json",
                    data: {
                        "PageName": "DYYX/NoticesHandler.ashx",
                        "func": "GetNoticeInfo",
                        "Id": $("#NoticeId").val()
                    },
                    success: function (json) {
                        if (json.result.errNum == 0) {
                            var item = json.result.retData;
                            if (item != null) {
                                $("#Title").val(item.Title);
                                editor.html(item.Contents);
                                //editor.setContent(item[0].CreativeHTML);
                                $('input[name=Hot][value=' + item.Hot + ']').prop('checked', true);
                                $('input[name=isPush][value=' + item.isPush + ']').prop('checked', true);
                                $("#SortId").val(item.SortId);
                                $("#HFilePath").val(item.FilePath);
                                $("#HFileName").val(item.FileName);
                                $("#filemsg").html(item.FileName);
                                $("#ClickNum").val(item.ClickNum);
                                $("#StarDate").val(DateTimeConvert(item[0].CreateTime, "yyyy-MM-dd HH:mm:ss"));
                            }

                        }
                    },
                    error: function (data, status, e) {
                        layer.msg(e);
                    }
                });
            }
        }

        function saveData() {
            var desc = editor.html() == "请添加你的描述..." ? "" : encodeURIComponent(editor.html());
            //var desc = encodeURIComponent(editor.getContent());
            if (!$.trim($("#Title").val()) || $.trim($("#Title").val()).length == 0) {
                layer.msg('请输入标题');
                return false;
            }
            $.ajax({
                type: "Post",
                url: "/Common.ashx",
                async: false,
                dataType: "json",
                data: {
                    "PageName": "DYYX/NoticesHandler.ashx",
                    "func": "EditNotice",
                    "Title": $("#Title").val(),
                    "Contents": desc,
                    "Hot": $("input[name='Hot']:checked").val(),
                    "isPush": $("input[name='isPush']:checked").val(),
                    "SortId": $("#SortId").val(),
                    "ClickNum": $("#ClickNum").val(),
                    "Id": $("#NoticeId").val(),
                    "Creator": $("#HUserName").val(),
                    "FilePath": $("#HFilePath").val(),
                    "FileName": $("#HFileName").val(),
                    "MenuId": $("#MenuId").val(),
                    "CreateTime": $("#StarDate").val()
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        layer.msg('操作成功!');
                        window.history.go(-1);
                        //parent.getData(1, 10);
                        //parent.CloseIFrameWindow();
                    }
                },
                error: function (data, status, e) {
                    layer.msg(e);
                }
            });
        }

        function GetUserInfoCookie() {
            if ($.cookie('LoginCookie_Cube') != null && $.cookie('LoginCookie_Cube') != "null" && $.cookie('LoginCookie_Cube') != "") {
                var UserInfo = $.parseJSON($.cookie('LoginCookie_Cube'));
                if (UserInfo != null) {
                    $("#HUserName").val(UserInfo.LoginName);
                }
            }
        }
    </script>
</body>
</html>
