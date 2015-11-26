<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="IE=Edge,chrome=1" http-equiv="X-UA-Compatible">
<!--     <meta content="width=1200,initial-scale=0.3,user-scalable=no" name="viewport"> -->
<!--     <meta content="Google 相册会妥善备份、整理所有的照片，并自动为其添加标签，让您可以快速查找照片，并以自己喜爱的方式分享。" name="description"> -->
<!--     <meta content="Google 相册, Google Photos, 照片, photos, 备份, backup, 备, back, 份, up, 图库, gallery, 视频, videos, 图片, pictures, 搜索, search, 照片, photo, 视频, video, 拼贴, collage, 动画, animation, 影片, movie, 故事, story, 编辑器, editor, 修改, editing, gif, 剪裁, crop, 滤镜, filter, 修片, enhance, iOS" name="keywords"> -->
<!--     <meta content="Google 相册 - 妥善分类所有照片，查找更方便" property="og:title"> -->
<!--     <meta content="https://www.gstatic.com/images/branding/product/2x/photos_96dp.png" property="og:image"> -->
<!--     <meta content="Google 相册会妥善备份、整理所有的照片，并自动为其添加标签，让您可以快速查找照片，并以自己喜爱的方式分享。" property="og:description"> -->
<!--     <meta content="https://www.google.com/photos/about/" property="og:url"> -->
<!--     <meta content="-YYy5aehE2g0cxecUCEfHCwV__CSqMaTIilLL6im3xM" name="google-site-verification"> -->
    <title>Google 相册 - 妥善分类所有照片，查找更方便</title>
    <link href='assets/css/googlephoto.css' rel='stylesheet' type='text/css'>
    <link href="assets/css/main.min.css" rel="stylesheet">
