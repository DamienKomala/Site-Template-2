<cfoutput query="settlements">
	<cfif currentrow EQ 1>
		<div class="row-fluid">
	</cfif>
			<div class="span4">
				<a name="result#settlement_id#"></a>
				<ul class="results-table blue">
					<li class="title">#settlement_header#</li>
					<li class="price">#Replace(dollarformat(settlement_amt),".00","")#</li>
					<li class="description">#settlement_text#</li>
				</ul>
			</div>
	<cfif currentrow EQ recordcount>
		</div>
	<cfelseif currentrow MOD 3 EQ 0>
		</div>
		<div class="row-fluid">
	</cfif>
</cfoutput>