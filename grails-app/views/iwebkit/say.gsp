<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><meta content="yes" name="apple-mobile-web-app-capable" /><meta content="index,follow" name="robots" /><meta content="text/html; charset=iso-8859-1" http-equiv="Content-Type" /><link href="http://iwebkit.net/apple-touch-icon.png" rel="apple-touch-icon" /><meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport" /><link href="/CTIS/Framework/css/style.css" rel="stylesheet" type="text/css" /><script src="/CTIS/Framework/javascript/functions.js" type="text/javascript"></script>
<title>Share  </title><meta content="iPod,iPhone,Webkit,iWebkit,Website,Create,mobile,Tutorial,free" name="keywords" /><meta content="Try out all exclusive features iWebKit 4.0 has to offer and discover how far web developement can go. Create the ultimate WebApp!" name="description" /></head>
<body>

	<div id="topbar">
		<div id="title">
			Say</div>
		<div id="leftnav">
			<a href="/CTIS/iwebkit/index"><img src="/CTIS/Framework/images/home.png" alt="home"/></a>
		</div>
	</div>
	<div id="content">

		<span class="graytitle">Location</span><ul class="pageitem">
 
			<li class="menu"><a href="/CTIS/iwebkit/map">
			<img alt="list" src="/CTIS/Framework/thumbs/contacts.png" /><span class="name">Thammasat University, Rungsit Thailand</span><span class="comment">Adjust..</span><span class="arrow"></span></a></li>
			
			</ul>	
			<g:form name="myForm" url="[action:'form',controller:'iwebkit']" >
		<span class="graytitle">Congestion Level</span><ul class="pageitem">
				<li class="form">                                   
					 <g:select optionKey="id" from="${CongestionLevel.list()}" name="congestion_level.id" value="${reportInstance?.congestion_level?.id}"> </g:select>
					<span class="arrow"></span> 
				</li>

		</ul>
		
		<span class="graytitle">Cause</span><ul class="pageitem">
				<li class="form">                                   
					 <g:select optionKey="id" from="${CongestionCause.list()}" name="congestion_cause.id" value="${reportInstance?.congestion_cause?.id}" ></g:select>
					<span class="arrow"></span> 
				</li>

		</ul>
			<span class="graytitle">Say.. (optional)</span><ul class="pageitem">
					<li class="textbox"><textarea name="message" id="message"></textarea></li>
				</ul>
				<ul class="pageitem">
					<li class="form"><button name="button">Send</button></li>

					</ul>
				</ul>
	</div>
	</g:form>
	<div id="footer">
		<a href="http://iwebkit.net"></a></div>
	</body>
	</html>