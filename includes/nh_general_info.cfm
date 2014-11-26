<cfsilent>
<cfset RowVals="Certified Number of Beds:|Total Number of Resident:|Provider Type:|Ownership Type:|Located Within a Hospital?|Date First Approved to Provide Medicare/Medicaid Services:">
<cfset FieldNames="bedcert|restot|provider_type|ownership_type|in_a_hospital|dt_first_approved">
</cfsilent>
<cfset initclr="##F4F4F4">
<cfset secclr="##EFEFEF">
<cfset clr=initclr>

<div class="span12">
<div class="span8" style="margin-top:4px;">
  <table class="table table-bordered table-striped minnhinfohght" cellspacing="0" cellpadding="5">
    <tbody>
      <cfoutput>
      <cfloop index="x" from="1" to="#ListLen(RowVals,"|")#">
      <tr style="background-color:#clr#;">
        <td>#ListGetAt(RowVals,x,"|")# </td>
        <td><cfset col=ListGetAt(FieldNames,x,"|")>
          <cfif StructKeyExists(nhData.data,ListGetAt(FieldNames,x,"|"))>
            <cfif isDate(nhData.data[col][nhData.data.CurrentRow])>
              #DateFormat(nhData.data[col][nhData.data.CurrentRow],"LONG")#
              <cfelse>
              #nhData.data[col][nhData.data.CurrentRow]#
            </cfif>
          </cfif>
        </td>
        <cfif clr EQ initclr>
          <cfset clr=secclr>
          <cfelse>
          <cfset clr=initclr>
        </cfif>
      </tr>
      </cfloop>
      <tr style="background-color:#clr#;">
        <td>Rating Survey Dates: </td>
        <td nowrap>#dateformat(nhData.data.date3, 'mm/dd/yy')# - #dateformat(nhData.data.lastupdate, 'mm/dd/yy')#</td>
      </tr>
      </cfoutput>
    </tbody>
  </table>
</div>
<cfoutput>
<div class="span4 boxnh boxnh1 minnhinfohght" > <br />
  <p><strong>#nhData.data.facName#</strong><br>
    #nhData.data.address#<br>
    #nhData.data.city#, #nhData.data.state_information_name# #nhData.data.zip#</p>


  <p>If you have a loved one at #nhData.data.facName# that might be a target of nursing home abuse such as bed sores or worse, <strong>Click on the Report Abuse Button Below</strong>. </p>
  <p><a data-toggle="modal" href="##fileClaim" class="btn btn-primary btn-danger btn-large span12">Report Abuse</a></p><br /><br /><br />
  <p><em>#nhData.data.facName# Employees, Please Report Violations <a data-toggle="modal" href="##fileClaim">Here</a></em></p>
</div>
</div>
</cfoutput>
