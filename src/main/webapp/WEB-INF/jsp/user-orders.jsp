<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="expires" content="0"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <meta name="format-detection" content="telephone=no"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>我的订单页 - 爱Shopping商城</title>
    <!--结算页面样式-->
    <link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css?v=20160713"/>
    <link rel="stylesheet" type="text/css" href="/css/head.css?v=20160713"/>
    <link rel="stylesheet" type="text/css" href="/css/order.css?v=20160713">
    <link rel="stylesheet" type="text/css" href="/css/productList.css"/>
    <link rel="stylesheet" type="text/css" href="/css/base_w1200.css"/>
    <link rel="stylesheet" type="text/css" href="/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css"/>
    <script type="text/javascript" src="/js/jquery-1.5.1.min.js?v=20160713"></script>
    <script type="text/javascript" src="/js/jquery.alerts.js?v=20160713"></script>
    <script type="text/javascript" src="/js/cart.js?v=20160713"></script>
    <script type="text/javascript" src="/js/cookie.js?v=20160416222"></script>
    <script type="text/javascript" src="/js/shadow.js?v=20160416"></script>
    <script src="/js/common.js?v=20160713" type="text/javascript"></script>
    <script src="/js/jquery.region.js?v=20160713" type="text/javascript"></script>
    <script src="/js/order.js?v=20160713" type="text/javascript"></script>
</head>
<body id="mainframe">
<jsp:include page="commons/header.jsp"/>
<div class="orderMain">
    <div class="orderTbody" style="width:958px;border-bottom:0 none;">
        <h3 class="orderTitle">所有订单：</h3>
        <span class="clear"></span>
        <div class="orderPItem">
            <div id="producthtml">
                <div id="chaidanorder2" class="">
                    <div class="orderItem">
                        <div class="orderTbl" style="padding-left:0px">
                            <div class="orderThead">
                                <div class="tCol" style="width: 120px">订单号</div>
                                <div class="tCol">商品图片</div>
                                <div class="tCol pGoods">商品名称</div>
                                <div class="tCol pPrice">单价</div>
                                <div class="tCol pPromotion">返现</div>
                                <div class="tCol pInventory">库存状态</div>
                                <div class="tCol pQuantity">数量</div>
                                <div class="tCol pSubtotal">小计</div>
                            </div>
                            <c:forEach items="${orderList}" var="order" varStatus="status">
                                <div class="orderPInfo">
                                    <div class="pItem" style="width: 120px">${order.orderNum}</div>
                                    <div class="pItem">
                                        <a href="#" target="_blank">
                                            <img src="/upload/${order.item.iconPath}"
                                                 style="width: 60px;height: 60px;"/>
                                        </a>
                                    </div>
                                    <div class="pItem pGoods">
                                        <a href="#" target="_blank">${order.item.itemName}</a>
                                    </div>
                                    <div class="pItem pPrice" style="position: relative; z-index: 99">
                                        ¥<fmt:formatNumber groupingUsed="false" maxFractionDigits="2"
                                                           minFractionDigits="2"
                                                           value="${order.item.price}"/>
                                    </div>
                                    <div class="pItem pPromotion">¥0</div>
                                    <div class="pItem pInventory" pid="57111">现货</div>
                                    <div class="pItem pQuantity">${order.itemCount}</div>
                                    <div class="pItem pSubtotal" style="width: 90px">
                                        ¥<fmt:formatNumber groupingUsed="false" maxFractionDigits="2"
                                                           minFractionDigits="2"
                                                           value="${order.item.price * order.itemCount}"/></div>
                                    <span class="clear"></span>
                                </div>
                            </c:forEach>


                            <div class="zoom:1;padding:0px 0;line-height:25px;border-bottom:1px solid #f2f2f2; order_xj">
                                <div class="r-filter">

                                    <div class="pagin">
                                                <span class="txt"><span
                                                        class="n">当前${page}页</span>/共${totalPages}页</span>
                                        <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                        <span id="prevPage" class="prev" style="cursor: pointer"></span>
                                        <span id="nextPage" class="next" style="cursor: pointer"></span>
                                    </div>
                                    <div class="total">共<span>${recordCount}</span>个商品</div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="orderItem" style="position:relative;padding-top:10px;"></div>
            </div>
            <div class="orderTFoot"></div>
        </div>
        <!-- /main -->
        <jsp:include page="commons/footer.jsp"/>
</body>
<script type="text/javascript">
    $(function () {
        //翻页
        let userId = '${user.userId}';
        let page = ${page};
        let totalPages = ${totalPages};
        $('#prevPage').click(function () {
            page = page - 1;
            if (page < 1) {
                page = 1;
            }
            let pageSize = 0;
            location.href = '${ctx}' + '/order/getUserOrders.do?userId=' + userId + '&currentPage=' + page + '&pageSize=' + pageSize;
        })
        $('#nextPage').click(function () {
            page = page + 1;
            if (page > totalPages) {
                page = totalPages;
            }
            let pageSize = 0;
            location.href = '${ctx}' + '/order/getUserOrders.do?userId=' + userId + '&currentPage=' + page + '&pageSize=' + pageSize;
        });
    });
</script>
</html>