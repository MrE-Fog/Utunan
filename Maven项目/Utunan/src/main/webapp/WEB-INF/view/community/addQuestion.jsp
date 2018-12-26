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
    <link rel="stylesheet" href="/css/school/animate.css">
    <link rel="stylesheet" href="/css/school/dialog.css">
    <script type="text/javascript" src="https://unpkg.com/wangeditor@3.1.1/release/wangEditor.min.js"></script>
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
<!--header-->
<%@include file="../common/header.jsp"%>

<!--content-->
<div class="layui-container fly-marginTop">
    <div class="fly-panel" pad20 style="padding-top: 5px;">
        <!--<div class="fly-none">没有权限</div>-->
        <div class="layui-form layui-form-pane">
            <div class="layui-tab layui-tab-brief" lay-filter="user">
                <ul class="layui-tab-title">
                    <li class="layui-this">发表提问</li>
                </ul>
                <form id="shangchuanform" name="shangchuan" onsubmit="return false" action="/uiz3" method="post">
                <div class="layui-form layui-tab-content" id="LAY_ucm" style="padding: 20px 0;">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-col-md9">
                        <label for="L_title" class="layui-form-label">标题</label>
                        <div class="layui-input-block">
                            <input type="text" id="L_title" name="title" required lay-verify="required" autocomplete="off" class="layui-input">
                            <!-- <input type="hidden" name="id" value="{{d.edit.id}}"> -->
                        </div>
                    </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <div class="text">
                            <div id="div1" class="toolbar" ></div>
                            <div id="div2" style="height: 100px">
                                <p>输入问题背景、条件等详细信息</p>
                            </div>
                            <textarea id="text1" style="display: none" name="textarea"></textarea>
                            <script type="text/javascript">
                                var E = window.wangEditor;
                                var editor1 = new E('#div1', '#div2');  // 两个参数也可以传入 elem 对象，class 选择器
                                editor1.customConfig.menus = [
                                    'list',  // 列表
                                    'link',     //插入链接
                                    'image',    //插入图片
                                    'code'    //插入代码
                                ];
                                editor1.customConfig.uploadImgShowBase64 = true   // 使用 base64 保存图片
                                editor1.customConfig.uploadImgMaxSize = 1 * 1024 * 1024   //每张图片最大上传大小
                                editor1.customConfig.uploadImgMaxLength = 5              //每次最多上传5张
                                var $text1 = $('#text1')
                                editor1.customConfig.onchange = function (html) {
                                    // 监控变化，同步更新到 textarea
                                    $text1.val(html)
                                }

                                editor1.create();
                            </script>
                        </div>
                    </div>
                    <div class="layui-form-item addtags">
                        <div style="max-width: 70%;">
                            <div class="addtag-description" style="float: left;">已添加标签</div>
                            <div class="addtagItem"></div>
                            <br>
                        </div>
                        <div style="max-width: 70%;">
                            <div class="tags-description">请选择标签：</div>
                            <div class="tags">
                                <c:forEach items="${tagList}" var="tag">
                                    <div class="tag" style="display: block;">${tag.tagName}</div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label for="L_vercode" class="layui-form-label">人类验证</label>
                    <div class="layui-input-inline">
                        <%--<input type="text" id="L_vercode" name="vercode" required lay-verify="required" placeholder="请回答后面的问题" autocomplete="off" class="layui-input">--%>
                        <input type="text" id="L_vercode" class="layui-input" placeholder="请输入验证码" name="userinput"/>
                    </div>
                    <div class="layui-form-mid">
                        <%--验证码--%>
                        <%--<span style="color: #c00;">1+1=?</span>--%>
                        <img src="/getIdentityPic" id="identity" onload="btn.disabled= false;">
                        <input type="button" value="换个图片" onclick="reloadImage()" id="btn">
                    </div>
                </div>
                <div class="layui-form-item">
                    <button id="fabu" type="submit" class="layui-btn" lay-filter="*" onclick="judgePic()" lay-submit>立即发布</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--//content-->

<%@include file="../common/footer.jsp"%>
</body>
<script type="text/javascript">
    function reloadImage(){
        document.getElementById('btn').disable=true;
        document.getElementById('identity').src='/getIdentityPic?time='
            +new Date().getTime();
    }

    var userinput = document.getElementById("L_vercode");
    function judgePic() {
        var str = userinput.value.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
        if(str == '' || str == undefined || str == null){
            //文本框为空
            javascript:$('body').judgenull({type:'success'});
        }else{
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/judgePicCode" ,//url
                /*data: {"userinput":userinput},*/
                data: $('#shangchuanform').serialize(),
                success: function (result) {
                    console.log(result);//打印服务端返回的数据(调试用)
                    var res = result.res;
                    if(res=="ok"){
                        console.log("验证成功！");
                        document.shangchuan.submit();
                    }else{
                        console.log("验证失败！");
                        reloadImage();
                        javascript:$('body').judgefalse({type:'success'});
                    }
                },
                error : function() {
                    console.log("网崩了！")
                }
            });
        }
    }
</script>
<script charset="UTF-8" type="text/javascript"  src="/js/school/dialog.js"></script>
<script>
    var tags=document.getElementsByClassName("tag");
    console.log(tags);
    var addtag=document.getElementsByClassName("addtagItem")[0];
    for(var i=0;i<tags.length;i++){
        tags[i].onclick=function () {
            this.style.display="none";
            var add=document.createElement("div");
            add.innerHTML=this.innerHTML;
            add.className="addtag";
            add.style="display:block; width:auto;display: block; background-color: #009688;margin:0px 5px;color: #fff; font-size: 14px;padding: 4px 10px;float: left; border-radius: 18px;text-align: center;";
            addtag.appendChild(add);
        }
    }
</script>
</html>