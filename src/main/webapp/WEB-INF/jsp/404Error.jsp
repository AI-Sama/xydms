<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
    <head>
        <meta charset="utf-8">
        <style type="text/css">
        *{
        	padding: 0;
        	margin: 0;
        }
        ul,li{
        	list-style: none;
        }
        html,body {
            width: 100%;
            height: 100%;
            margin: 0;
            overflow: hidden;
            background: linear-gradient(rgba(0, 108, 172, 1), rgba(0, 122, 195, .7));
        }
        #stars {
            margin: 0 auto;
            max-width: 1600px;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            z-index: 2;
        }
        .star {
            display: block;
            width: 1px;
            background: transparent;
            position: relative;
            opacity: 0;
            /*过渡动画*/
            
            animation: star-fall 3s linear infinite;
            -webkit-animation: star-fall 3s linear infinite;
            -moz-animation: star-fall 3s linear infinite;
        }
        .star:after {
            content: '';
            display: block;
            border: 0px solid #fff;
            border-width: 0px 90px 2px 90px;
            border-color: transparent transparent transparent rgba(255, 255, 255, .5);
            box-shadow: 0 0 1px 0 rgba(255, 255, 255, .1);
            /*变形*/
            
            transform: rotate(-45deg) translate3d(1px, 3px, 0);
            -webkit-transform: rotate(-45deg) translate3d(1px, 3px, 0);
            -moz-transform: rotate(-45deg) translate3d(1px, 3px, 0);
            transform-origin: 0% 100%;
            -webkit-transform-origin: 0% 100%;
            -moz-transform-origin: 0% 100%;
        }
        @keyframes star-fall {
            0% {
                opacity: 0;
                transform: scale(0.5) translate3d(0, 0, 0);
                -webkit-transform: scale(0.5) translate3d(0, 0, 0);
                -moz-transform: scale(0.5) translate3d(0, 0, 0);
            }
            50% {
                opacity: 1;
                transform: translate3d(-200px, 200px, 0);
                -webkit-transform: translate3d(-200px, 200px, 0);
                -moz-transform: translate3d(-200px, 200px, 0);
            }
            100% {
                opacity: 0;
                transform: scale(1.2) translate3d(-300px, 300px, 0);
                -webkit-transform: scale(1.2) translate3d(-300px, 300px, 0);
                -moz-transform: scale(1.2) translate3d(-300px, 300px, 0);
            }
        }
        #center{
        	width: 100%;
        	height: 100%;
        	z-index: 10;
        	position: relative;
        }
		.centerTitle{
			width: 100%;
			height: 60%;
			position: absolute;
        	top: 0;right: 0;bottom: 0;left: 0;
        	margin: auto;
        	color: white;
        	font-size: 10em;
        	letter-spacing: 0.5em;
        	text-align: center;
		}
		.centerTishi{
			width: 60%;
			height: 10%;
			position: absolute;
        	top:42%;left: 18%;
        	color: white;
        	font-size: 1.2em;
        	letter-spacing: 0.3em;
        	text-align: center;
		}
	     a{
			font-size: 0.8em;
			text-decoration: none;
			color: yellow;
			margin-top: 5px;
		}
        </style>
    </head>
    <body>
    	<!-- 画布 -->
    	<div id="stars"></div>
    	<!-- 放置404 -->
    	<div id="center">
    		<span class="centerTitle">404</span>
    		<div class="centerTishi">
            <p>
                你访问的页面不见了!
            </p>
                <br>
                <br>
                <p>
                <a href="/IndexController/jumpIndex">&nbsp;返回主页</a>
                </p>
            </div>

    	</div>
    	<script type="text/javascript">
    		var stars = document.getElementById('stars')
			var star = document.getElementsByClassName('star')
			// js随机生成流星
			for (var j = 0; j < 30; j++) {
                 var newStar = document.createElement("div")
                 newStar.className = "star"
                 newStar.style.top = randomDistance(30, -30) + 'px'
                 newStar.style.left = randomDistance(150, 20) + 'px'
                 stars.appendChild(newStar)
           }

           // 封装随机数方法
           function randomDistance(max, min) {
               var distance = Math.floor(Math.random() * (max - min + 1) * 10 + min)
               return distance
           }

           // 给流星添加动画延时
           for (var i = 0, len = star.length; i < len; i++) {
               if (i % 6 == 0) {
                   star[i].style.animationDelay = '0s'
               } else {
                   star[i].style.animationDelay = i * 0.8 + 's'
               }
           }
    	</script>
    </body>
</html>