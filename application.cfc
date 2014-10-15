<cfcomponent>
	<cfscript>
		this.name = "MikeLewis-Responsive";
		this.applicationTimeout = createTimeSpan(0,12,59,1);
		this.clientmanagement= "no";
		this.loginstorage = "session" ;
		this.sessionmanagement = "yes";
		this.sessiontimeout = createTimeSpan(0,0,20,1);
		this.setClientCookies = "yes";
		this.setDomainCookies = "no";
		this.scriptProtect = "all";
	</cfscript>

<!--- =========================================================================================================================================== --->
<!--- onApplicationStart                                                                                                                          --->
<!--- =========================================================================================================================================== --->
	<cffunction name="onApplicationStart" output="false">
		<cfset application.time="#DateFormat(CreateODBCDatetime(now()), "mm/dd/yyyy")#">
		<cfset application.fulltime="#DateFormat(CreateODBCDatetime(now()), "mmmm dd, yyyy")#">
		<cfset application.datasource1 = "pmpmg">
		<cfset application.imgdir="images">
		<cfset application.apnhstateabbr = "NC">
		<cfset application.apnhstate = "North Carolina">
		<cfset application.domainid = 100>


		<cfset application.misc = createobject("component", "assets.components.misc").init()>
		<cfset application.blogData = createobject("component", "assets.components.blog").init()>
		<cfset application.pagedata = createobject("component", "assets.components.pagedata").init()>
		<cfset application.HoneyPot = createobject("component", "assets.components.HoneyPotdns").init()>

		<cfset application.nursinghome = createobject("component", "assets.components.nursing-home").init()>
		<cfset application.general = createobject("component", "assets.components.general").init()>
  		<cfset application.tracker = createobject("component", "assets.components.tracking").init()>

		<cfset application.exceptions=application.misc.getExceptions()>
		<cfset application.getDomain=application.pagedata.getWebInfo()>
		<cfset application.domain=application.getDomain.website_realname>
		<cfset application.parentdirectory=application.getDomain.website_directory>
		<cfset application.website_analytics_id=application.getDomain.website_analytics_id>
		<cfset application.client=application.getDomain.client_name>
		<cfset application.phone=application.getDomain.phone_number>
		<cfset application.officeviewonly=application.getDomain.officeviewonly>
		<cfif isdefined('application.officeviewonly') and application.officeviewonly eq 1>
			<cfquery name="getallowediplist" datasource="#application.datasource1#" >
				select acceptableIPlist_ip from acceptableIPlist where acceptableIPlist_active = 1
			</cfquery>
			<cfset acceptableiplist = valuelist(getallowediplist.acceptableIPlist_ip)>
			<cfif not listFindNoCase(acceptableiplist, cgi.REMOTE_HOST)>
				<cfinclude template="holding-page.cfm">
				<cfabort>
			</cfif>
		</cfif>

		<cfif application.getDomain.website_google_metatag NEQ "">
			<cfset application.website_google_metatag=application.getDomain.website_google_metatag>
		</cfif>
	</cffunction>

<!--- =========================================================================================================================================== --->
<!--- onSessionStart                                                                                                                              --->
<!--- =========================================================================================================================================== --->
	<cffunction name="onSessionStart" returntype="void" output="false">

		<cfif IsDefined('Session.authenticated')>
		<cfelse>
			<cfset session.authenticated = 0>
			<cfset session.username = "">
			<cfset session.password = "">
		</cfif>
		
				<cfif isDefined('live')>
			<cfset session.live = 1>
		</cfif>

		<cfset domainname = replacenocase(CGI.SERVER_NAME,'www.','')>

		<cfparam name="session.googid" default="0">
		<cfparam name="session.google" default="0">
		<cfparam name="session.sessionid" default="#CGI.SERVER_NAME#_#CFID#_#CFTOKEN#">
		<cfparam name="session.referer" default="0">
		<cfparam name="session.page" default="0">
		<cfparam name="Session.lastpage" default="0">
		<cfparam name="session.honeypotresult" default="new">
		<cfinclude template="../commonfiles/includes/tracker2.cfm">

		<cfset site = CGI.SERVER_NAME>
		<!---###################### FOR TESTING ##########################--->
		<cfif isdefined('url.manualmobile') and url.manualmobile neq ''>
			<cfset session.manualmobilecheck = 1>
		</cfif>
		<!---###################### END TESTING ##########################--->
		
		<!---Mobile check start--->
		<!---On first opening page in browser--->
		<cfif not isdefined('session.ismobile')>
			<cfset session.ismobile = application.misc.detectmobile()>
		</cfif>
		<!---If user wants to change--->
		<cfif isdefined('url.changemobile') and url.changemobile neq ''>
			<cfif url.changemobile eq 1>
				<cfset session.ismobile = 0>
				<cflocation url="index.cfm" addtoken="no">
				<!---Killed their mobile session and now they are full version--->
			<cfelseif  url.changemobile eq 0>
				<cfset session.ismobile = 1>
			</cfif>
		</cfif>
		<!---Mobile check end--->

	</cffunction>
	
<!--- =========================================================================================================================================== --->
<!--- onRequestStart                                                                                                                              --->
<!--- =========================================================================================================================================== --->
	<cffunction name="onRequestStart" output="false">
		<cfset rejectList="CHAR(4000|EXEC(|DECLARE|CREATE TABLE|UPDATE|EXECUTE|CAST(">
		<cfif listContainsNoCase(rejectList,CGI.SCRIPT_NAME,"|") OR ListContainsNoCase(rejectList,CGI.PATH_INFO,"|")>
			<cfabort>
		</cfif>
		<cfif isDefined('URL.Logout')>
			<cfscript>
				StructClear(Session);
			</cfscript>
			<cfcookie name="cfid" value="0" expires="now">
			<cfcookie name="cftoken" value="0" expires="now">
			<cfcookie name="username" value="0" expires="now">
			<cflocation url="index.cfm">
		</cfif>
		<cfset session.debugview=application.pagedata.getWebInfo().website_debug>
		<cfif isDefined("session.debugview") AND session.debugview EQ 1>
			<cfsetting showdebugoutput="yes">
		<cfelse>
			<cfsetting showdebugoutput="no">
		</cfif>

		
	</cffunction>

<!--- ========================================================================================================================================= --->
<!--- onRequest                                                                                                                                 --->
<!--- ========================================================================================================================================= --->
	<cffunction name="onRequest" output="yes" access="public">
		<cfargument name="targetPage" type="string" required="yes" default="/">
		<cfset var content="">
		<cfsavecontent variable="content">
			<cfinclude template="#arguments.targetPage#">
		</cfsavecontent>
		<cfoutput>#content#</cfoutput>
	</cffunction>

</cfcomponent>
