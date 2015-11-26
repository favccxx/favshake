<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../assets/imgs/favicon.png" />
<title>赞助·爱摇呀</title>
<style type="text/css">
	.sponsorForm{
		margin:0 auto;
	}
	.shakeBlock{
		width:550px;
		height:40px;
	}
	.shakeBlockBless{
		margin-top:10px;
		width:550px;
		height:110px;
	}
	.shakeLabel{
		width:120px;
		display:inline-block;
		text-align: right;
	}
	.shakeTxt{
		width:400px;
	}
</style>
</head>
<body>
	<div style="width:560px ;text-align:center;margin:0 auto">
		<form action="" class="sponsorForm">
			<h3>赞助爱摇</h3>
			<div class="shakeBlock">
				<label class="shakeLabel">赞助人姓名</label>
				<input type="text" id="sponsorName" name="sponsorName" value="" class="shakeTxt"><span style="color:red;"> *</span>
			</div>
			<div class="shakeBlock">
				<label class="shakeLabel">赞助人邮箱</label>
				<input type="text" id="sponsorEmail" name="sponsorEmail" value="" class="shakeTxt"><span style="color:red;"> *</span>
			</div>
			<div class="shakeBlock">
				<label class="shakeLabel">赞助类型</label>
				<select id="sponsorType" name="sponsorType" class="shakeTxt" onchange="onSponsorTypeChange()">
					<option value="bless" selected="selected">祝福语</option>
					<option value="coupon">优惠券</option>
					<option value="photo">美图</option>
					<option value="cash">现金</option>
				</select><span style="color:red;"> *</span>
			</div>
			<div id="sponsorBless">
				<div>
					<label class="shakeLabel">祝福类型</label>
					<select id="blessType" name="blessType" class="shakeTxt">
						<option value="fortune">恭喜发财</option>
						<option value="healthy">身体健康</option>
						<option value="bless">祝福朋友</option>
						<option value="work">工作顺利</option>
						<option value="festival">节日祝福</option>
					</select><span style="color:red;"> *</span>
				</div>
				<div class="shakeBlockBless">
					<label class="shakeLabel" style="height:110px;vertical-align: middle;">赞助祝福</label>
					<textarea rows="3" cols="8" id="blessContent" name="blessContent" class="shakeTxt"></textarea><span style="color:red;"> *</span>
				</div>
			</div>
			<div id="sponsorCoupons">
				<div class="shakeBlock">
					<label class="shakeLabel">优惠券名称</label>
					<input type="text" id="couponsName" name="couponsName" value="" class="shakeTxt"><span style="color:red;"> *</span>
				</div>
				<div class="shakeBlock">
					<label class="shakeLabel">优惠券地址</label>
					<input type="text" id="couponsURL" name="couponsURL" value="" class="shakeTxt"> <span style="color:red;"> *</span>
				</div>
				<div class="shakeBlock">
					<label class="shakeLabel">优惠券过期日期</label>
					
				</div>
			</div>
			<div id="sponsorPhotos">
				<label class="shakeLabel">上传美图</label>
				<input type="file">
			</div>
			<div id="sponsorCash">
				<div class="shakeBlock">
					<label class="shakeLabel">赞助金额</label>
					<input type="text" id="cashNum" name="cashNum" value="" style="width:380px;">元<span style="color:red;"> *</span>
				</div>
				<div class="shakeBlock">
					<span style="color:#AFA09D;">请将赞助金转到chenxu.wo@163.com支付宝账户，赞助以红包回馈用户。</span>
				</div>
			</div>
			<div class="shakeBlock">
				<input type="button" name="赞助" value="豪华赞助" onclick="onSponsor()">
			</div>
		</form>
	</div>
	
	<script src="../assets/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			$("#sponsorType option:first").val();
			$("#sponsorType").val("bless");
			$("#sponsorCoupons").css("display","none");
			$("#sponsorPhotos").css("display","none");
			$("#sponsorCash").css("display","none");
		}
		
		function onSponsorTypeChange(){
			var sponsorType = $("#sponsorType").val();
			if(sponsorType=="bless"){
				$("#sponsorCoupons").css("display","none");
				$("#sponsorPhotos").css("display","none");
				$("#sponsorCash").css("display","none");
				$("#sponsorBless").css("display", "inline-block");
			}else if(sponsorType=="coupon"){
				$("#sponsorCoupons").css("display","inline-block");
				$("#sponsorPhotos").css("display","none");
				$("#sponsorCash").css("display","none");
				$("#sponsorBless").css("display", "none");
			}else if(sponsorType=="photo"){
				$("#sponsorCoupons").css("display","none");
				$("#sponsorPhotos").css("display","inline-block");
				$("#sponsorCash").css("display","none");
				$("#sponsorBless").css("display", "none");
			}else if(sponsorType=="cash"){
				$("#sponsorCoupons").css("display","none");
				$("#sponsorPhotos").css("display","none");
				$("#sponsorCash").css("display","inline-block");
				$("#sponsorBless").css("display", "none");
			}
		}
		
		function onSponsor(){
			var sponsorName = $("#sponsorName").val();
			var sponsorEmail = $("#sponsorEmail").val() || "";
			if(sponsorName=="" || sponsorName==undefined){
				alert("赞助人姓名不能为空！");
				return;
			}
			
			var sponsorType = $("#sponsorType").val();
			if(sponsorType=="bless"){
				var sponsorBless =  $("#blessContent").val();
				var blessType = $("#blessType").val();
				
				if(sponsorBless=="" || sponsorBless==undefined){
					alert("祝福内容不能为空！");
					return;
				}
				
				var sponsorData = {
						sponsorName : sponsorName,
						sponsorEmail : sponsorEmail,
						sponsorBless : sponsorBless,
						blessType : blessType
				};
				
				$.ajax({
					method : "POST",
					url : "addBless",
					data :sponsorData
				}).done(function(msg) {
					alert("谢谢您的慷慨馈赠，这条祝福消息将随机广播给用户。");
				});
				return;
			}else if(sponsorType=="coupon"){
				var couponsName = $("#couponsName").val();
				var couponsURL = $("#couponsURL").val();
				if(couponsName=="" || couponsName==undefined){
					$("#couponsName").focus();
					alert("优惠券名称不允许为空!");
					return;
				}
				
				if(couponsURL=="" || couponsURL==undefined){
					$("#couponsURL").focus();
					alert("优惠券地址不允许为空!");
					return;
				}
				
				var sponsorData = {
						sponsorName : sponsorName,
						sponsorEmail : sponsorEmail,
						couponsName : couponsName,
						couponsURL : couponsURL
				};
				
				$.ajax({
					method : "POST",
					url : "addCoupons",
					data :sponsorData
				}).done(function(msg) {
					alert("谢谢您的慷慨馈赠，我代表用户衷心感谢您！");
				});
				return;
			}else if(sponsorType=="photo"){
				
			}else if(sponsorType=="cash"){
				var cashNum = $("#cashNum").val();
				if(cashNum=="" || cashNum==undefined || isNaN(cashNum) || cashNum<0){
					$("#cashNum").focus();
					alert("请填写正确的赞助金额!");
					return;
				}
				var sponsorData = {
						sponsorName : sponsorName,
						sponsorEmail : sponsorEmail,
						cashNum : cashNum
				};
				
				$.ajax({
					method : "POST",
					url : "addSponsorCash",
					data :sponsorData
				}).done(function(msg) {
					alert("谢谢您的慷慨馈赠，赞助金将以红包形式回馈给用户！");
				});
			}
		}
		
		/**添加祝福消息*/
		function addBless(sponsorData){
			
		}
		
		function addCoupons(sponsorData){
			
		}
	</script>
</body>
</html>