<cfset session.thankyou_submitted=1>
<cfinclude template="includes/head.cfm">
<body class="home">
<!---start: Header --->
<cfinclude template="includes/header.cfm">
<!---end: Header---> 
<div id="wrapper">
	<div	class="container">
		<div class="content clearfix">
			<div class="row-fluid">
				<div class="span8 main-content">
					<div class="title">
						<h2>Thank You</h2>
					</div>
					<p style="font-size:14px">At Mike Lewis Attorneys, we value your feedback, questions, and concerns. We will make every effort to respond to your inquiry within 24-48 hours.</p>
					<br />
					<p id="back-top"><a href="#top"><span></span>Back to Top</a></p>
				</div>
				<cfinclude template="includes/sidebar.cfm">
			</div>
		</div>
	</div>
	<div class="clearfix"></div>
	<br class="clean" />
</div>
<cfinclude template="includes/footer.cfm">
<cfinclude template="includes/scripts.cfm">

</body>
</html>
