<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="userfunction">
    <input type="hidden" value="directioncollector">
    <a href="/user/myspace">
        <li>
            <img src="../images/user/userinfo.svg" alt="" srcset="">
            <span>个人资料</span>
        </li>
    </a>
    <a href="/user/statistics">
        <li>
            <img src="../images/user/statistics.svg">
            <span>题库统计</span>
        </li>
    </a>
    <li id="community">
        <img src="../images/user/record.svg">
        <span>社区记录</span>
        <img src="../images/user/arrow.svg">
    </li>
    <nav class="postinfo" id="postinfo" style="height:100px;">
        <a href="/user/publishquiz">
            <li>发表的问答</li>
        </a>
        <a href="/user/publishreply">
            <li>发表的回复</li>
        </a>
    </nav>
    <li id="mycollection">
        <img src="/images/user/collection.svg">
        <span>我的收藏</span>
        <img src="/images/user/arrow.svg">
    </li>
    <nav class="collection" id="collection" style="height:150px;">
        <a href="/user/directioncollector">
            <li>院校收藏夹</li>
        </a>
        <a href="/user/quizcollector">
            <li>帖子收藏夹</li>
        </a>
        <a href="/user/questioncollector">
            <li>题目收藏夹</li>
        </a>
    </nav>
</nav>
