<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteEdit.aspx.cs" Inherits="PMSWeb.Admin.VoteEdit" %>

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
    <link rel="stylesheet" type="text/css" href="/Admin/AdminCss/onlinetest.css" />
    <script src="/Scripts/jquery-1.11.2.min.js"></script>

    <script src="/Scripts/KindUeditor/kindeditor.js"></script>
    <script src="/Scripts/KindUeditor/plugins/code/prettify.js"></script>
    <script src="/Scripts/KindUeditor/lang/zh_CN.js"></script>
    <script src="/Scripts/My97DatePicker/WdatePicker.js"></script>

    <script src="/Scripts/layer/layer.js"></script>
    <script src="/Scripts/jquery.cookie.js"></script>
    <script src="/Scripts/Common.js"></script>
    <script>
        Check_CurrentUser();
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="hidId" runat="server" />
        <div style="background: #fff">
            <div class="newcourse_dialog_detail">
                <div class="clearfix">
                    <div class="course_form_div clearfix">
                        <label for="">主题：</label>
                        <input type="text" placeholder="主题" class="text" id="Title" value="" />
                        <i class="stars"></i>
                    </div>
                    <div class="course_form_div clearfix">
                        <label for="" class="fl">内容：</label>
                        <div style="width: 95%; float: left;">
                            <textarea id="editor_id" name="content" style="width: 100%; height: 600px;">
                            </textarea>
                        </div>
                    </div>

                    <div class="course_form_div clearfix">
                        <label for="">是否发布：</label>
                        <input type="radio" name="isPush" value="1" checked />是<input type="radio" name="isPush" value="0" />否
                    </div>
                    <div class="course_form_div clearfix">
                        <label for="">排序：</label>
                        <input type="text" placeholder="排序" class="text" id="SortId" value="" />
                    </div>

                    <div class="course_form_div clearfix">
                        <label for="">时间：</label>
                        <input type="text" class="text" id="CreateTime" value="" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" />
                    </div>

                    <div style="clear: both"></div>

                    <div class="course_form_select clearfix tc">
                        <a class="course_btn confirm_btn" onclick="saveData()" id="btnCreate" style="display: inline-block;">确定</a>
                        <a href="javascript:window.history.go(-1);" class="course_btn confirm_btn" style="display: inline-block;">返回</a>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        KindEditor.ready(function (K) {
            window.editor = K.create('#editor_id', {
                uploadJson: '../../Handler/UploadImage.ashx?action=UploadImgForAdvertContent',
                allowFileManager: false,//true时显示浏览服务器图片功能。
                imageSizeLimit: '1024MB', //批量上传图片单张最大容量
                imageUploadLimit: 10, //批量上传图片同时上传最多个数
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
                        if (data != null && data.message != null) layer.msg(data.message);
                    }
                },
                afterError: function (str) {
                    //alert('error: ' + str);
                }
            });

            initData();
        });


        function initData() {
            if ($("#hidId").val() != "") {
                $.ajax({
                    type: "Post",
                    url: "/Common.ashx",
                    async: false,
                    dataType: "json",
                    data: {
                        "PageName": "DYYX/AdminManagerHandler.ashx",
                        "func": "GetVoteInfo",
                        "Id": $("#hidId").val()
                    },
                    success: function (json) {
                        if (json.result.errMsg == "success") {
                            var item = json.result.retData;
                            if (item != null) {
                                editor.html(item.Description);
                                //editor.setContent(item[0].CreativeHTML);
                                $("#Title").val(item.Title);
                                //$("#ClickNum").val(item.ClickNum);
                                $("#CreateTime").val(DateTimeConvert(item.CreateTime, 'yyyy-MM-dd HH:mm:ss'));
                                $("#SortId").val(item.SortId);
                                $('input[name=isPush][value=' + item.isPush + ']').prop('checked', true);
                            }
                        }
                    },
                    error: OnError
                });
            }
        }

        function saveData() {
            if ($("#Title").val() == "" || $("#Title").val().length == 0) {
                layer.msg("请输入标题！");
                return false;
            }
            var desc = editor.html() == "请添加你的描述..." ? "" : encodeURIComponent(editor.html());
            //var desc = encodeURIComponent(editor.getContent());
            $.ajax({
                type: "Post",
                url: "/Common.ashx",
                async: false,
                dataType: "json",
                data: {
                    "PageName": "DYYX/AdminManagerHandler.ashx",
                    "func": "EditVote",
                    "Id": $("#hidId").val(),
                    "Title": $("#Title").val(),
                    "Description": desc,
                    "CreateTime": $("#CreateTime").val(),
                    "SortId": $("#SortId").val(),
                    "isPush": $("input[name='isPush']:checked").val()
                },
                success: function (json) {
                    if (json.result.errMsg == "success") {
                        layer.msg('操作成功!');
                        window.history.go(-1);
                    }
                },
                error: OnError
            });
        }

    </script>
</body>
</html>
