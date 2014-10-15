<cfsilent>
	<cfset blocker = application.misc.checkBlock(leadEmail="#leademail#")>
	<cfif blocker EQ "true" OR (isDefined("session.mailsent") AND session.mailsent EQ 1) OR (isDefined("form.leadZip") AND form.leadZip EQ '123456') OR (LEN(form.leadPhone) LT 7) OR (FindNoCase("http", form.leadContent)) OR (form.leadFirstName EQ form.leadLastName)>
		<cflocation url="thank-you.html" addtoken="no">
	</cfif>
	<cfset mystr=session.referer>
	<cfset leadcat=0>
	<cfif RIGHT(CGI.PATH_INFO,9) EQ "_ppc.html" OR FindNoCase("mm_campaign",session.google) OR FindNoCase("utm_",session.google)>
		<cfset Leadcat=4>
	</cfif>
	<cfif leadcat EQ 0>
		<cfset organiclist="www.google.com,www.bing.com,www.yahoo.com,www.altavista.com">
		<cfloop index="x" list="#organicList#">
			<cfif LEFT(mystr,LEN(x)+7) EQ "http://#x#">
				<cfset Leadcat=3>
			</cfif>
		</cfloop>
		<cfif leadcat EQ 0>
			<cfset referredlist="www.superlawyers.com,www.avvo.com">
			<cfloop index="x" list="#referredlist#">
				<cfif LEFT(mystr,LEN(x)+7) EQ "http://#x#">
					<cfset Leadcat=2>
				</cfif>
			</cfloop>
		</cfif>
		<cfif leadcat EQ 0>
			<cfset Leadcat=1>
		</cfif>
	</cfif>
	
	<cfset testList="pnash@pmpmg.com|darahood@pmpmg.com|test@pmpmg.com">
	<cfquery name="insLeads" datasource="#application.datasource1#">
		INSERT INTO leads (leads_firstname, leads_lastname, leads_zip, leads_email, leads_phone, leads_content, leads_entereddate, leads_referpage, leads_clientid, leads_site, leads_siteid, leads_status, leads_tracking, leads_googleid, leads_google, leads_ip, leads_lastmodified, leads_browser, leads_ppc, leads_category)
		VALUES (
		<cfqueryparam value="#leadFirstName#" cfsqltype="cf_sql_varchar">,
		<cfqueryparam value="#leadLastName#" cfsqltype="cf_sql_varchar">,
		<cfif isDefined("leadZip") AND leadZip NEQ "">
		<cfqueryparam value="#leadZip#" cfsqltype="cf_sql_varchar">,
		<cfelse>
		<cfqueryparam value="" cfsqltype="cf_sql_varchar">,
		</cfif>
		<cfqueryparam value="#leadEmail#" cfsqltype="cf_sql_varchar">,
		<cfqueryparam value="#leadPhone#" cfsqltype="cf_sql_varchar">,
		<cfqueryparam value="#leadContent#" cfsqltype="cf_sql_longvarchar">,
		getdate(),
		<cfqueryparam value="#session.referer#" cfsqltype="cf_sql_longvarchar">,
		<cfqueryparam value="11" cfsqltype="cf_sql_integer">,
		<cfqueryparam value="#CGI.SERVER_NAME#" cfsqltype="cf_sql_varchar">,
		<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">,
		(SELECT casestatus_id FROM casestatus WHERE casestatus_text=<cfqueryparam value="Unsorted" cfsqltype="cf_sql_varchar">),
		<cfif isDefined("cookie.leadtracking")>
		<cfqueryparam value="#cookie.leadtracking#" cfsqltype="cf_sql_longvarchar">,
		<cfelse>
		<cfqueryparam value="#session.page#" cfsqltype="cf_sql_longvarchar">,
		</cfif>
		<cfqueryparam value="#session.googid#" cfsqltype="cf_sql_varchar">,
		<cfqueryparam value="#session.google#" cfsqltype="cf_sql_longvarchar">,
		<cfqueryparam value="#CGI.REMOTE_ADDR#" cfsqltype="cf_sql_varchar">,
		getdate(),
		<cfqueryparam value="#CGI.HTTP_USER_AGENT#" cfsqltype="cf_sql_varchar">,
		<cfif RIGHT(CGI.PATH_INFO,9) EQ "_ppc.html" OR RIGHT(CGI.PATH_INFO,8) EQ "_ppc.cfm">
		<cfqueryparam value="1" cfsqltype="cf_sql_integer">,
		<cfelse>
		<cfqueryparam value="0" cfsqltype="cf_sql_integer">,
		</cfif>
		<cfqueryparam value="#leadcat#" cfsqltype="cf_sql_integer">)
	</cfquery>
	<cfset tmp=application.tracker.updPage(convert="1")>
	<cfset sitestats=application.tracker.siteStats()>
	<cfquery name="insertcontact" datasource="#application.datasource1#">
		INSERT INTO pmpcontact(pmpcontactfirstname,pmpcontactlastname,pmpcontactemail,pmpcontactphone,pmpcontactcomments,pmpcontactzipcode,pmpcontactwebsite)
		VALUES(
			<cfqueryparam value="#leadFirstName#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#leadLastName#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#leadEmail#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#REReplace(leadPhone, '[^0-9]', '', 'ALL')#" cfsqltype="cf_sql_varchar">,
			<cfqueryparam value="#leadContent#" cfsqltype="cf_sql_varchar">,
			<cfif isDefined("leadZip") AND leadZip NEQ "">
				<cfqueryparam value="#leadZip#" cfsqltype="cf_sql_varchar">,
			<cfelse>
				<cfqueryparam value="" cfsqltype="cf_sql_varchar">,
			</cfif>
			<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">)
	</cfquery>

	<cfset LeadData=application.misc.LeadData()>
	
	<cfset UsersTo="">
	<cfloop index="x" list="#ValueList(LeadData.LeadTo.users_email)#">
		<cfif NOT Find('pmpmg.com',x)>
			<cfset UsersTo=listAppend(UsersTo,x,", ")>
		</cfif>
	</cfloop>
	<cfset body=ReplaceNoCase(LeadData.ReferalType.referalemailtype_body_html,"{firstname}",leadFirstName, "ALL")>
	<cfset body=REPLACE(body,"{lastname}",leadLastName)>
	<cfset body=REPLACE(body,"{email}",leadEmail)>
	<cfset body=REPLACE(body,"{phone}",leadPhone)>
	<cfif LeadData.Location.recordcount GT 0>
		<cfif LeadData.Location.stateabb EQ "LA">
			<cfset body=Replace(body,"{zip}", leadZip & " - #LeadData.Location.city#, #LeadData.Location.stateAbb# (#LeadData.Location.county# parish)")>
		<cfelse>
			<cfset body=Replace(body,"{zip}", leadZip & " - #LeadData.Location.city#, #LeadData.Location.stateAbb# (#LeadData.Location.county# county)")>
		</cfif>
	</cfif>
	<cfset body=REPLACE(body,"{details}",leadContent)>
	<cfset lphone=ReReplaceNoCase(leadPhone,"[^0-9]","","ALL")>
</cfsilent>
<cfif NOT ListContains(testList,leadEmail,"|")>
	<cfloop query="LeadData.LeadTo">
	<cfmail
	to = "#users_email#"
	replyto = "#LeadData.ReferalType.referalemailtype_primary_to_email#"
	failto = "failto@attorneycontrolcenter.com"
	from = "#LeadData.ReferalType.referalemailtype_primary_from_email#"
	subject = "#LCASE(CGI.SERVER_NAME)#: Case Evaluation Notification"
	cc = ""
	type="html"
	server = "mail.attorneycontrolcenter.com" port="587"
	username = "leads"
	password = "coke18!!">
	
	<i>This is an automated real time notification.</i><br />
<div align="left"><img src="http://www.mikelewisattorneys.com/images/logo.png" /></div>
<br />
You have received a new case inquiry on #LCASE(CGI.SERVER_NAME)#.  <br />
<br />
The information that he or she provided is below: <br /><br />
	<strong>First Name: </strong>#application.misc.MakeProper(leadFirstName)#<br />
	<strong>Last Name: </strong>#application.misc.MakeProper(leadLastName)#<br />
	<strong>Email: </strong>#leadEmail#<br />
	<strong>Phone: </strong>(#LEFT(lPhone,3)#) #MID(lPhone,4,3)#-#RIGHT(lPhone,4)#<br />
	<cfif LeadData.Location.recordcount GT 0>
	<strong>Location: </strong>#leadData.Location.city#, #LeadData.Location.stateabb#&nbsp;&nbsp;#leadZip# (#LeadData.Location.county#<cfif LeadData.Location.stateabb EQ "LA"> Parish<cfelse> County</cfif>)<br />
	</cfif>
	<strong>Details: </strong><br />
#leadContent#<br /><br />
	<strong>Please do not reply to this email.</strong> It is an automated notification email.<br />
	<br /><br />
	<strong>Tracking Information:</strong><br />
	The source of this lead was: #session.google#<br />
	The user was using the following browser: #CGI.HTTP_USER_AGENT#<br /><br />

	Below are the time-stamped pages the user visited on your website:<br />
	#session.page#<br /><br />
	
<hr />
	<cfif isDefined("UsersTo")>
		<strong>This Notification was sent to:</strong><br />#Replace(UsersTo,",","<br />","ALL")#<br /><br />
	</cfif>
	</cfmail>
	</cfloop>
<cfelse>
	<cfmail
		to = "#Replace(testList,"|",";","ALL")#"
		replyto = "#LeadData.ReferalType.referalemailtype_primary_to_email#"
		failto = "failto@attorneycontrolcenter.com"
		from = "#LeadData.ReferalType.referalemailtype_primary_from_email#"
		subject = "#LCASE(CGI.SERVER_NAME)#: Case Evaluation Notification"
		cc = ""
		type="html"
		server = "mail.attorneycontrolcenter.com" port="587"
		username = "leads"
		password = "coke18!!">
	
	<i>This is an automated real time notification.</i><br />
<div align="left"><img src="http://www.mikelewisattorneys.com/images/logo.png" /></div>
<br />
You have received a new case inquiry from #LCASE(CGI.SERVER_NAME)#.  <br />
<br />
The information that he or she provided is below: <br /><br />
	<strong>First Name: </strong>#application.misc.MakeProper(leadFirstName)#<br />
	<strong>Last Name: </strong>#application.misc.MakeProper(leadLastName)#<br />
	<strong>Email: </strong>#leadEmail#<br />
	<strong>Phone: </strong>(#LEFT(lPhone,3)#) #MID(lPhone,4,3)#-#RIGHT(lPhone,4)#<br />
	<cfif LeadData.Location.recordcount GT 0>
	<strong>Location: </strong>#leadData.Location.city#, #LeadData.Location.stateabb#&nbsp;&nbsp;#leadZip# (#LeadData.Location.county#<cfif LeadData.Location.stateabb EQ "LA"> Parish<cfelse> County</cfif>)<br />
	</cfif>
	<strong>Details: </strong><br />
#leadContent#<br /><br />
	<strong>Please do not reply to this email.</strong> It is an automated notification email.<br />
	<br /><br />
	<strong>Tracking Information:</strong><br />
	The source of this lead was: #session.google#<br />
	The user was using the following browser: #CGI.HTTP_USER_AGENT#<br /><br />

	Below are the time-stamped pages the user visited on your website:<br />
	#session.page#<br /><br />
	
<hr />
	<cfif isDefined("UsersTo")>
		<strong>This Notification was sent to:</strong><br />#Replace(UsersTo,",","<br />","ALL")#<br /><br />
	</cfif>
	</cfmail>
</cfif>
<cfmail
to="#leadEmail#"
replyto="#LeadData.ReferalType.referalemailtype_primary_to_email#"
failto = "failto@attorneycontrolcenter.com"
from = "#LeadData.ReferalType.referalemailtype_primary_from_email#"
subject = "#LeadData.ReferalType.referalemailtype_subject#"
cc=""
bcc="darahood@pmpmg.com"
type="html"
server = "mail.attorneycontrolcenter.com" port="587"
username = "leads"
password = "coke18!!">
#body#
</cfmail>
<cflocation url="#LeadData.ReferalType.referalemailtype_redirectpage#" addtoken="no">