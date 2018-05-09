<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="assets/imgs/favicon.png" />
<title>哎摇-摇一摇</title>
<style type="text/css">
	.demo{width:320px; margin:40px auto 0 auto; }
	.hand { width: 190px; height: 300px; margin:0 auto; background: url(assets/imgs/hand.png) no-repeat; }
	.hand-animate { -webkit-animation: hand_move infinite 2s; }
	.result { background: #393B3C; border: #2C2C2C 1px solid; box-shadow: inset #4D4F50 0 0 0 1px; border-radius: 10px; color: #fff; padding: 10px; width: 300px; opacity: 0;
	        -webkit-transition: all 1s;
	           -moz-transition: all 1s;
	            -ms-transition: all 1s;
	             -o-transition: all 1s;
	                transition: all 1s; }
	.result-show { opacity: 1; margin-top: 50px; }
	
	 @-webkit-keyframes hand_move {
	        0% {
	            -webkit-transform: rotate(0);
	               -moz-transform: rotate(0);
	                -ms-transform: rotate(0);
	                 -o-transform: rotate(0);
	                    transform: rotate(0); }
	        50% {
	            -webkit-transform: rotate(15deg);
	               -moz-transform: rotate(15deg);
	                -ms-transform: rotate(15deg);
	                 -o-transform: rotate(15deg);
	                    transform: rotate(15deg); }
	        100% {
	            -webkit-transform: rotate(0);
	               -moz-transform: rotate(0);
	                -ms-transform: rotate(0);
	                 -o-transform: rotate(0);
	                    transform: rotate(0); }
	    }
</style>
</head>

<body>
	<div id="header" style="text-align: center;">
    	<div id="logo"><h1>摇一摇有惊喜</h1></div>
	</div>
	<div id="main" style="text-align: center;">
		<div class="demo">
			<img id="shakeHand" alt="" src="assets/imgs/handshake.png">
			<div id="shakeResult"></div>	
		</div>
		<audio id="shakeMusic" style="display: none;" preload="metadata" controls src="assets/videos/cricket.wav"></audio>
		<br />
	</div>
	<script src="assets/js/jquery-2.1.4.min.js"></script>
	<script src="assets/js/shake.js"></script>
	<script type="text/javascript">	
		var shakeMusic = document.getElementById("shakeMusic");

		window.onload = function() {
			//默认图片的左右摇动效果
			var shakeInterval = setInterval(shakeLR, 500);
			function shakeLR(){
				$("#shakeHand").animate({marginLeft:"100px"},"slow","swing",function ss(){
				}).animate({marginLeft:"-100px"});
			}
			
			var myShakeEvent = new Shake({
				threshold : 15
			});

			myShakeEvent.start();
			window.addEventListener('shake', shakeEventDidOccur, false);

			function shakeEventDidOccur(){
				//清除定时器，图片不再左右摆动
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

	<div id="footer" style="text-align: center;">
		<p>
			系统奖品由<a href="http://www.favdeal.cn" target="_blank">哎咦网</a>友情赞助，<a href="sponsor/initSponsor" target="_blank">我要赞助</a>
		</p>
	</div>
</body>
</html>