</head>
</head>
<body>
	<div data-mobilepaddingtop="150" data-paddingtop="60"
		id="google-photos-page">
		<div class="google-header"
			style="background-image: ('/photos/about/images/ui/google-photos-logo.png?hl=zh')">
			<a href="//photos.google.com/login" id="header-download-btn">
				<div class="get-started-btn">
					<span class="desktop-cta">转到 Google 相册</span> <span
						class="mobile-cta">从 App Store 下载</span>
				</div>
			</a>
			<div class="download">
				<span>下载</span> <a
					href="#">
					<div class="ico android">
						<div class="ico hover-state android">
							<span>Android</span>
						</div>
					</div>
				</a> <a
					href="#">
					<div class="ico ios">
						<div class="ico hover-state ios">
							<span>Apple iOS</span>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="photos-preloader">
			<div class="spinner"></div>
		</div>
		<div class="nav dark">
			<div class="nav-wrap home">
				<a class="nav-button" data-page="cover" data-section="home"
					href="./">Home</a>
			</div>
			<div class="nav-wrap auto-backup">
				<a class="nav-button" data-page="cover" data-section="auto-backup"
					href="./?page=auto-backup">Auto Backup</a>
				<div class="subnav-container">
					<a class="sub-dot" data-page="sub" data-section="search"
						href="./?page=search">Search</a>
				</div>
			</div>
			<div class="nav-wrap auto-awesome">
				<a class="nav-button" data-page="cover" data-section="auto-awesome"
					href="./?page=auto-awesome">Auto Awesome</a>
				<div class="subnav-container">
					<a class="sub-dot" data-page="sub" data-section="movie"
						href="./?page=movie">Movie</a> <a class="sub-dot" data-page="sub"
						data-section="stories" href="./?page=stories">Stories</a> <a
						class="sub-dot" data-page="sub" data-section="panorama"
						href="./?page=panorama">Panorama</a>
				</div>
			</div>
			<div class="nav-wrap auto-enhance">
				<a class="nav-button" data-page="cover" data-section="auto-enhance"
					href="./?page=auto-enhance">Auto Enhance</a>
			</div>
			<div class="nav-wrap footer">
				<a class="nav-button" data-page="cover" data-section="footer"
					href="./?page=footer">Footer</a>
			</div>
		</div>
		<div class="photos-module home-module" data-href="home">
			<div class="video-container"
				data-vid-path="assets/imgs/videos/home-module/home-vid"
				data-vid-label="hands typing a search term on a mobile phone"></div>
			<div class="text-container">
				<span class="title">妥善分类所有照片，查找更方便</span> <span class="subtitle">您现在可以更加快捷地查找照片和视频，并更加轻松地进行修改和分享。</span>
				<span class="btn-container"></span> <span class="mobile-link">或<a
					href="https://photos.google.com">转到移动网站</a></span>
			</div>
			<div class="arrow"></div>
		</div>
		<div class="photos-module auto-backup-module" data-href="auto-backup"
			data-image-label="people on a hike">
			<div class="cover" dir="ltr">
				<div class="text-container">
					<span class="title">集中存放所有照片</span> <span class="subtitle">Google
						相册可以妥善保存您所有的图片，查找起来也很方便。</span>
				</div>
				<div class="arrow"></div>
			</div>
			<div class="auto-backup-block">
				<div class="module-container"></div>
				<div class="section-subtitle">
					<span class="title">搜集各个设备上的所有照片和视频</span> <span class="subtitle">Google
						相册可自动备份您手机、笔记本电脑等设备上的照片和视频。</span>
				</div>
			</div>
		</div>
		<div class="photos-module search-module" data-href="search">
			<div>
				<div class="module-container">
					<div class="auto-backup-image-tablet">
						<div class="video-container"
							data-vid-path="assets/imgs/videos/search-module/search-vid"
							data-vid-label="photos of a dog"></div>
					</div>
				</div>
				<div class="light-container">
					<div class="section-subtitle">
						<span class="title">根据照片中的内容进行查找</span> <span class="subtitle">想要查找画面中有爱犬的照片吗？只需点按“狗”或拍摄地点即可更加快速找到相应照片。</span>
					</div>
				</div>
			</div>
		</div>
		<div class="photos-module auto-awesome-module"
			data-href="auto-awesome">
			<div class="cover">
				<div class="text-container">
					<span class="title">让美好记忆更加生动</span> <span class="subtitle">Google
						相册可以立即将静态照片转换成丰富多彩的故事、影片和动画。</span>
				</div>
				<div class="arrow"></div>
			</div>
			<div class="auto-awesome-block">
				<div class="module-container"></div>
				<div class="section-subtitle">
					<span class="title">加入动态效果</span> <span class="subtitle">上传五张以上的连拍照片，就能制作有趣的
						GIF 动画，超神！</span>
				</div>
			</div>
		</div>
		<div class="photos-module movie-module" data-href="movie">
			<div class="module-container">
				<div class="auto-awesome-icon"></div>
				<div class="video-container"
					data-vid-path="assets/imgs/videos/movie-module/movie"
					data-vid-label="a short film of people on a beach"></div>
				<div class="images-container"></div>
				<div class="mobile-backup"></div>
			</div>
			<div class="section-subtitle">
				<span class="title">制作专业水准的影片</span> <span class="subtitle">相关照片和视频瞬时就能合成为具有专业水准的影片，而且还会配上合适的音乐。</span>
			</div>
		</div>
		<div class="photos-module stories-module" data-href="stories">
			<div class="module-container">
				<div class="nexus-phone">
					<div class="video-container"
						data-vid-path="assets/imgs/videos/stories-module/stories-vid"
						data-vid-label="travelogue that includes photos and locations from a trip"></div>
				</div>
				<div class="mobile-backup"></div>
			</div>
			<div class="section-subtitle">
				<span class="title">观看完整的故事</span> <span class="subtitle">旅程中的精彩照片和视频会以互动时间轴的方式编排，展示精美的画面，同时列出您造访过的地点。</span>
			</div>
		</div>
		<div class="photos-module panorama-module" data-href="panorama">
			<div class="module-container">
				<div class="auto-awesome-icon"></div>
				<div class="images-container"></div>
				<div class="mobile-backup"></div>
			</div>
			<div class="section-subtitle">
				<span class="title">拍摄全景</span> <span class="subtitle">上传 3
					张或以上照片，即可制作完美拼接的全景图片。</span>
			</div>
		</div>
		<div class="photos-module auto-enhance-module"
			data-href="auto-enhance">
			<div class="cover">
				<div class="text-container">
					<span class="title">润色照片不费吹灰之力</span> <span class="subtitle">即时滤镜或快捷修片工具可迅速润色照片或增添创意效果。</span>
				</div>
				<div class="arrow"></div>
			</div>
			<div class="auto-enhance-block">
				<div class="module-container"></div>
				<span class="enhanced-text">修片后</span> <span class="original-text">修片前</span>
				<div class="section-subtitle">
					<span class="title">立即获得完美照片</span> <span class="subtitle">轻松修饰相片内容，让其中的美景、人物和主题呈现出最佳效果。若对修片结果不满，也可轻松还原。</span>
				</div>
			</div>
		</div>
		<div class="photos-module footer-module" data-href="footer">
			<div class="module-container">
				<div class="footer-cols">
					<div class="col col-1" data-gradient="01"
						data-vid="assets/imgs/videos/footer-module/auto-backup"
						data-vid-label="hands typing a search term on a mobile phone"
						href="/?page=auto-backup">
						<span class="col-text">所有照片井井有条，查找更方便</span>
					</div>
					<div class="col col-2" data-gradient="02"
						data-vid="assets/imgs/videos/footer-module/auto-awesome"
						href="/?page=auto-awesome" data-vid-label="woman on a beach">
						<span class="col-text">让美好记忆更加生动</span>
					</div>
					<div class="col col-3" data-gradient="03"
						data-vid="assets/imgs/videos/footer-module/auto-enhance"
						href="/?page=auto-enhance"
						data-vid-label="enhanced photo of a man and a woman">
						<span class="col-text">润色照片不费吹灰之力</span>
					</div>
				</div>
			</div>
			<div class="footer-text">
				<span class="text">寻找和重温美好回忆。</span> <a
					href="//photos.google.com/login"><div class="get-started-btn">
						<span>转到 Google 相册</span>
					</div></a>
			</div>
			<div class="bottom">
				<div class="google-logo"></div>
				<a href="//www.google.com/intl/zh-CN/policies/" target="_blank">
					<div class="text">隐私权和条款</div>
				</a>
				<div class="social">
					<a class="icon gplus"
						href="https://plus.google.com/+GooglePhotos/posts" target="_blank"></a>
					<a class="icon twitter" href="https://twitter.com/googlephotos"
						target="_blank"></a>
				</div>
			</div>
		</div>
		<script src="assets/js/TweenMax.min.js"></script>
		<script src="assets/js/main.min.js"></script>
		<script src="assets/js/autotrack.js"></script>
		<script>
			new gweb.analytics.AutoTrack({
				profile : 'UA-52720724-1'
			});
		</script>
</body>
</html>
