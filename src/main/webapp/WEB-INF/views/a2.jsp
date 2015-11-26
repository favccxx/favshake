<!DOCTYPE html>
<html>
<head>
<title>Device Properties Example</title>

<!--     <script type="text/javascript" charset="utf-8" src="assets/wormhole.js"></script> -->
<script type="text/javascript" charset="utf-8">
	var sBrowser, sUsrAg = navigator.userAgent;

	if (sUsrAg.indexOf("Chrome") > -1) {
		sBrowser = "Google Chrome";
	} else if (sUsrAg.indexOf("Safari") > -1) {
		sBrowser = "Apple Safari";
	} else if (sUsrAg.indexOf("Opera") > -1) {
		sBrowser = "Opera";
	} else if (sUsrAg.indexOf("Firefox") > -1) {
		sBrowser = "Mozilla Firefox";
	} else if (sUsrAg.indexOf("MSIE") > -1) {
		sBrowser = "Microsoft Internet Explorer";
	}

	alert("You are using: " + sBrowser);
	var codeName = window.navigator.appCodeName ;
	var appVersion = window.navigator.appVersion ;
	alert("appCodeName :" + codeName + "       " + appVersion);
	var platform = navigator.platform;
	alert("platform :" + platform );
	
	var productName = window.navigator.product ;
	alert(productName);
</script>
</head>
<body>
	<p id="deviceProperties">Loading device properties...</p>
</body>
</html>