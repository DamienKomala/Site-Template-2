<cfsetting showdebugoutput="yes">
<cfsilent>
	<cfif isDefined("contentid") AND contentid NEQ "">
		<cfset pageinfo = application.pagedata.getContentPage(contentid=#contentid#)>
		<cfif contentid EQ application.exceptions["blgID"]>
			<cfset blogtypes=application.pagedata.getBlogTypes()>
		</cfif>
	<cfelseif isDefined("attorneyid") AND attorneyid NEQ "">
		<cfset pageinfo = application.pageData.getAttyPage(attyid=#attorneyid#)>
	<cfelseif isDefined("blogid") AND blogid NEQ "">
		<cfset pageinfo = application.pagedata.getBlogPage(blogid=#blogid#)>
	<cfelse>
		<cfset pageinfo = application.pagedata.getContentPage(contentid=application.exceptions["homeID"])>
	</cfif>
	<cfif isDefined("caldt") AND ListLen(ReplaceNoCase(caldt,".html",""),"-") EQ 2>
		<cfset getCalItems=application.blogData.getblogCalendarDate(ReplaceNoCase(caldt,".html",""))>
		<cfset calMonth=ListGetAt(caldt,1,"-")>
		<cfset calYear=ListGetAt(ReplaceNoCase(calDt,".html",""),2,"-")>
	<cfelseif isDefined("date") AND ListLen(ReplaceNoCase(date,".html",""),"-") EQ 3>
		<cfset getCalItems=application.blogData.getblogDate(ReplaceNoCase(date,".html",""))>
		<cfset calMonth=ListGetAt(date,1,"-")>
		<cfset calDay=ListGetAt(date,2,"-")>
		<cfset calYear=ListGetAt(ReplaceNoCase(date,".html",""),3,"-")>
	<cfelseif isDefined("category") AND category NEQ "">
		<cfset getCalItems=application.blogData.getBlogCategory(category)>
		<cfif getCalItems.recordcount EQ 0>
			<cflocation url="http://#CGI.SERVER_NAME#/blog/" addtoken="no">
		</cfif> 
	</cfif>
</cfsilent>
<!DOCTYPE html>
<html lang="en">
	<head>
	<meta charset="utf-8">
	<cfoutput>
		<cfif isDefined("getCalItems")>
			<cfif getCalItems.Recordcount EQ 0 AND isDefined("calMonth")>
				<title>#MonthAsString(calMonth)#<cfif isDefined("calDay")> #calDay#,</cfif> #calYear# | Blog Archives</title>
				<meta name="description" content="Read Blogs from #MonthAsString(calMonth)#<cfif isDefined("calDay")> #calDay#,</cfif> #calYear# in post archives from our Attorneys Injury Blog.">
				<cfif isDefined("date")>
					<link rel="canonical" href="http://#CGI.SERVER_NAME#/blog/lawyer-blog-#calMonth#-#calDay#-#calYear#.html">
				<cfelseif isDefined("caldt")>
					<link rel="canonical" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-#calMonth#-#calYear#.html">
				</cfif>
			<cfelse>
				<title>#Replace(getCalItems.titletag,"{category_name}",getCalItems.catname)#</title>
				<cfif LEN(getcalItems.metadesc) GT 150>
					<meta name="description" content="#LEFT(getcalItems.metadesc,147)#...">
				<cfelse>
					<meta name="description" content="#getcalItems.metadesc#">
				</cfif>
				<link rel="canonical" href="http://#CGI.SERVER_NAME#/#getCalItems.canonical#">
			</cfif>
			<cfif getcalItems.metaKW NEQ "">
				<meta name="keywords" content="#getcalItems.metaKW#">
			</cfif>
		<cfelse>
			<title>#Replace(pageInfo.titletag,'&##8217;','''','ALL')#</title>
			<cfif LEN(pageInfo.metadesc) GT 150>
				<meta name="description" content="#LEFT(Replace(pageInfo.metadesc,'&##8217;','''','ALL'),147)#..."/>
			<cfelse>
				<meta name="description" content="#Replace(pageInfo.metadesc,'&##8217;','''','ALL')#"/>
			</cfif>
			<cfif NOT IsDefined('blogid')>
				<meta name="keywords" content="#Replace(pageInfo.keywords,'&##8217;','''','ALL')#" />
			</cfif>
			<cfif pageInfo.canonical EQ "">
			<cfelseif pageInfo.canonical EQ "/">
				<link rel="canonical" href="http://<cfoutput>#CGI.SERVER_NAME#</cfoutput>">
			<cfelseif LEFT(pageInfo.canonical,5) EQ "http:" OR LEFT(pageInfo.canonical,6) EQ "https:">
				<link rel="canonical" href="<cfoutput>#pageInfo.canonical#</cfoutput>">
			<cfelseif isDefined("blogid")>
				<link rel="canonical" href="http://<cfoutput>#CGI.SERVER_NAME#/blog/#pageInfo.canonical#</cfoutput>">
			<cfelse>
				<link rel="canonical" href="http://<cfoutput>#CGI.SERVER_NAME#/#pageInfo.canonical#</cfoutput>">
			</cfif>
		</cfif>
<!--- THIS DEV IS USING FILES FROM THE LIVE MIKE LEWIS SITE so ALL PAGES HEREIN WILL BE NOINDEX/NOFOLLOW. --->
		<cfif isDefined("pageInfo.robots") AND pageInfo.robots EQ 1>
			<meta name="robots" content="index,follow" />
			<meta name="robots" content="noindex,nofollow" />
			<cfelse>
			<meta name="robots" content="noindex,nofollow" />
		</cfif>
		<cfif CGI.SCRIPT_NAME EQ "/search-results.cfm">
			<meta name="description" content="Loading
				google.load('search', '1', {language : 'en'});
				google.setOnLoadCallback(function() {
				var customSearchControl = new" />
		</cfif>
		<cfif isDefined("session.website_google_metatag") AND CGI.PATH_INFO EQ "/index.cfm">
			<meta name="google-site-verification" content="<cfoutput>#session.website_google_metatag#</cfoutput>" />
		</cfif>
		<link rel="publisher" href="https://plus.google.com/+Mikelewisattorneys/posts" title="Mike Lewis Attorneys" />
<link rel="author" href="https://plus.google.com/106346425670819064958/posts/" title="Mike Lewis" />
		
<!---		<cfinclude template="../../commonfiles/includes/googleplus.cfm">--->
	</cfoutput>
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/ico" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!--- start: CSS --->
	<link href="/css/bootstrap.css" rel="stylesheet">
	<link href="/css/bootstrap-responsive.css" rel="stylesheet">
	<link href="/css/local.css" rel="stylesheet">
	<link href="/src/css/ilightbox.css" rel="stylesheet" />
	<link type="text/css" href="/css/jquery.dataTables.css" rel="stylesheet" />
	<!--- start: Java Script --->
	<script defer src="/js/jquery.min.js"></script>
	<script defer src="/js/jquery-ui.min.js"></script>
	<script defer src="/js/modernizr.js"></script>
	<script src="/js/css3-mediaqueries.js"></script>
	<script defer src="/js/jquery.imagesloaded.js"></script>
	<script defer src="/js/bootstrap.min.js"></script>
	<script defer src="http://api.html5media.info/1.1.5/html5media.min.js"></script>
	<script defer src="/js/holder.js"></script>
	<script defer src="/js/custom.js"></script>
	<script defer src="/src/js/jquery.mousewheel.js"></script>
	<script defer src="/src/js/ilightbox.packed.js"></script>
	<script type="text/javascript" src="/js/jquery.dataTables.js"></script>
	<script defer src="/js/socialite.min.js"></script>
	
<!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!--[if IE 8]>
      <style>
	  	.container {width: 1170px;}
	  </style>
<![endif]-->
<!--[if IE 7]>
	  <link rel="stylesheet" href="/css/font-awesome-ie7.css">
	  <style>
	  	.container {width: 1170px;}
	  </style>
<![endif]-->

</head>
	