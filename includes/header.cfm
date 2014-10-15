<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-5XKTST"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-5XKTST');</script>
<!-- End Google Tag Manager -->
<cfif MONTH(now()) EQ 10><div class="breast-cancer-awareness-ribbon"></div></cfif>
<cfoutput>
<header>
	<div class="row-fluid">
		<div class="container">
			<div class="row-fluid">
				<div class="span4 logo">
					<a href="/"><img src="/images/logo.png" alt="Mike Lewis Attorneys" /></a>
				</div>
				<div class="span4">
					<p class="slogan">Real Help for North Carolina Personal Injury Victims</p>
				</div>
				<div class="span4 phone pull-right">
					<p>Call Us Toll Free <br>
					<a href="tel:18662991769">866-299-1769</a><br>
					for your <strong>FREE</strong> Case Evaluation</p>
				</div>
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="container">
			<div class="navbar navbar-inverse yamm" id="navbar">
				<div class="navbar-inner"> <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">Menu</a>
					<div class="nav-collapse collapse">
						<cfif isDefined("pageInfo.navstring") AND pageInfo.navstring NEQ "">
							#REPLACENOCASE(pageInfo.navstring, '{server_name}', CGI.SERVER_NAME, 'ALL')#
						<cfelse>
							#application.misc.getDefaultNav()#
						</cfif>
					</div>
					<form class="navbar-search form-search pull-right" method="post" action="http://#CGI.SERVER_NAME#/search-results.html" id="searchform" onsubmit="this.action=this.action + '?q=' + document.getElementById('search').value">
					<div class="input-append"><input id="search" class="search-query" type="text" placeholder="Search"  required="required" />
					<button type="submit" class="btn btn-inverse"><i class="icon-search icon-white"></i></button></div>
				</form>
				</div>
			</div>
		</div>
	</div>
</header>
</cfoutput>