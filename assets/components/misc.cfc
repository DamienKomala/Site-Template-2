<cfcomponent>
	<cffunction name="init" access="public" output="no">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="detectmobile" output="no" access="public" returntype="string">
		<cfset var ismobile = "">
	
		<cfif reFindNoCase("(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino",CGI.HTTP_USER_AGENT) GT 0 OR reFindNoCase("1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-",Left(CGI.HTTP_USER_AGENT,4)) GT 0>
			<cfset ismobile = 1>
		<cfelse>
			<cfset ismobile = 0>
		</cfif>
		<cfreturn ismobile>
	</cffunction>

	<cffunction name="getExceptions" access="public" output="no" returntype="struct"> 
		<cfset var qryExceptions="">
		<cfquery name="qryExceptions" datasource="#application.datasource1#">
			SELECT exceptions_variablename, exceptions_content_id 
			FROM exceptions
			WHERE exceptions_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
		</cfquery>
		
		<cfloop query="qryExceptions">
			<cfset exceptions[#exceptions_variablename#] = exceptions_content_id>
		</cfloop>
		<cfreturn exceptions>
	</cffunction>

	<cffunction name="getTopTestimonials" access="public" output="no" returntype="query">
		<cfset var qryTopTestimonials="">
		<cfquery name="qryTopTestimonials" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,2,0)#">
			SELECT TOP 5 testimonial_text, testimonial_signature
			FROM testimonial 
			WHERE testimonial_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
			ORDER BY NEWID()
		</cfquery>
		<cfreturn qryTopTestimonials>
	</cffunction>
	
	<cffunction name="getDefaultNav" access="public" output="yes">
		<cfset var qryDefNav="">
		<cfquery name="qryDefNav" datasource="#application.datasource1#">
			SELECT REPLACE(content_navstring,'active','') AS navstring
			FROM content
			WHERE content_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND content_pagename='/'
		</cfquery>
		#ReplaceNoCase(qryDefNav.navstring, '{server_name}', CGI.SERVER_NAME, 'ALL')#
	</cffunction>
	
	<cffunction name="getBreadCrumbs" access="public" output="yes">
		<cfargument name="contentid" type="numeric" required="no">
		<cfargument name="blogid" type="numeric" required="no">
		<cfargument name="attorneyid" type="numeric" required="no">
		<cfset var qryBreadCrumbs="">
		<cfquery name="qryBreadCrumbs" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,1,0)#">
				<cfif isDefined("contentid")>
					EXEC usp_content_breadcrumbs @contentid=<cfqueryparam value="#contentid#" cfsqltype="cf_sql_integer">
				<cfelseif isDefined("attorneyid")>
					EXEC usp_attorney_breadcrumbs @attorneyid=<cfqueryparam value="#attorneyid#" cfsqltype="cf_sql_integer">				
				<cfelseif isDefined("blogid")>
					EXEC usp_blog_breadcrumbs @blogid=<cfqueryparam value="#blogid#" cfsqltype="cf_sql_integer">, @blogpar=#application.exceptions["blgID"]#
				</cfif>
		</cfquery>
		<cfset var bcstr='<a href="http://#CGI.SERVER_NAME#">Home</a>'>
		<cfloop query=qryBreadCrumbs>
			<cfif currentrow NEQ recordcount>
				<cfset bcstr=bcstr & ' / <a href="http://#CGI.SERVER_NAME#/#pagename#">#title#</a>'>
			<cfelse>
				<cfset bcstr=bcstr & ' / #title#'>
			</cfif>
		</cfloop>
		<cfif isDefined("category")>
			<cfquery name="qryCatName" datasource="#application.datasource1#">
				SELECT blogcategory_name AS catname
				FROM blogcategory
				WHERE blogcategory_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
					AND blogcategory_alias=<cfqueryparam value="#category#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset bcstr=ReplaceNoCase(bcstr,"/ Blog",'/ <a href="http://#CGI.SERVER_NAME#/blog/">Blog</a> / #qryCatName.catname#')>
		</cfif>
		<div class="breadcrumbs">#bcstr#</div>
	</cffunction>
	
	<cffunction name="checkBlock" access="public" returntype="boolean" output="no">
		<cfargument name="leadEmail" type="string" required="yes">
		<cfset var checkBlocks="">
		<cfset var arrIP=ListToArray(CGI.REMOTE_ADDR,".")>

		<cfquery name="checkBlocks" datasource="#application.datasource1#" cachedwithin="#createtimespan(0,0,1,0)#">
			SELECT
				(SELECT COUNT(DISTINCT blockedemail_address)
				FROM blockedemail WITH (NOLOCK)
				WHERE blockedemail_address=<cfqueryparam value="#leadEmail#" cfsqltype="cf_sql_varchar">)
				+
				(SELECT COUNT(DISTINCT blockeddomain_address)
				FROM blockeddomain WITH (NOLOCK)
				WHERE blockeddomain_address=<cfqueryparam value="#ListGetAt(leadEmail,2,"@")#" cfsqltype="cf_sql_varchar">)
				+
				(SELECT COUNT(*)
				FROM  ipBlock WITH (NOLOCK)
				WHERE <cfqueryparam value="#arrIP[1]#" cfsqltype="cf_sql_integer"> BETWEEN ipBlock1Start AND ipBlock1End
					AND <cfqueryparam value="#arrIP[2]#" cfsqltype="cf_sql_integer"> BETWEEN ipBlock2Start AND ipBLock2End
					AND <cfqueryparam value="#arrIP[3]#" cfsqltype="cf_sql_integer"> BETWEEN ipBlock3Start AND ipBlock3End
					AND <cfqueryparam value="#arrIP[4]#" cfsqltype="cf_sql_integer"> BETWEEN ipBlock4Start AND ipBlock4End)
			 AS blockcount
		</cfquery>

		<cfif checkBlocks.blockcount GT 0>
			<cfreturn "true">
		<cfelse>
			<cfreturn "false">
		</cfif>
	</cffunction>

	<cffunction name="LeadData" access="public" returntype="struct" output="no">
		<cfargument name="leadZip" type="string" required="no">

		<cfset LeadData=StructNew()>
		<cfset var qryReferalType="">
		<cfset var qryLocation="">
		<cfset var qryTo="">

		<cfquery name="qryReferalType" datasource="#application.datasource1#">
			SELECT * 
			FROM referalemailtype
			WHERE referalemailtype_websiteid = <cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
			AND referalemailtype_text=<cfqueryparam value="Thank You" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfset LeadData.ReferalType=qryReferalType>
		
		<cfif isDefined("leadZip") AND leadZip NEQ "">
			<cfquery name="qryLocation" datasource="#application.datasource1#">
				SELECT city, county, stateabb
				FROM referencelocationnew
				WHERE zipcode=<cfqueryparam value="#leadZip#" cfsqltype="cf_sql_varchar">
			</cfquery>
			<cfset LeadData.Location=qryLocation>
		</cfif>
	
		<cfquery name="qryTo" datasource="#application.datasource1#">
			SELECT users_lname,  users_fname, users_email
			FROM users
			WHERE users_websiteid=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND users_active=<cfqueryparam value="1" cfsqltype="cf_sql_integer">
			UNION ALL
			SELECT nr.notify_rotation_lname AS lname, nr.notify_rotation_fname AS fname, nr.notify_rotation_email AS email
			FROM notify_rotation nr
			WHERE nr.notify_rotation_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer">
				AND nr.notify_rotation_order=(SELECT rotation_counter_count 
												FROM rotation_counter 
												WHERE rotation_counter_website_id=<cfqueryparam value="#application.domainid#" cfsqltype="cf_sql_integer"> 
													AND rotation_counter_use=<cfqueryparam value="leads" cfsqltype="cf_sql_varchar">)
		</cfquery>
		<cfset LeadData.LeadTo=qryTo>
		<cfreturn LeadData>		
	</cffunction>
	
	<cffunction name="makeProper" output="yes" returntype="string">
		<cfargument name="improper_string" type="string" required="yes">
		<cfset var string_out="">
		<cfloop index="x" from="1" to="#listlen(improper_string," ")#">
			<cfif string_out NEQ "">
				<cfset string_out=string_out & " ">
			</cfif>
			<cfset string_out=string_out & UCASE(LEFT(ListGetAt(improper_string,x," "),1))>
			<cfif LEN(ListGetAt(improper_string,x," ")) GT 1>
				<cfset string_out=string_out & LCASE(RIGHT(ListGetAt(improper_string,x," "),LEN(ListGetAt(improper_string,x," "))-1))>
			</cfif>
		</cfloop>
		<cfreturn string_out>
	</cffunction>
	
	<cffunction name="getfullstatename" access="public" returntype="string" output="no">
		<cfargument name="passedstateabbr" type="string" required="yes">
		<cfset var qryState = "">
		<cfset var returnstatename = "">
		<cfquery name="qryState" datasource="#application.datasource1#" maxrows="1">
			SELECT state_information_name
			FROM state_information
			where state_information_abbr = <cfqueryparam value="#trim(arguments.passedstateabbr)#" cfsqltype="cf_sql_varchar">
		</cfquery>
		<cfset returnstatename = qryState.state_information_name>
		<cfreturn returnstatename>
	</cffunction>

	<cffunction name="ratingsystem" access="public" returntype="string" output="no">
		<cfargument name="starnumber" required="yes" type="string">
		<cfset var starrating = "">
		<cfset var thisrating = "">
		<cfset var thisratingalt = "">
		<cfset thisrating = "star" & arguments.starnumber>
		<cfset thisratingalt = "Rating:" & arguments.starnumber>
		<cfoutput>
			<cfsavecontent variable="starrating">
				<cfif starnumber eq "Too New to Rate" or starnumber eq "Too New to Rate">
					Too New to Rate
				<cfelse>
					<div class=#thisrating# title=#thisratingalt#></div>
				</cfif>
			</cfsavecontent>
		</cfoutput>
		<cfreturn starrating>
	</cffunction>

	
</cfcomponent>