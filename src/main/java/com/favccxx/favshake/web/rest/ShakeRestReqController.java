package com.favccxx.favshake.web.rest;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.concurrent.TimeoutException;

import javax.servlet.http.HttpServletRequest;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.favccxx.favshake.constants.EnvelopConstants;
import com.favccxx.favshake.entity.BlessWords;
import com.favccxx.favshake.entity.Coupons;
import com.favccxx.favshake.entity.RedEnvelop;
import com.favccxx.favshake.entity.ShakeRecord;
import com.favccxx.favshake.service.BlessWordsService;
import com.favccxx.favshake.service.CouponsService;
import com.favccxx.favshake.service.ShakeRecordService;

@RestController
@RequestMapping("shakeRestReq")
public class ShakeRestReqController {

	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Autowired
	ShakeRecordService shakeRecordService;
	@Autowired
	BlessWordsService blessWordsService;
	@Autowired
	CouponsService couponsService;

	@RequestMapping("/happyShake")
	public RedEnvelop shakeReq(HttpServletRequest request, String codeName, String appVersion)
			throws IOException, TimeoutException {
		// 获取请求的真实IP地址
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		

		// 校验红包服务器是否开启
		// String shakeDate = df.format(new Date());

		RedEnvelop redEnvelop = getRedEnvelop();
		ShakeRecord shakeRecord = new ShakeRecord();
		shakeRecord.setShakeId(new ObjectId().toString());
		shakeRecord.setShakeName(codeName);
		shakeRecord.setShakeApp(codeName);
		shakeRecord.setShakeIp(ip);
		shakeRecord.setShakeResultType(redEnvelop.getRedEnvelopType());
		shakeRecord.setShakeResultValue(redEnvelop.getRedEnvelopValue());
		shakeRecordService.saveShakeRecord(shakeRecord);
		return redEnvelop;
	}

	public RedEnvelop getRedEnvelop() {
		RedEnvelop redEnvelop;
		int randomSeed = (new Random()).nextInt(5);
		// 现金红包
		if (randomSeed == 0) {
			redEnvelop = new RedEnvelop(EnvelopConstants.ENVELOP_NAME_CASH);
			double cashValue = 0.01 * ((new Random()).nextInt(10) + 1);
			redEnvelop.setRedEnvelopValue(String.valueOf(cashValue));
		} else if (randomSeed == 1) {
			redEnvelop = new RedEnvelop(EnvelopConstants.ENVELOP_NAME_BLESSINGS);
			BlessWords blessWords = blessWordsService.findRandomBlessWords();
			redEnvelop.setRedEnvelopValue(blessWords.getBlessContent());
		} else if (randomSeed == 2) {
			redEnvelop = new RedEnvelop(EnvelopConstants.ENVELOP_NAME_COUPONS);
			Coupons coupons = couponsService.findRandomCoupons();
			if (coupons != null) {
				redEnvelop.setRedEnvelopName(coupons.getCouponsName());
				redEnvelop.setRedEnvelopURL(coupons.getCouponsURL());
				redEnvelop.setRedEnvelopValue(coupons.getCouponsValue());
			}
		} else if (randomSeed == 3) {
			redEnvelop = new RedEnvelop(EnvelopConstants.ENVELOP_NAME_GAMES);
		} else {
			redEnvelop = new RedEnvelop(EnvelopConstants.ENVELOP_NAME_SHARES);
		}

		return redEnvelop;
	}
	
}
