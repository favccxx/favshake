# favshake
favshake
基于HTML + JS 的网页版#摇一摇#


# 实现原理
在HTML5中，DeviceOrientation特性所提供的DeviceMotion事件封装了设备的运动传感器时间，通过改时间可以获取设备的运动状态、加速度等数据（另还有deviceOrientation事件提供了设备角度、朝向等信息）。通过DeviceMotion对设备运动状态的判断，则可以帮助我们在网页上实现“摇一摇”的交互效果。

# 实现方法
本系统借鉴了alexgibson的shake工具类- https://github.com/alexgibson/shake.js -计算手机是否在进行摇一摇功能，

# 使用方法


摇一摇奖品公有6种，分别如下，其中祝福语/优惠券需要提前录入到系统中，录入地址： http://localhost:8080/favshake/sponsor/initSponsor

- 什么也没摇到
- 摇到系统录入的祝福语
- 摇到优惠券
- 摇到支付宝红包
- 摇到照片
- 摇动Google相册

# 效果图

![image](https://github.com/favccxx/favshake/tree/master/images/shake_index.png)