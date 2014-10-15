<cfinclude template="includes/head.cfm">
<body class="interior">
<cfinclude template="includes/header.cfm">
<div id="wrapper">
	<div class="container content">
		<div class="row-fluid">
			<section class="span8">
				<div class="center-content">
				<p>Any testing or static page content goes here</p>
				<p>Here's a quick Contact button for a modal form...<br>
<br>
<a data-toggle="modal" href="#CaseEvaluationModal" class="btn btn-primary btn-danger btn-large">Contact Us!</a>
				<!---Common Modal Contact form for case evaluations--->
<!--- moved this div out of footer so it will only exist in the code where used.  Speeds load of pages not using it. --->
<div id="CaseEvaluationModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="CaseEvaluationModal" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		<h3 id="myModalLabel">Contact Us</h3>
	</div>
	<div class="modal-body">
		<cfinclude template="/includes/caseevaluation.cfm">
	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal">Close</button>
	</div>
</div>

				<cfinclude template="includes/socialite.cfm">
					<p id="back-top"><a href="#top">Back to Top</a></p>
				</div>
			</section>
			<cfinclude template="includes/sidebar.cfm">
		</div>
	</div>
</div>
<cfinclude template="includes/footer.cfm">
</body>
</html>
