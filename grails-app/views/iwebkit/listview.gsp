<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="index,follow" name="robots" />
	<meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" />
	<link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" />
	<meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" />
	<link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" />
	<script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
<title>Traffic ListView Report</title>
<meta content="iPod,iPhone,Webkit,iWebkit,Website,Create,mobile,Tutorial,free" name="keywords" />
<meta content="Try out all exclusive features iWebKit 4.0 has to offer and discover how far web developement can go. Create the ultimate WebApp!" name="description" /></head>

<body class="list" onload="iWebkit();">

	<div id="topbar">
		<div id="title">
			View Option</div>
		<div id="leftnav">
			<a href="/CTIS/iwebkit/view"><img src="/CTIS/Framework/images/home.png" alt="home"/></a>
		</div>
	</div>
<div id="content">
 <ul class="autolist">
	<li class="title">Traffic  Report</li>
	 <g:each in="${reportInstanceList}" status="i" var="reportInstance">
			<li class="withimage">
					<a class="noeffect" href="">
					<img src="/CTIS/Framework/thumbs/${reportInstance?.congestion_cause?.imageSrc}" alt="test"/>
					<span class="name">${fieldValue(bean:reportInstance,field:'message')}</span>
					<span class="comment">Thailand</span>
					<span class="arrow"></span>
				</a>
			</li>
		  </g:each>
		<li class=" autolisttext  "><a href="#" class="noeffect">Load 10 more items...</a></li>
	</ul>
</div>
 
</body>
</html>