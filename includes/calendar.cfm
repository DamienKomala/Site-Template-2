<cfsilent>
<cfset qryMinCal=application.blogData.getMinDate()>

<cfparam name="calMonth" default="#MONTH(now())#">
<cfparam name="calYear" default="#YEAR(now())#">
<cfparam name="calDay" default="1">

<cfif isDefined("caldt") AND caldt NEQ "">
	<cfset calMonth=ListGetAt(caldt,1,"-")>
	<cfset calYear=ListGetAt(Replace(caldt,".html",""),2,"-")>
<cfelseif isDefined("date") AND date NEQ "">
	<cfset calMonth=ListGetAt(date,1,"-")>
	<cfset calDay=ListGetAt(date,2,"-")>
	<cfset calYear=ListGetAt(Replace(date,".html",""),3,"-")>
</cfif>

<cfif isDefined("calyear") AND isDefined("calmonth")>
	<cfset now=CREATEDATE(calyear,calmonth,1)>
<cfelse>
	<cfset now=now()>
</cfif>

<cfset firstOfTheMonth = createDate(year(now), month(now), 1)>
<cfset dow = dayofWeek(firstOfTheMonth)>
<cfset days = daysInMonth(now)>
<cfif calDay GT days>
	<cflocation url="http://#CGI.SERVER_NAME#/blog/" addtoken="no">
</cfif>
<cfset pad = dow - 1>
<cfset counter = pad + 1>
<cfset weekCount = 5>

<cfif days EQ 28 AND dow EQ 1>
	<cfset weekCount = 4>
<cfelseif (days EQ 30 AND dow EQ 7) OR (days EQ 31 AND dow GT 5)>
	<cfset weekCount = 6>
</cfif>
<cfset wkctr=1>

<cfquery name="getDays" dbtype="query" cachedwithin="#createtimespan(0,0,1,0)#">
	SELECT monthdays
	FROM siteBlogs
	WHERE dateposted BETWEEN '#calmonth#/1/#calYear#' AND '#calmonth#/#days#/#calyear#'
</cfquery>
<cfset dt=QuotedValueList(getDays.monthdays)>
</cfsilent>
<cfoutput>
<div class="box">
<h3>Blog Calendar</h3>
	<div class="wrapleft">
		<div class="wrapright">
			<div class="tr">
				<div class="bl">
					<div class="tl">
						<div class="br the-content">
							<table border="0" id="calendar" width="100%" style="border:thin ##999 solid;">
								<thead>
									<tr>
										<th>
											<cfif datepart("yyyy",now) EQ qryMinCal.firstyear AND datepart("m",now) LE qryMinCal.firstmonth>
											<cfelse>
												<cfif now LT DATEADD("m",1,now())>
													<cfif month(now) EQ 1>
														<a class="calDayLink" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-12-#year(now)-1#.html" rel="nofollow">&lt;&lt;</a>
													<cfelse>
														<a class="calDayLink" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-#month(now)-1#-#year(now)#.html" rel="nofollow">&lt;&lt;</a>
													</cfif>
												<cfelse>
													<a class="calDayLink" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-#month(now)-1#-#year(now)#.html" rel="nofollow">&lt;&lt;</a>
												</cfif>
											</cfif>
										</th>
										<th colspan="5" align="center">
											<a class="calDayLink" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-#month(now)#-#year(now)#.html" rel="nofollow">#MonthAsString(Month(now))# #Year(now)#</a>
										</th>
										<th>
											<cfif Month(now) EQ 12>
												<cfif now LT  DATEADD("m",-1,now())>
												<a class="calDayLink" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-1-#year(now)+1#.html" rel="nofollow">&gt;&gt;</a>
												</cfif>
											<cfelse>
												<cfif now LT DATEADD("m",-1,now())>
												<a class="calDayLink" style="" href="http://#CGI.SERVER_NAME#/blog/attorney-blog-calendar-#month(now)+1#-#year(now)#.html" rel="nofollow">&gt;&gt;</a>
												</cfif>
											</cfif>
										</th>
									</tr>
									<tr>
										<cfloop index="x" from="1" to="7">
										<th>#Left(DayofWeekAsString(x),3)#</th>
										</cfloop>
									</tr>
								</thead>
								<tbody>
									<tr>
										<cfif pad gt 0>
										<td colspan="#pad#" class="calDayBtm calDaySide">&nbsp;</td>
										</cfif>
										<cfloop index="x" from="1" to="#days#">
											<cfif x IS day(now()) AND month(now) EQ month(now()) AND year(now) EQ year(now())>
												<td class="calendarToday<cfif counter NEQ 7> calDaySide</cfif> calDayBtm">
													<cfif isDefined("dt") AND FIND(''''& x & '''', dt)>
														<a href="http://#CGI.SERVER_NAME#/lawyer-blog-#month(now)#-#x#-#year(now)#.html"></a>
													</cfif>
													<strong>#x#</strong><cfif isDefined("dt") AND FIND(''''& x & '''', dt)></a></cfif>
												</td>
											<cfelseif isDefined("dt") AND FIND(''''& x & '''', dt)>
<!--- This is date that has an entry --->
											<td  class="calendarDy calDayBtm calDaySide"><a style="color:##000000;" href="http://#CGI.SERVER_NAME#/blog/lawyer-blog-#month(now)#-#x#-#year(now)#.html">#x#</a></td>
											<cfelse>
											<td  class="<cfif wkctr NEQ weekcount>calDayBtm</cfif><cfif counter NEQ 7> calDaySide</cfif>">#x#</td>
											</cfif>   
											<cfset counter = counter + 1>
											<cfif counter is 8>
									</tr>
												<cfif x lt days>
													<cfset counter = 1>
							         <tr>
													<cfset wkctr=wkctr+1>
												</cfif>
											</cfif>
										</cfloop>
										<cfif counter is not 8>
											<cfset endPad = 8 - counter>
										<td colspan="#endPad#">&nbsp;</td>
										</cfif>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</cfoutput>