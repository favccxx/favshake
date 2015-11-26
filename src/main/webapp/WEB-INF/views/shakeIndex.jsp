<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="keywords" content="摇一摇,爱摇呀">
<link rel="shortcut icon" href="assets/imgs/favicon.png" />
<title>哎摇-摇一摇</title>
<link rel="stylesheet" type="text/css" href="assets/css/index.css">
</head>

<body>
	<div id="header" style="text-align: center;">
    	<div id="logo"><h1>摇一摇有惊喜</h1></div>
	</div>
	<div id="main" style="text-align: center;">
		<div class="demo" style="position: relative;">
			<div style="position: absolute;">
		    	<img id="shakeHand" alt="" src="assets/imgs/handshake.png">
		  	</div>
		  	<img id="mysterImg">
		</div>
		<div id="shakeResult"></div>
	
<!-- 		<div class="demo"> -->
<!-- 			<img id="shakeHand" alt="" src="assets/imgs/handshake.png"> -->
<!-- 			<img id="mysterImg"> -->
<!-- 			<div id="shakeResult"></div>	 -->
			
<!-- 		</div> -->
		<audio id="shakeMusic" style="display: none;" preload="metadata" controls src="assets/videos/cricket.wav"></audio>
		<br />
		
	</div>
	<script src="assets/js/jquery-2.1.4.min.js"></script>
	<script src="assets/js/shake.js"></script>
	<script src="assets/js/crypto-js/crypto-js.js"></script>
	<script type="text/javascript">	
