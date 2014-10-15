<cfquery name="maxRotation" datasource="#application.datasource1#">
	SELECT MAX(notify_rotation_order) AS maxRO
	FROM notify_rotation
	WHERE notify_rotation_website_id=<cfqueryparam value="88" cfsqltype="cf_sql_integer">
</cfquery>

<cfquery name="updRotation" datasource="#application.datasource1#">
	UPDATE rotation_counter
	SET rotation_counter_count=
		CASE rotation_counter_count
			WHEN <cfqueryparam value="#maxRotation.maxRO#" cfsqltype="cf_sql_integer"> THEN <cfqueryparam value="1" cfsqltype="cf_sql_integer">
			ELSE rotation_counter_count+<cfqueryparam value="1" cfsqltype="cf_sql_integer">
			END
	WHERE rotation_counter_website_id=<cfqueryparam value="88" cfsqltype="cf_sql_integer">
		AND rotation_counter_use=<cfqueryparam value="leads" cfsqltype="cf_sql_varchar">
</cfquery>
