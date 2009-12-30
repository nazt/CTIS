<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta content="yes" name="apple-mobile-web-app-capable" /><meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" /><link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" /><meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" /><link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" /><script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
<title>iWebKit Demo - Try out iWebKit and create the ultimate iPhone website!</title><meta content="iPod,iPhone,Webkit,iWebkit,Website,Create,mobile,Tutorial,free" name="keywords" /><meta content="Try out all exclusive features iWebKit 4.0 has to offer and discover how far web developement can go. Create the ultimate WebApp!" name="description" /></head>

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
	<li class="title">Traffic Report</li>
	 <g:each in="${reportInstanceList}" status="i" var="reportInstance">
		
	<li>
		<a href="">
			<span class="name">${fieldValue(bean:reportInstance, field:'message')}</span>
			<span class="arrow"></span>
		</a>
	</li>

         <!-- <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
         
             <td><g:link action="show" id="${reportInstance.id}">${fieldValue(bean:reportInstance, field:'id')}</g:link></td>
         
             <td>${fieldValue(bean:reportInstance, field:'congestion_cause')}</td>
         
             <td>${fieldValue(bean:reportInstance, field:'congestion_level')}</td>
         
             <td>${fieldValue(bean:reportInstance, field:'message')}</td>
         
             <td>${fieldValue(bean:reportInstance, field:'latitude')}</td>
         
             <td>${fieldValue(bean:reportInstance, field:'longitude')}</td>
         
         </tr> -->
     </g:each>
	</ul>
	<!-- <span class="graytitle">Outgoing Links</span><ul class="pageitem">
		<li class="menu"><a href="rss.html">
		<img alt="wordpress" src="/CTIS/Framework/thumbs/wordpress.png" /><span class="name">The 
		iWebKit Blog</span><span class="comment">embedded!</span><span class="arrow"></span></a></li>
	</ul> -->
</div>
 
<div id="footer">
	<a href="http://iwebkit.net"> </a></div>
</body>
</html>