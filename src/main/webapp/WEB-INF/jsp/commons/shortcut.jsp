<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/initialPage.jsp"></jsp:include>
<div class="topMenu">
    <div class="pW">
        <ul class="fr topTh">
            <li class="login" id="login">
            <c:set var="user" scope="session" value="${user}"></c:set>
            <c:if test="${null != user}">
                <span id="loginbar" style="margin-right: 15px;">
                    <li class="menus">
                        <a name="sfbest_hp_hp_head_home1" href="#" rel="nofollow" class="trackref t">
                            ${user.userName}</a><b></b>
                        <span class="outline"></span>
                        <span class="blank"></span>
                        <div class="dd">
                            <div><a name="sfbest_hp_hp_head_home4" class="trackref" href="javascript:logout();" rel="nofollow">退出登录</a></div>
                        </div>
                    </li>
                </span>
            </c:if>
            <c:if test="${null == user}">
                 <span id="loginbar" style="margin-right: 15px;">
	            	<a href="/login.jsp">请登录</a>
                     <a href="/register.jsp">免费注册</a>
      	        </span>
            </c:if>
            </li>
            <!--<li id='qiyeLogin'><a href='http://www.sfme.me/login.jhtml' target='_blank' rel='nofollow'>员工福利</a></li>-->
            <li class="myOrder"><a name="sfbest_hp_hp_head_OrderList" class="trackref" href="javascript:myOrders();" rel="nofollow">我的订单</a>
            </li>
            <li class="menus">
                <a name="sfbest_hp_hp_head_home1" href="#" rel="nofollow" class="trackref t">我的优选</a><b></b>
                <span class="outline"></span>
                <span class="blank"></span>
                <div class="dd">
                    <div><a name="sfbest_hp_hp_head_home4" class="trackref" href="#" rel="nofollow">我的收藏</a></div>
                    <div><a name="sfbest_hp_hp_head_home3" class="trackref" href="javascript:myHistory();" rel="nofollow">我的足迹</a></div>
                    <div><a href="http://localhost:8080/cart.jsp" rel="nofollow">我的购物车</a></div>
                </div>
            </li>

            <li class="allCat"><em class="site">网站导航</em><s></s><span class="outline"></span> <span
                    class="blank"></span>
                <div class="dd">
                    <dl>
                        <dt class="dh1">商品分类</dt>
                        <dd>
                            <a name="sfbest_hp_hp_head_category1" class="trackref" href="/fresh/"
                               target="_blank">肉类海鲜</a>
                            <a name="sfbest_hp_hp_head_category2" class="trackref" href="/fresh/"
                               target="_blank">熟食蛋奶</a>
                            <a name="sfbest_hp_hp_head_category3" class="trackref" href="/fresh/"
                               target="_blank">水果蔬菜</a>
                            <a name="sfbest_hp_hp_head_category4" class="trackref"
                               href="/drinks/4-0-0-0-0-2-0-0-0-0-0.html" target="_blank">酒水饮料</a>
                            <a name="sfbest_hp_hp_head_category5" class="trackref"
                               href="/food/6-0-0-0-0-2-0-0-0-0-0.html" target="_blank">休闲食品</a>
                            <a name="sfbest_hp_hp_head_category6" class="trackref"
                               href="/tea/5-0-0-0-0-2-0-0-0-0-0.html" target="_blank">冲调茶饮</a>
                            <a name="sfbest_hp_hp_head_category7" class="trackref"
                               href="/oil/3-0-0-0-0-2-0-0-0-0-0.html" target="_blank">粮油副食</a>
                            <a name="sfbest_hp_hp_head_category8" class="trackref"
                               href="/oil/24-0-0-0-0-2-0-0-0-0-0.html" target="_blank">南北干货</a>
                        </dd>
                    </dl>
                    <dl class="line"></dl>
                    <dl>
                        <dt class="dh2">特色频道</dt>
                        <dd><a name="sfbest_hp_hp_head_channel12" class="trackref" href="http://www.sfbest.hk"
                               target="_blank">跨境直发</a><a name="sfbest_hp_hp_head_channel2" class="trackref"
                                                          href="/qiye/" target="_blank">企业专区</a><a
                                name="sfbest_hp_hp_head_channel3" class="trackref" href="/wine/" target="_blank">红酒廊</a><a
                                name="sfbest_hp_hp_head_channel4" class="trackref" href="/taste/"
                                target="_blank">寰宇美食</a>
                            <!-- <a name="sfbest_hp_hp_head_channel5" class="trackref" href="/healthy/" target="_blank">健康养生</a> -->
                            <!-- <a name="sfbest_hp_hp_head_channel6" class="trackref" href="/member/" target="_blank">会员俱乐部</a> -->
                        </dd>
                    </dl>
                    <dl class="line"></dl>
                    <dl>
                        <dt class="dh3">更多</dt>
                        <dd><a name="sfbest_hp_hp_head_moreapp" class="trackref" href="#" target="_blank">客户端</a><a
                                name="sfbest_hp_hp_head_moreabout" class="trackref" href="#" target="_blank">关注我们</a>
                            <p>客服电话：4008-888-888</p></dd>
                    </dl>
                </div>
            </li>

        </ul>
        <span class="clear"></span>
    </div>
    <script type="text/javascript" src="/js/e3mall.js"></script>
    <script type="text/javascript" src="/js/jquery.cookie.js"></script>
    <script type="text/javascript">
        function myOrders() {
            let userId = '${user.userId}';
            if (null == userId || 0 == userId || '' == userId){
                jAlert('您还未登录，请登录...', '提示', function () {
                    location.href = '${ctx}'+'/login.jsp';
                });
            } else {
                location.href = '${ctx}'+'/order/getUserOrders.do?userId=' + userId;
            }
        }

        function myHistory() {
            let userId = '${user.userId}';
            if (null == userId || 0 == userId || '' == userId){
                jAlert('您还未登录，请登录...', '提示', function () {
                    location.href = '${ctx}'+'/login.jsp';
                });
            } else {
                location.href = '${ctx}'+'/history/historyItems.do?userId=' + userId;
            }
        }

        function logout() {
            $.post('${ctx}'+'/user/logout.do',function(data){
                if(data.status == 500) {
                    jAlert('注销成功',"提示",function () {
                        location.href = "${ctx}/index.jsp";
                    })
                }
            })
        }
    </script>
</div>