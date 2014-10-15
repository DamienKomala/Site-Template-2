<br />
<cfoutput>
<cfset testimonials=application.misc.getTopTestimonials()>
<cfif testimonials.recordcount GT 0>
	<div class="testimonial-container">
		<div class="title">
			<h3>Here's What Our Clients Say:</h3>
		</div>
		<div class="testimonials-carousel slide" id="testimonials-carousel">
			<div class="carousel carousel-inner">
				<cfloop query="testimonials">
					<div <cfif testimonials.currentrow eq 1>class="item active"<cfelse>class="item"</cfif>>
						<div class="testimonials">#testimonial_text#</div>
						<div class="testimonials-author">#testimonial_signature#</div>
					</div>
				</cfloop>
			</div>
		</div>
	</div>
</cfif>
</cfoutput>
