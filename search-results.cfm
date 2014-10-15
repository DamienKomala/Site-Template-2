<cfinclude template="includes/head.cfm">
<body class="interior">
<cfinclude template="includes/header.cfm">
<div id="wrapper">
	<div class="container content">
		<div class="row-fluid">
			<section class="span8">
				<div class="center-content">
					<h1>Search Results</h1>
					<script>
					  (function() {
						var cx = '004064042311968474665:dgkwsqrtrjs';
						var gcse = document.createElement('script');
						gcse.type = 'text/javascript';
						gcse.async = true;
						gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
							'//www.google.com/cse/cse.js?cx=' + cx;
						var s = document.getElementsByTagName('script')[0];
						s.parentNode.insertBefore(gcse, s);
					  })();
					</script>
					<gcse:search></gcse:search>
				</div>
			</section>
			<cfinclude template="includes/sidebar.cfm">
		</div>
		<div class="row-fluid">
			<div class="span12" id="back-top"><a href="#top">Back to Top</a></div>
		</div>
	</div>
</div>
<cfinclude template="includes/footer.cfm">
</body>
</html>