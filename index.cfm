<cfif isdefined('session.ismobile') and session.ismobile eq 1>
	<!---Include the mobile index page--->
	<cfinclude template="mobile-index.cfm">
	<cfabort>
</cfif>
<cfinclude template="includes/head.cfm">
<body class="home">
<cfinclude template="includes/header.cfm">
<div id="wrapper">
	<div class="container content">
		<div class="row-fluid">
			<section class="span8">
				<div id="mainCarousel" class="carousel slide">
					<div class="carousel-inner">
						<div class="item active"><img src="/images/slider/mike-lewis-slide1.jpg" alt="Mike Lewis Attorneys" />
							<div class="carousel-caption">
								<h4>North Carolina Injury Attorneys</h4>
								<p>The North Carolina Injury Attorneys at Mike Lewis have been fighting diligently for the victims of personal injury in North Carolina and throughout the United States... <a href="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/injury-verdicts-and-settlements.html" >Read More</a></p>
							</div>
						</div>
						<div class="item"><img src="/images/slider/mike-lewis-slide2.jpg" alt="Mike Lewis Attorneys" />
							<div class="carousel-caption">
								<h4>Verdicts and Settlments</h4>
								<p>The North Carolina Injury Attorneys at Mike Lewis have been fighting diligently for the victims of personal injury in North Carolina and throughout the United States... <a href="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/injury-verdicts-and-settlements.html" >Read More</a></p>
							</div>
						</div>
						<div class="item"><img src="/images/slider/mike-lewis-slide3.jpg" alt="Mike Lewis Attorneys" />
							<div class="carousel-caption">
								<h4>Injured in an Accident</h4>
								<p>The Vehicle Accident Attorneys at Mike Lewis are skilled in helping those who have sustained injuries due to a car, truck, motorcycle, ATV, or bicycle Accident... <a href="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/auto-accident-attorney.html" >Read More</a></p>
							</div>
						</div>
						<div class="item"><img src="/images/slider/mike-lewis-slide4.jpg" alt="Mike Lewis Attorneys" />
							<div class="carousel-caption">
								<h4>Social Security Disability Attorneys</h4>
								<p>Denied Social Security disability benefits? Contact our attorneys today to discuss your legal options... <a href="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/social-security-disability-attorney.html" >Read More</a></p>
							</div>
						</div>
						<div class="item"><img src="/images/slider/mike-lewis-slide5.jpg" alt="Mike Lewis Attorneys" />
							<div class="carousel-caption">
								<h4>AVVO Rating 10.0 Superb</h4>
								<p>Denied Social Security disability benefits? Contact our attorneys today to discuss your legal options... <a href="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>/social-security-disability-attorney.html" >Read More</a></p>
							</div>
						</div>
					</div>
					<a class="left carousel-control" href="#mainCarousel" data-slide="prev">&lsaquo;</a> <a class="right carousel-control" href="#mainCarousel" data-slide="next">&rsaquo;</a> </div>
				<div class="center-content">
					<h1 class="headline"><cfoutput>#REPLACE(pageInfo.title, "{server_name}",CGI.SERVER_NAME,"ALL")#</cfoutput></h1>				
					<cfoutput>#REPLACE(pageInfo.body1,"{server_name}",CGI.SERVER_NAME,"ALL")#</cfoutput> <cfoutput>#REPLACE(pageInfo.body2,"{server_name}",CGI.SERVER_NAME,"ALL")#</cfoutput>
					
				</div>
			</section>
			<cfinclude template="includes/sidebar.cfm">
		</div>
		<div class="row-fluid">
			<div class="span12" id="back-top"><a href="#top" class="back-to-top">Back to Top</a></div>
		</div>
	</div>
</div>
<cfinclude template="includes/footer.cfm">
</body>
</html>