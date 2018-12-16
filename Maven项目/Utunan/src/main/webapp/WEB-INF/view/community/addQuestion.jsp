<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2018/12/16
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page import="java.util.List,com.utunan.pojo.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>提问页面</title>
    <link rel="stylesheet" href="/css/common.css">
    <link rel="stylesheet" href="/css/community/layui.css">
    <link rel="stylesheet" href="/css/community/global.css">
    <link rel="stylesheet" href="/css/community/add.css">
    <script src="/js/community/jquery-1.10.2.js"></script>
    <script src="/js/community/tag.js"></script>
</head>
<script>
    //禁用Enter键表单自动提交
    document.onkeydown = function(event) {
        var target, code, tag;
        if (!event) {
            event = window.event; //针对ie浏览器
            target = event.srcElement;
            code = event.keyCode;
            if (code == 13) {
                tag = target.tagName;
                if (tag == "TEXTAREA") { return true; }
                else { return false; }
            }
        }
        else {
            target = event.target; //针对遵循w3c标准的浏览器，如Firefox
            code = event.keyCode;
            if (code == 13) {
                tag = target.tagName;
                if (tag == "INPUT") { return false; }
                else { return true; }
            }
        }
    };

</script>
<body>

<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表提问</li>
                </ul>
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <form action="" method="post">
                            <div class="layui-col-md9">
                                <label for="L_title" class="layui-form-label">标题</label>
                                <div class="layui-input-block">
                                    <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                                    <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                                </div>
                            </div>
                        </form>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <div class="text">
                            <div class="toolbar" unselectable="on">
                                <img src="images/community/text1.svg" width="20px"height="20px">
                                <img src="images/community/text2.svg" width="20px"height="20px">
                                <img src="images/community/text3.svg" width="20px"height="20px">
                                <img src="images/community/text4.svg" width="20px"height="20px">
                                <img src="images/community/text5.svg" width="20px"height="20px">
                                <img src="images/community/text6.svg" width="20px"height="20px">
                                <img src="images/community/text7.svg" width="20px"height="20px">
                                <img src="images/community/text8.svg" width="20px"height="20px">
                                <img src="images/community/text9.svg" width="20px"height="20px">
                                <div class="more"><img src="images/community/text10.svg" width="20px"height="20px"></div>
                            </div>
                            <textarea class="question-content" required="" rows="1"  autocomplete="off" role="combobox" aria-expanded="false" aria-autocomplete="list" aria-haspopup="true" aria-owns="Popover58-content"  placeholder="输入问题背景、条件等详细信息（选填）"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item addtags">
                        <div class="addtags-description">添加标签：</div>
                        <input type="text" id="tagValue" placeholder="">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_vercode" class="layui-form-label">人类验证</label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid">
                        <span style="color: #c00;">1+1=?</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn" lay-filter="*" lay-submit>立即发布</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script >
    //添加标签
    var tag = new Tag("tagValue");
    tag.initView();
</script>
</html>