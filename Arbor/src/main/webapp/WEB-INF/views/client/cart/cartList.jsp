<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="y_cart_wrap" class="w1400_container">
    <div>
        <h1>장바구니</h1>
        <div>
            <ul class="clearfix">
                <li><i class="fas fa-cart-arrow-down fa-3x"></i></li>
                <li></li>
                <li><i class="far fa-credit-card fa-3x"></i></li>
                <li></li>
                <li><i class="far fa-check-square fa-3x"></i></li>
            </ul>
            <ul class="clearfix">
                <li>장바구니</li>
                <li>주문/결제</li>
                <li>주문완료</li>
            </ul>
        </div>
    </div>
    <div>
        <ul class="clearfix">
            <li><input type="checkbox" id="y_cartAllChck" name="y_cartAllChck"></li>
            <li>상품정보</li>
            <li>적립예정 금액</li>
            <li>할인금액</li>
            <li>결제금액</li>
            <li>선택</li>
        </ul>
        <div><!--테이블 내용-->
            <ul class="clearfix">
                <li>
                    <input type="checkbox" class="y_cartChck" name="y_cartChck">
                </li>
                <li class="clearfix">
                    <img src="argian.jpg" alt="">
                    <span>ㅇㅇㅇㅇㅇ가구</span>
                </li>
                <li>-</li>
                <li>-</li>
                <li>-</li>
                <li>
                    <button class="clientMainBtn">바로구매</button><br/>
                    <button class="clientSubBtn">삭제</button>
                </li>
            </ul>
            <!--옵션-->
            <p class="clearfix">
                <button>✕</button>
                옵션1) --/--- 
                <span><button>-</button> 0 <button>+</button></span>
            </p>
            <p class="clearfix">
                <button>✕</button>
                옵션2) --/--- 
                <span><button>-</button> 0 <button>+</button></span>
            </p>
        </div>
        <button class="clientSubBtn">선택삭제</button>
    </div>
    <div class="clearfix">
        <div>
            <h2>총 주문금액</h2>
        </div>
        <div class="clearfix">
            <ul>
                <li>주문상품 수</li>
                <li>주문금액</li>
                <li>할인금액</li>
                <li>배송비</li>
                <li>
                    적립금<br/>
                    <span class="y_smallText">* 다음주문부터 사용 가능합니다.</span>
                </li>
                <li>최종 결제금액</li>
            </ul>
            <ul>
                <li>- 개</li>
                <li>- 원</li>
                <li>- 원</li>
                <li>- 원</li>
                <li>
                    - 원<br/>　
                </li>
                <li><span class="y_totalPrice">123,123</span> 원</li>
            </ul>
        </div>
    </div>
    <div>
        <span class="clearfix">
            <a href="#" class="clientSubBtn">쇼핑목록 가기</a>
            <a href="#" class="clientSubBtn">선택상품구매</a>
            <a href="#" class="clientMainBtn">전체상품구매</a>
        </span>
    </div>
</div>