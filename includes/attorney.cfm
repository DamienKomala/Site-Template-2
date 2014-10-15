<cfoutput>
	<cfif pageinfo.photo NEQ "">
		<img src="#ListGetAt(pageinfo.photo,1,"|")#" alt="#pageinfo.photo_text#" class="left">
	</cfif>
	<cfif pageinfo.phone NEQ "">
		<p><strong>Phone:</strong> #LEFT(pageinfo.phone,3)#-#MID(pageinfo.phone,4,3)#-#RIGHT(pageinfo.phone,4)#</p>
	</cfif>
	#REPLACE(pageinfo.body1, "{server_name}", CGI.SERVER_NAME, "ALL")#
	#Replace(Replace(pageinfo.body2, "{avvo_badge}",'<script type="text/javascript" src="http://www.avvo.com/assets/badges-v2.js"></script><div class="avvo_badge" data-type="rating" data-specialty="104" data-target="http://www.avvo.com/professional_badges/1727227"><div class="avvo_content"><a href="http://www.avvo.com/attorneys/27103-nc-douglas-punger-1727227.html?utm_campaign=avvo_rating&utm_content=1727227&utm_medium=avvo_badge&utm_source=avvo" rel="me" target="_blank">Lawyer Douglas Punger</a> | <a href="http://www.avvo.com/personal-injury-lawyer/nc/winston-salem.html?utm_campaign=avvo_rating&utm_content=1727227&utm_medium=avvo_badge&utm_source=avvo" target="_blank">Featured Attorney Personal Injury</a></div></div>'), "{server_name}", CGI.SERVER_NAME, "ALL")#
</cfoutput> 