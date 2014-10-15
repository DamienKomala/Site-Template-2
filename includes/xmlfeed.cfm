<cfoutput>
	<cfset theurl = "http://www.prweb.com/rss2g/535259.xml">
	<cfset myreadDoc=XMLParse(theurl)>
    <cfset regex1 = '<(.*?)</ttl>'><!---header--->
    <cfset regex2 = "</channel>(.*?)</rss>"> <!---footer--->
	<cfset cleanedbody1 = reReplace(trim(myreadDoc), regex1,'<xlfeed>')><!---clean unsubscribe header--->
	<cfset cleanedbody2 = reReplace(trim(cleanedbody1), regex2,'</xlfeed>')><!---clean unsubscribe footer--->
	<!---make a list to loop over--->
	<cfset feedloopinglist = rereplace(cleanedbody2,'</item><item>','</item>|<item>')>
	<cfset num_articles = "100">
    <cfset nodata=0>
    <cfset regex_item = '<item>(.*?)</item>' />
	<cfset regex_content = '<title>(.*?)</title>.*?<link>(.*?)</link>.*?<pubDate>(.*?)</pubDate>' />
	<ul>
		<!---xml feed--->
		<cfloop list="#feedloopinglist#" delimiters="|" index="i">
			<cfset items_array = rematchnocase(regex_item, i) />
			<cfset content_array = arraynew(2) />
			<cfset max_articles = arraylen(items_array) />
			
			<cfloop index="i" from="1" to="#val(max_articles)#" step="1">
				<cfset position_array = refindnocase(regex_content, items_array[i], "1", "true") />
				<cfif isstruct(position_array) and isdefined("position_array.pos") and position_array.pos[1] neq "0">
					<cfset content_array[i][1] = Mid(items_array[i], position_array.pos[2], position_array.len[2]) />
					<cfset content_array[i][2] = Mid(items_array[i], position_array.pos[3], position_array.len[3]) />
					<cfset content_array[i][3] = Mid(items_array[i], position_array.pos[4], position_array.len[4]) />
				</cfif>
				<cfparam name="content_array[i][1]" default="">
				<cfparam name="content_array[i][2]" default="">
				<li><h4><a href="#content_array[i][2]#" target="_blank">#Replace(replace(content_array[i][1],"’","'","all"),"â€™","'","ALL")#</a></h4>#DATEFORMAT(content_array[i][3],"long")#</li>
			</cfloop>
		</cfloop>
	</ul>
</cfoutput>