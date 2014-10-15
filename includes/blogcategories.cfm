<div class="box">
	<h3><span>Blog Categories</span></h3>
	<ul>
		<cfset blogtypes=application.pageData.getBlogTypes()>
		<cfoutput query="blogtypes">
			<li><a href="http://#CGI.SERVER_NAME#/blog/category/#blogcategory_alias#.html">#blogcategory_name#</a></li>
		</cfoutput>
	</ul>
</div>
