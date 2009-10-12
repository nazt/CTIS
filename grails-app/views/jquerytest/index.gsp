<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
 <g:javascript library="jquery"/>
 <link rel="stylesheet" href="/CTIS/css/ui-lightness/jquery-ui-1.7.2.custom.css" />
 <script type="text/javascript" src="/CTIS/js/jquery/jquery-ui-1.7.2.custom.min.js"></script>

<style type="text/css">
		#demo-frame > div.demo { padding: 10px !important; };
	</style>
	<script type="text/javascript">
	$(function() {
		$("#slider-range-min").slider({
			range: "min",
			value: 37,
			min: 1,
			max: 700,
			slide: function(event, ui) {
				$("#amount").val('$' + ui.value);
			}
		});
		$("#amount").val('$' + $("#slider-range-min").slider("value"));
	});
	</script>


    </head>
    <body>
		<div class="demo">

		<p>
		<label for="amount">Maximum price:</label>
		<input type="text" id="amount" style="border:0; color:#f6931f; font-weight:bold;" />
		</p>

		<div id="slider-range-min"></div>

		</div><!-- End demo -->

		<div class="demo-description">

		<p>Fix the minimum value of the range slider so that the user can only select a maximum.  Set the <code>range</code> option to "min."</p>

		</div><!-- End demo-description -->
    </body>
</html>