// 		var CryptoJS = require("crypto-js");
	
		
	
	
		var shakeMusic = document.getElementById("shakeMusic");
		
		var shakeInterval = setInterval(shakeLR, 500);
		
		function shakeLR(){
			$("#shakeHand").animate({marginLeft:"100px"},"slow","swing",function ss(){
			}).animate({marginLeft:""});
		}
		
		function onShake(){
			//清除定时器
			clearInterval(shakeInterval);

			
			$("#shakeHand").attr("src", "assets/imgs/handshake.png");
			document.getElementById("shakeResult").innerHTML = "";
			$("#shakeResult").removeClass("result result-show");		
			
			var opptyNum = Math.floor(Math.random() * 10);
			if (opptyNum < 2) {
// 				$("#shakeHand").fadeOut()
				$("#shakeHand").attr("src", "assets/imgs/shakecry.jpg");
// 				$("#shakeHand").fadeIn("slow")
				setTimeout(function() {
					document.getElementById("shakeResult").innerHTML = "抱歉，你什么也没摇到！不要气馁，相信大奖会光顾你！";
					$("#shakeResult").addClass("result result-show");
				}, 500);
				return;
			}
			
			var appVersion = window.navigator.appVersion ;
			var codeName = window.navigator.appCodeName;
			
			$.ajax({
				method : "POST",
				url : "shakeRestReq/happyShake",
				data : {
					codeName : codeName,
					money : 0,
					bless : 0,
					share : 0,
					game : 0,
					coupons : 0,
					appVersion : appVersion,
					location : "Boston"
				}
			}).done(function(redEnvelop) {
				var redEnvelopType = redEnvelop.redEnvelopType;		
				$("#mysterImg").fadeIn("5000");
				setTimeout(function imgShow(){
					$("#shakeHand").fadeOut("500");
					$("#mysterImg").attr("src", "assets/imgs/cashEnvelop.png");
				}, 1000);
				
				return;
				if(redEnvelopType=="CASH"){
					$("#shakeHand").fadeOut();
					$("#mysterImg").fadeIn();
					$("#mysterImg").attr("src", "assets/imgs/cashEnvelop.png");
					var encryptData = redEnvelop.redEnvelopValue + "abcde";
					var cashValue = CryptoJS.AES.encrypt(encryptData, 'ishake');
					document.getElementById("shakeResult").innerHTML = "<a target='_blank' style='color:white;' href='initReceiveCash?redEnvelopValue=" + cashValue + "'>恭喜你获得" + redEnvelop.redEnvelopValue +"元现金红包，点击领取</a>";
					$("#shakeResult").addClass("result result-show");
				}else if(redEnvelopType=="BLESSINGS"){
					$("#shakeHand").attr("src", "assets/imgs/blessPackage.png");
					document.getElementById("shakeResult").innerHTML = redEnvelop.redEnvelopValue;
					$("#shakeResult").addClass("result result-show");
				}else if(redEnvelopType=="COUPONS"){
					$("#shakeHand").attr("src", "assets/imgs/coupons.png");
					document.getElementById("shakeResult").innerHTML = "<a target='_blank' style='color:white;' href='" + redEnvelop.redEnvelopURL + "?redEnvelopValue=" + redEnvelop.redEnvelopName + "'>恭喜你获得" + redEnvelop.redEnvelopName  +"，点击领取</a>";
					$("#shakeResult").addClass("result result-show");
				}else if(redEnvelopType=="GAMES"){
					var randomNum = Math.floor(Math.random() * 15);
					$("#shakeHand").attr("src", "assets/photos/" + randomNum + ".png");
					document.getElementById("shakeResult").innerHTML = "<a href='superPhotos' style='color:white;' target='_blank'>恭喜你获得Google相册展！</a>";
					$("#shakeResult").addClass("result result-show");
				}else{
					var randomNum = Math.floor(Math.random() * 15);
					$("#shakeHand").attr("src", "assets/photos/" + randomNum + ".png");
					document.getElementById("shakeResult").innerHTML = "<a style='color:white;' href='#'>恭喜你获得美女图片一张！</a>";
					$("#shakeResult").addClass("result result-show");
				}					
			});
		}

		window.onload = function() {
			

			
			
// 			var myShakeEvent = new Shake({
// 				threshold : 15
// 			});

// 			myShakeEvent.start();
			window.addEventListener('shake', shakeEventDidOccur, false);

			function shakeEventDidOccur(){
				clearInterval(shakeInterval);
				
				shakeMusic.play();
				$("#shakeHand").attr("src", "assets/imgs/shakegirl.gif");
				document.getElementById("shakeResult").innerHTML = "";
				$("#shakeResult").removeClass("result result-show");		
				
				var opptyNum = Math.floor(Math.random() * 10);
				if (opptyNum < 2) {
					$("#shakeHand").attr("src", "assets/imgs/shakecry.jpg");
					setTimeout(function() {
						document.getElementById("shakeResult").innerHTML = "抱歉，你什么也没摇到！不要气馁，相信大奖会光顾你！";
						$("#shakeResult").addClass("result result-show");
					}, 500);
					return;
				}
				
				var appVersion = window.navigator.appVersion ;
				var codeName = window.navigator.appCodeName;
				
				$.ajax({
					method : "POST",
					url : "shakeRestReq/happyShake",
					data : {
						codeName : codeName,
						money : 0,
						bless : 0,
						share : 0,
						game : 0,
						coupons : 0,
						appVersion : appVersion,
						location : "Boston"
					}
				}).done(function(redEnvelop) {
					var redEnvelopType = redEnvelop.redEnvelopType;
					if(redEnvelopType=="CASH"){
						setTimeout(function() {
							$("#shakeHand").attr("src", "assets/imgs/cashEnvelop.png");
							document.getElementById("shakeResult").innerHTML = "<a target='_blank' href='initReceiveCash?redEnvelopValue=" + redEnvelop.redEnvelopValue + "'>恭喜你获得" + redEnvelop.redEnvelopValue  +"元现金红包，点击领取</a>";
							$("#shakeResult").addClass("result result-show");
						}, 500);
					}else if(redEnvelopType=="BLESSINGS"){
						$("#shakeHand").attr("src", "assets/imgs/blessPackage.png");
						document.getElementById("shakeResult").innerHTML = redEnvelop.redEnvelopValue;
						$("#shakeResult").addClass("result result-show");
					}else if(redEnvelopType=="COUPONS"){
						$("#shakeHand").attr("src", "assets/imgs/coupons.png");
						document.getElementById("shakeResult").innerHTML = "<a target='_blank' href='" + redEnvelop.redEnvelopURL + "?redEnvelopValue=" + redEnvelop.redEnvelopName + "'>恭喜你获得" + redEnvelop.redEnvelopName  +"，点击领取</a>";
						$("#shakeResult").addClass("result result-show");
					}else if(redEnvelopType=="GAMES"){
						var randomNum = Math.floor(Math.random() * 15);
						$("#shakeHand").attr("src", "assets/photos/" + randomNum + ".png");
						document.getElementById("shakeResult").innerHTML = "<a href='superPhotos' target='_blank'>恭喜你获得Google相册展！</a>";
						$("#shakeResult").addClass("result result-show");
					}else{
						var randomNum = Math.floor(Math.random() * 15);
						$("#shakeHand").attr("src", "assets/photos/" + randomNum + ".png");
						document.getElementById("shakeResult").innerHTML = "<a href='#'>恭喜你获得美女图片一张！</a>";
						$("#shakeResult").addClass("result result-show");
					}					
				});
			}
		};
	</script>

	<div id="footer" class="footer">
		<p>
			系统奖品由<a href="http://www.favdeal.cn" target="_blank">哎咦网</a>友情赞助，<button name="shake" onclick="onShake()">shake</button>
		</p>
	</div>
</body>
</html>