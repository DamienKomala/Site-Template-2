<cfinclude template="includes/head.cfm">
<body class="interior">
<cfinclude template="includes/header.cfm">
<div id="wrapper">
	<div class="container content">
		<div class="row-fluid">
			<section class="span8">
				<div class="center-content">
					<link href="/css/prettify.css" rel="stylesheet">
					<script src="/js/prettify.js"></script>
					<h1>HTML Styleguide</h1>
					<section id="typography">
						<div class="page-header">
							<h1>Typography</h1>
						</div>
						<h2 id="headings">Headings</h2>
						<p>All HTML headings, <code>&lt;h1&gt;</code> through <code>&lt;h6&gt;</code> are available.</p>
						<div class="bs-docs-example">
							<h1>h1. Heading 1</h1>
							<h2>h2. Heading 2</h2>
							<h3>h3. Heading 3</h3>
							<h4>h4. Heading 4</h4>
							<h5>h5. Heading 5</h5>
							<h6>h6. Heading 6</h6>
						</div>
						<h2 id="body-copy">Body copy</h2>
						<pre class="prettyprint">&lt;p&gt;...&lt;/p&gt;</pre>
						<hr class="bs-docs-separator">
						<h2 id="emphasis">Emphasis</h2>
						<p>Make use of HTML's default emphasis tags with lightweight styles.</p>
						<h3><code>&lt;small&gt;</code></h3>
						<p>For de-emphasizing inline or blocks of text, <small>use the small tag.</small></p>
						<div class="bs-docs-example">
							<p><small>This line of text is meant to be treated as fine print.</small></p>
						</div>
						<pre class="prettyprint">
&lt;p&gt;
  &lt;small&gt;This line of text is meant to be treated as fine print.&lt;/small&gt;
&lt;/p&gt;
</pre>
						<h3>Bold</h3>
						<p>For emphasizing a snippet of text with a heavier font-weight.</p>
						<div class="bs-docs-example">
							<p>The following snippet of text is <strong>rendered as bold text</strong>.</p>
						</div>
						<pre class="prettyprint">&lt;strong&gt;rendered as bold text&lt;/strong&gt;</pre>
						<h3>Italics</h3>
						<p>For emphasizing a snippet of text with italics.</p>
						<div class="bs-docs-example">
							<p>The following snippet of text is <em>rendered as italicized text</em>.</p>
						</div>
						<pre class="prettyprint">&lt;em&gt;rendered as italicized text&lt;/em&gt;</pre>
						<p><span class="label label-info">Heads up!</span> Feel free to use <code>&lt;b&gt;</code> and <code>&lt;i&gt;</code> in HTML5. <code>&lt;b&gt;</code> is meant to highlight words or phrases without conveying additional importance while <code>&lt;i&gt;</code> is mostly for voice, technical terms, etc.</p>
						<h3>Alignment classes</h3>
						<p>Easily realign text to components with text alignment classes.</p>
						<div class="bs-docs-example">
							<p class="text-left">Left aligned text.</p>
							<p class="text-center">Center aligned text.</p>
							<p class="text-right">Right aligned text.</p>
						</div>
						<pre class="prettyprint linenums">
&lt;p class="text-left"&gt;Left aligned text.&lt;/p&gt;
&lt;p class="text-center"&gt;Center aligned text.&lt;/p&gt;
&lt;p class="text-right"&gt;Right aligned text.&lt;/p&gt;
</pre>
						<h3>Horizontal Rules (line breaks)</h3>
						<p>Markukp adding a horizontal line to divide content.</p>
						<div class="bs-docs-example">
							<hr/ >
						</div>
						<pre class="prettyprint linenums">
&lt;hr /&gt;</pre>
						<h2 id="abbreviations">Abbreviations</h2>
						<p>Stylized implementation of HTML's <code>&lt;abbr&gt;</code> element for abbreviations and acronyms to show the expanded version on hover. Abbreviations with a <code>title</code> attribute have a light dotted bottom border and a help cursor on hover, providing additional context on hover.</p>
						<h3><code>&lt;abbr&gt;</code></h3>
						<p>For expanded text on long hover of an abbreviation, include the <code>title</code> attribute.</p>
						<div class="bs-docs-example">
							<p>An abbreviation of the word attribute is <abbr title="attribute">attr</abbr>.</p>
						</div>
						<pre class="prettyprint">&lt;abbr title="attribute"&gt;attr&lt;/abbr&gt;</pre>
						<h3><code>&lt;abbr class="initialism"&gt;</code></h3>
						<p>Add <code>.initialism</code> to an abbreviation for a slightly smaller font-size.</p>
						<div class="bs-docs-example">
							<p><abbr title="HyperText Markup Language" class="initialism">HTML</abbr> is the best thing since sliced bread.</p>
						</div>
						<pre class="prettyprint">&lt;abbr title="HyperText Markup Language" class="initialism"&gt;HTML&lt;/abbr&gt;</pre>
						<hr class="bs-docs-separator">
						<h2 id="addresses">Addresses</h2>
						<p>Present contact information for the nearest ancestor or the entire body of work.</p>
						<h3><code>&lt;address&gt;</code></h3>
						<p>Preserve formatting by ending all lines with <code>&lt;br&gt;</code>.</p>
						<div class="bs-docs-example">
							<address>
							<strong>Twitter, Inc.</strong><br>
							795 Folsom Ave, Suite 600<br>
							San Francisco, CA 94107<br>
							<abbr title="Phone">P:</abbr> (123) 456-7890
							</address>
							<address>
							<strong>Full Name</strong><br>
							<a href="mailto:#">first.last@example.com</a>
							</address>
						</div>
						<pre class="prettyprint linenums">
&lt;address&gt;
  &lt;strong&gt;Twitter, Inc.&lt;/strong&gt;&lt;br&gt;
  795 Folsom Ave, Suite 600&lt;br&gt;
  San Francisco, CA 94107&lt;br&gt;
  &lt;abbr title="Phone"&gt;P:&lt;/abbr&gt; (123) 456-7890
&lt;/address&gt;

&lt;address&gt;
  &lt;strong&gt;Full Name&lt;/strong&gt;&lt;br&gt;
  &lt;a href="mailto:#"&gt;first.last@example.com&lt;/a&gt;
&lt;/address&gt;
</pre>
						<hr class="bs-docs-separator">
						<h2 id="blockquotes">Blockquotes</h2>
						<p>For quoting blocks of content from another source within your document.</p>
						<h3>Default blockquote</h3>
						<p>Wrap <code>&lt;blockquote&gt;</code> around any <abbr title="HyperText Markup Language">HTML</abbr> as the quote. For straight quotes we recommend a <code>&lt;p&gt;</code>.</p>
						<div class="bs-docs-example">
							<blockquote>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
							</blockquote>
						</div>
						<pre class="prettyprint linenums">
&lt;blockquote&gt;
  &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;
&lt;/blockquote&gt;
</pre>
						<h3>Blockquote options</h3>
						<p>Style and content changes for simple variations on a standard blockquote.</p>
						<h4>Naming a source</h4>
						<p>Add <code>&lt;small&gt;</code> tag for identifying the source. Wrap the name of the source work in <code>&lt;cite&gt;</code>.</p>
						<div class="bs-docs-example">
							<blockquote>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
								<small>Someone famous in <cite title="Source Title">Source Title</cite></small> </blockquote>
						</div>
						<pre class="prettyprint linenums">
&lt;blockquote&gt;
  &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&lt;/p&gt;
  &lt;small&gt;Someone famous &lt;cite title="Source Title"&gt;Source Title&lt;/cite&gt;&lt;/small&gt;
&lt;/blockquote&gt;
</pre>
						<h4>Alternate displays</h4>
						<p>Use <code>.right</code> for a right floating blockquote.</p>
						<div class="bs-docs-example" style="overflow: hidden;">
							<blockquote class="right">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
								<small>Someone famous in <cite title="Source Title">Source Title</cite></small> </blockquote>
						</div>
						<pre class="prettyprint linenums">&lt;blockquote class="right"&gt;
	...
&lt;/blockquote&gt;</pre>
						<p>Use <code>.left</code> for a left floating blockquote.</p>
						<div class="bs-docs-example" style="overflow: hidden;">
							<blockquote class="left">
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.</p>
								<small>Someone famous in <cite title="Source Title">Source Title</cite></small> </blockquote>
						</div>
						<pre class="prettyprint linenums">&lt;blockquote class="left"&gt;
	...
&lt;/blockquote&gt;</pre>
						<hr class="bs-docs-separator">
						<h2 id="anchors">Anchors</h2>
						<p>Link anchors</p>
						<div class="bs-docs-example"> <a id="anchor1">Anchor</a> to this location on the page <a href="#anchor1">Links to the location</a> </div>
						<pre class="prettyprint linenums">&lt;a id=&quot;anchor1&quot;&gt;&lt;/a&gt;Anchor to this location on the page
&lt;a href=&quot;#anchor1&quot;&gt;Links to the location&lt;/a&gt; </pre>
						<hr class="bs-docs-separator">
						
						<!-- Lists -->
						<h2 id="lists">Lists</h2>
						<h3>Unordered</h3>
						<p>A list of items in which the order does <em>not</em> explicitly matter.</p>
						<div class="bs-docs-example">
							<ul>
								<li>Lorem ipsum dolor sit amet</li>
								<li>Consectetur adipiscing elit</li>
								<li>Integer molestie lorem at massa</li>
								<li>Facilisis in pretium nisl aliquet</li>
								<li>Nulla volutpat aliquam velit
									<ul>
										<li>Phasellus iaculis neque</li>
										<li>Purus sodales ultricies</li>
										<li>Vestibulum laoreet porttitor sem</li>
										<li>Ac tristique libero volutpat at</li>
									</ul>
								</li>
								<li>Faucibus porta lacus fringilla vel</li>
								<li>Aenean sit amet erat nunc</li>
								<li>Eget porttitor lorem</li>
							</ul>
						</div>
						<pre class="prettyprint linenums">
&lt;ul&gt;
  &lt;li&gt;...&lt;/li&gt;
&lt;/ul&gt;
</pre>
						<h3>Ordered</h3>
						<p>A list of items in which the order <em>does</em> explicitly matter.</p>
						<div class="bs-docs-example">
							<ol>
								<li>Lorem ipsum dolor sit amet</li>
								<li>Consectetur adipiscing elit</li>
								<li>Integer molestie lorem at massa</li>
								<li>Facilisis in pretium nisl aliquet</li>
								<li>Nulla volutpat aliquam velit</li>
								<li>Faucibus porta lacus fringilla vel</li>
								<li>Aenean sit amet erat nunc</li>
								<li>Eget porttitor lorem</li>
							</ol>
						</div>
						<pre class="prettyprint linenums">
&lt;ol&gt;
  &lt;li&gt;...&lt;/li&gt;
&lt;/ol&gt;
</pre>
						<h3>Unstyled</h3>
						<p>Remove the default <code>list-style</code> and left padding on list items (immediate children only).</p>
						<div class="bs-docs-example">
							<ul class="unstyled">
								<li>Lorem ipsum dolor sit amet</li>
								<li>Consectetur adipiscing elit</li>
								<li>Integer molestie lorem at massa</li>
								<li>Facilisis in pretium nisl aliquet</li>
								<li>Nulla volutpat aliquam velit
									<ul>
										<li>Phasellus iaculis neque</li>
										<li>Purus sodales ultricies</li>
										<li>Vestibulum laoreet porttitor sem</li>
										<li>Ac tristique libero volutpat at</li>
									</ul>
								</li>
								<li>Faucibus porta lacus fringilla vel</li>
								<li>Aenean sit amet erat nunc</li>
								<li>Eget porttitor lorem</li>
							</ul>
						</div>
						<pre class="prettyprint linenums">
&lt;ul class="unstyled"&gt;
  &lt;li&gt;...&lt;/li&gt;
&lt;/ul&gt;
</pre>
						<h3>Inline</h3>
						<p>Place all list items on a single line with <code>inline-block</code> and some light padding.</p>
						<div class="bs-docs-example">
							<ul class="inline">
								<li>Lorem ipsum</li>
								<li>Phasellus iaculis</li>
								<li>Nulla volutpat</li>
							</ul>
						</div>
						<pre class="prettyprint linenums">
&lt;ul class="inline"&gt;
  &lt;li&gt;...&lt;/li&gt;
&lt;/ul&gt;
</pre>
						<h3>Description</h3>
						<p>A list of terms with their associated descriptions.</p>
						<div class="bs-docs-example">
							<dl>
								<dt>Description lists</dt>
								<dd>A description list is perfect for defining terms.</dd>
								<dt>Euismod</dt>
								<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
								<dd>Donec id elit non mi porta gravida at eget metus.</dd>
								<dt>Malesuada porta</dt>
								<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
							</dl>
						</div>
						<pre class="prettyprint linenums">
&lt;dl&gt;
  &lt;dt&gt;...&lt;/dt&gt;
  &lt;dd&gt;...&lt;/dd&gt;
&lt;/dl&gt;
</pre>
						<h4>Horizontal description</h4>
						<p>Make terms and descriptions in <code>&lt;dl&gt;</code> line up side-by-side.</p>
						<div class="bs-docs-example">
							<dl class="dl-horizontal">
								<dt>Description lists</dt>
								<dd>A description list is perfect for defining terms.</dd>
								<dt>Euismod</dt>
								<dd>Vestibulum id ligula porta felis euismod semper eget lacinia odio sem nec elit.</dd>
								<dd>Donec id elit non mi porta gravida at eget metus.</dd>
								<dt>Malesuada porta</dt>
								<dd>Etiam porta sem malesuada magna mollis euismod.</dd>
								<dt>Felis euismod semper eget lacinia</dt>
								<dd>Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</dd>
							</dl>
						</div>
						<pre class="prettyprint linenums">
&lt;dl class="dl-horizontal"&gt;
  &lt;dt&gt;...&lt;/dt&gt;
  &lt;dd&gt;...&lt;/dd&gt;
&lt;/dl&gt;
</pre>
						<p> <span class="label label-info">Heads up!</span> Horizontal description lists will truncate terms that are too long to fit in the left column fix <code>text-overflow</code>. In narrower viewports, they will change to the default stacked layout. </p>
					</section>
					<!-- Images
        ================================================== -->
					<section id="images">
						<div class="page-header">
							<h1>Images</h1>
						</div>
						<p>Add classes to an <code>&lt;img&gt;</code> element to easily style images in any project.</p>
						<div class="bs-docs-example bs-docs-example-images"> <img src="holder.js/140x140" class="left" alt="left" /> <img src="holder.js/140x140" class="right" alt="rigt"> <img src="holder.js/770x230" class="img-polaroid" alt="img-polaroid"> </div>
						<pre class="prettyprint linenums">
&lt;img src=&quot;holder.js/140x140&quot; class=&quot;left&quot; alt=&quot;left&quot; /&gt; 
&lt;img src=&quot;holder.js/140x140&quot; class=&quot;right&quot; alt=&quot;right&quot;&gt; 
&lt;img src=&quot;holder.js/770x230&quot; class=&quot;img-polaroid&quot; alt=&quot;img-polaroid&quot;&gt;
						</pre>
					</section>
					
					<!-- Columns
        ================================================== -->
					<section id="columns">
						<div class="page-header">
							<h1>Columns</h1>
						</div>
						<p>Dividing content into <strong>two, three and four columns</strong></p>
						<h3>Two Columns</h3>
						<div class="bs-docs-example">
							<div class="row-fluid">
								<div class="span6">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
								</div>
								<div class="span6">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
								</div>
							</div>
						</div>
						<pre class="prettyprint linenums">&lt;div class=&quot;row-fluid&quot;&gt;
  &lt;div class=&quot;span6&quot;&gt;
    &lt;p&gt;content_goes_here&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class=&quot;span6&quot;&gt;
    &lt;p&gt;content_goes_here&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</pre>
						<h3>Three Columns</h3>
						<div class="bs-docs-example">
							<div class="row-fluid">
								<div class="span4">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
								</div>
								<div class="span4">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
								</div>
								<div class="span4">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>
								</div>
							</div>
						</div>
						<pre class="prettyprint linenums">
&lt;div class=&quot;row-fluid&quot;&gt;
  &lt;div class=&quot;span4&quot;&gt;
    &lt;p&gt;content_goes_here&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class=&quot;span4&quot;&gt;
    &lt;p&gt;content_goes_here&lt;/p&gt;
  &lt;/div&gt;
  &lt;div class=&quot;span4&quot;&gt;
    &lt;p&gt;content_goes_here&lt;/p&gt;
  &lt;/div&gt;
&lt;/div&gt;</pre>
						<h3>Four Columns</h3>
						<div class="bs-docs-example">
							<div class="row-fluid">
								<div class="span3">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
								</div>
								<div class="span3">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
								</div>
								<div class="span3">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
								</div>
								<div class="span3">
									<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. </p>
								</div>
							</div>
						</div>
						<pre class="prettyprint linenums">&lt;div class=&quot;row-fluid&quot;&gt;
	&lt;div class=&quot;span3&quot;&gt;
		&lt;p&gt;content_goes_here&lt;/p&gt;
	&lt;/div&gt;
	&lt;div class=&quot;span3&quot;&gt;
		&lt;p&gt;content_goes_here&lt;/p&gt;
	&lt;/div&gt;
	&lt;div class=&quot;span3&quot;&gt;
		&lt;p&gt;content_goes_here&lt;/p&gt;
	&lt;/div&gt;
	&lt;div class=&quot;span3&quot;&gt;
		&lt;p&gt;content_goes_here&lt;/p&gt;
	&lt;/div&gt;
&lt;/div&gt;</pre>
					</section>
					<section id="modals">
						<div class="page-header">
							<h1>Modals <small>- Our popup contact form</small></h1>
						</div>
						<p>Modals are streamlined, but flexible, dialog prompts with the minimum required functionality and smart defaults.</p>
						<h3>Live demo</h3>
						<p>Toggle a modal via JavaScript by clicking the button below. It will slide down and fade in from the top of the page.</p>
						<!-- sample modal content -->
						<div class="bs-docs-example" style="padding-bottom: 24px;"> <a data-toggle="modal" href="#CaseEvaluationModal" class="btn btn-primary btn-large">Launch demo modal</a> </div>
						<pre class="prettyprint linenums">
&lt!-- Button to trigger modal --&gt;
&lt;a href="#CaseEvaluationModal" role="button" class="btn" data-toggle="modal"&gt;Launch demo modal&lt;/a&gt;
</pre>
						<hr class="bs-docs-separator">
						<!-- sample modal content -->
						<div class="bs-docs-example" style="padding-bottom: 24px;"> <a data-toggle="modal" href="#CaseEvaluationModal">Launch demo modal from a standard link</a> </div>
						<pre class="prettyprint linenums">
&lt!-- Link to trigger modal --&gt;
&lt;a href="#CaseEvaluationModal" role="button" data-toggle="modal"&gt;Launch demo modal from a standard link&lt;/a&gt;
</pre>
					</section>
					
					<!-- Miscellaneous
        ================================================== -->
					<section id="misc">
						<div class="page-header">
							<h1>Wells and Feature Boxes</h1>
						</div>
						<h2>Wells</h2>
						<p>Use the well as a simple effect on an element to give it an inset effect.</p>
						<div class="bs-docs-example">
							<div class="well"> Look, I'm in a well! </div>
						</div>
						<pre class="prettyprint linenums">
&lt;div class="well"&gt;
  ...
&lt;/div&gt;
</pre>
						<p>Or....</p>
						<pre class="prettyprint linenums">
&lt;p class="well"&gt;
  ...
&lt;/p&gt;
</pre>
						<h2>Feature Boxes</h2>
						<p>Use the well as a simple effect on an element to give it an inset effect.</p>
						<div class="bs-docs-example">
							<p>
							<div class="feature-left">Left Feature box for navigation or floating wells</div>
							Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.
							</p>
						</div>
						<hr class="bs-docs-separator">
						<pre class="prettyprint linenums">
&lt;div class="feature-left"&gt;
  ...
&lt;/div&gt;
</pre>
						<hr class="bs-docs-separator">
						<div class="bs-docs-example">
							<p>
							<div class="feature-right">Right Feature box for navigation or floating wells</div>
							Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.
							</p>
							<hr class="bs-docs-separator">
						</div>
						<pre class="prettyprint linenums">
&lt;div class="feature-right"&gt;
  ...
&lt;/div&gt;
</pre>
					</section>
					<section id="tabs">
						<div class="page-header">
							<h1>Togglable tabs <small>bootstrap-tab.js</small></h1>
						</div>
						<h2>Example tabs</h2>
						<p>Add quick, dynamic tab functionality to transition through panes of local content, even via dropdown menus.</p>
						<div class="bs-docs-example">
							<ul id="myTab" class="nav nav-tabs">
								<li class="active"><a href="#home" data-toggle="tab">Home</a></li>
								<li><a href="#profile" data-toggle="tab">Profile</a></li>
								<li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="#dropdown1" data-toggle="tab">@fat</a></li>
										<li><a href="#dropdown2" data-toggle="tab">@mdo</a></li>
									</ul>
								</li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="home">
									<p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>
								</div>
								<div class="tab-pane fade" id="profile">
									<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit. Keytar helvetica VHS salvia yr, vero magna velit sapiente labore stumptown. Vegan fanny pack odio cillum wes anderson 8-bit, sustainable jean shorts beard ut DIY ethical culpa terry richardson biodiesel. Art party scenester stumptown, tumblr butcher vero sint qui sapiente accusamus tattooed echo park.</p>
								</div>
								<div class="tab-pane fade" id="dropdown1">
									<p>Etsy mixtape wayfarers, ethical wes anderson tofu before they sold out mcsweeney's organic lomo retro fanny pack lo-fi farm-to-table readymade. Messenger bag gentrify pitchfork tattooed craft beer, iphone skateboard locavore carles etsy salvia banksy hoodie helvetica. DIY synth PBR banksy irony. Leggings gentrify squid 8-bit cred pitchfork. Williamsburg banh mi whatever gluten-free, carles pitchfork biodiesel fixie etsy retro mlkshk vice blog. Scenester cred you probably haven't heard of them, vinyl craft beer blog stumptown. Pitchfork sustainable tofu synth chambray yr.</p>
								</div>
								<div class="tab-pane fade" id="dropdown2">
									<p>Trust fund seitan letterpress, keytar raw denim keffiyeh etsy art party before they sold out master cleanse gluten-free squid scenester freegan cosby sweater. Fanny pack portland seitan DIY, art party locavore wolf cliche high life echo park Austin. Cred vinyl keffiyeh DIY salvia PBR, banh mi before they sold out farm-to-table VHS viral locavore cosby sweater. Lomo wolf viral, mustache readymade thundercats keffiyeh craft beer marfa ethical. Wolf salvia freegan, sartorial keffiyeh echo park vegan.</p>
								</div>
							</div>
						</div>
						<hr class="bs-docs-separator">
						<h3>Markup</h3>
						<p>You can activate a tab or pill navigation without writing any JavaScript by simply specifying <code>data-toggle="tab"</code> or <code>data-toggle="pill"</code> on an element. Adding the <code>nav</code> and <code>nav-tabs</code> classes to the tab <code>ul</code> will apply the Bootstrap tab styling.</p>
						<pre class="prettyprint linenums">
&lt;ul class="nav nav-tabs"&gt;
  &lt;li&gt;&lt;a href="#home" data-toggle="tab"&gt;Home&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#profile" data-toggle="tab"&gt;Profile&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#messages" data-toggle="tab"&gt;Messages&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#settings" data-toggle="tab"&gt;Settings&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;</pre>
						<h3>Methods</h3>
						<h4>$().tab</h4>
						<p> Activates a tab element and content container. Tab should have either a <code>data-target</code> or an <code>href</code> targeting a container node in the DOM. </p>
						<pre class="prettyprint linenums">
&lt;ul class="nav nav-tabs" id="myTab"&gt;
  &lt;li class="active"&gt;&lt;a href="#home"&gt;Home&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#profile"&gt;Profile&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#messages"&gt;Messages&lt;/a&gt;&lt;/li&gt;
  &lt;li&gt;&lt;a href="#settings"&gt;Settings&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;

&lt;div class="tab-content"&gt;
  &lt;div class="tab-pane active" id="home"&gt;...&lt;/div&gt;
  &lt;div class="tab-pane" id="profile"&gt;...&lt;/div&gt;
  &lt;div class="tab-pane" id="messages"&gt;...&lt;/div&gt;
  &lt;div class="tab-pane" id="settings"&gt;...&lt;/div&gt;
&lt;/div&gt;
</pre>
					</section>
					<section id="collapse">
						<div class="page-header">
							<h1>Accordion<small> used for FAQ's and Case Results</small></h1>
						</div>
						<div class="bs-docs-example">
							<div class="accordion" id="accordion_name">
								<div class="accordion-group">
									<div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_name" href="#collapseOne"> Collapsible Group Item #1 </a> </div>
									<div id="collapseOne" class="accordion-body collapse in">
										<div class="accordion-inner">
											<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. </p>
										</div>
									</div>
								</div>
								<div class="accordion-group">
									<div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_name" href="#collapseTwo"> Collapsible Group Item #2 </a> </div>
									<div id="collapseTwo" class="accordion-body collapse">
										<div class="accordion-inner">
											<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. </p>
										</div>
									</div>
								</div>
								<div class="accordion-group">
									<div class="accordion-heading"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion_name" href="#collapseThree"> Collapsible Group Item #3 </a> </div>
									<div id="collapseThree" class="accordion-body collapse">
										<div class="accordion-inner">
											<p>Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS. </p>
										</div>
									</div>
								</div>
							</div>
						</div>
						<pre class="prettyprint linenums">
&lt;div class=&quot;accordion&quot; id=&quot;accordion_name&quot;&gt;
  &lt;div class=&quot;accordion-group&quot;&gt;
    &lt;div class=&quot;accordion-heading&quot;&gt; &lt;a class=&quot;accordion-toggle&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion_name&quot; href=&quot;#collapseOne&quot;&gt; Collapsible Group Item #1 &lt;/a&gt; &lt;/div&gt;
      &lt;div id=&quot;collapseOne&quot; class=&quot;accordion-body collapse in&quot;&gt;
      &lt;div class=&quot;accordion-inner&quot;&gt;
        &lt;p&gt;.....&lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;div class=&quot;accordion-group&quot;&gt;
  &lt;div class=&quot;accordion-heading&quot;&gt; &lt;a class=&quot;accordion-toggle&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion_name&quot; href=&quot;#collapseTwo&quot;&gt; Collapsible Group Item #2 &lt;/a&gt; &lt;/div&gt;
   &lt;div id=&quot;collapseTwo&quot; class=&quot;accordion-body collapse&quot;&gt;
      &lt;div class=&quot;accordion-inner&quot;&gt;
        &lt;p&gt;.....&lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;div class=&quot;accordion-group&quot;&gt;
    &lt;div class=&quot;accordion-heading&quot;&gt; &lt;a class=&quot;accordion-toggle&quot; data-toggle=&quot;collapse&quot; data-parent=&quot;#accordion_name&quot; href=&quot;#collapseThree&quot;&gt; Collapsible Group Item #3 &lt;/a&gt; &lt;/div&gt;
    &lt;div id=&quot;collapseThree&quot; class=&quot;accordion-body collapse&quot;&gt;
      &lt;div class=&quot;accordion-inner&quot;&gt;
        &lt;p&gt;.....&lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;</pre>
					</section>
					<section id="carousel">
						<div class="page-header">
							<h1>Carousel <small>bootstrap-carousel.js</small></h1>
						</div>
						<h2>Example carousel</h2>
						<p>The slideshow below shows a generic plugin and component for cycling through elements like a carousel.</p>
						<div class="bs-docs-example">
							<div id="mainCarousel" class="carousel slide">
								<div class="carousel-inner">
									<div class="item active"><img src="/images/slider/slide.jpg" alt="image_alt_tag" />
										<div class="carousel-caption">
											<h4>Title_of_slide</h4>
											<p>At ClientName we provide comprehensive legal counsel to injury victims throughout the US.</p>
										</div>
									</div>
									<div class="item"><img src="/images/slider/slide.jpg" alt="image_alt_tag" />
										<div class="carousel-caption">
											<h4>Title_of_slide</h4>
											<p>At ClientName we provide comprehensive legal counsel to injury victims throughout the US.</p>
										</div>
									</div>
									<div class="item"><img src="/images/slider/slide.jpg" alt="image_alt_tag" />
										<div class="carousel-caption">
											<h4>Title_of_slide</h4>
											<p>At ClientName we provide comprehensive legal counsel to injury victims throughout the US.</p>
										</div>
									</div>
								</div>
								<a class="left carousel-control" href="#mainCarousel" data-slide="prev">&lsaquo;</a> <a class="right carousel-control" href="#mainCarousel" data-slide="next">&rsaquo;</a> </div>
						</div>
						<pre class="prettyprint linenums">
&lt;div id=&quot;mainCarousel&quot; class=&quot;carousel slide&quot;&gt;
  &lt;div class=&quot;carousel-inner&quot;&gt;
    &lt;div class=&quot;item active&quot;&gt;&lt;img src=&quot;/assets/files/Slider/image_name.jpg&quot; alt=&quot;image_alt_tag&quot; /&gt;
      &lt;div class=&quot;carousel-caption&quot;&gt;
        &lt;h4&gt;Title_of_slide&lt;/h4&gt;
        &lt;p&gt;At ClientName we provide comprehensive legal counsel to injury victims throughout the US.&lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;item&quot;&gt;&lt;img src=&quot;/assets/files/Slider/image_name.jpg&quot; alt=&quot;image_alt_tag&quot; /&gt;
      &lt;div class=&quot;carousel-caption&quot;&gt;
        &lt;h4&gt;Title_of_slide&lt;/h4&gt;
        &lt;p&gt;At ClientName we provide comprehensive legal counsel to injury victims throughout the US.&lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
    &lt;div class=&quot;item&quot;&gt;&lt;img src=&quot;/assets/files/Slider/image_name.jpg&quot; alt=&quot;image_alt_tag&quot; /&gt;
      &lt;div class=&quot;carousel-caption&quot;&gt;
        &lt;h4&gt;Title_of_slide&lt;/h4&gt;
        &lt;p&gt;At ClientName we provide comprehensive legal counsel to injury victims throughout the US.&lt;/p&gt;
      &lt;/div&gt;
    &lt;/div&gt;
  &lt;/div&gt;
  &lt;a class=&quot;left carousel-control&quot; href=&quot;#mainCarousel&quot; data-slide=&quot;prev&quot;&gt;&amp;lsaquo;&lt;/a&gt;
  &lt;a class=&quot;right carousel-control&quot; href=&quot;#mainCarousel&quot; data-slide=&quot;next&quot;&gt;&amp;rsaquo;&lt;/a&gt;
&lt;/div&gt;</pre>
					</section>
					<hr />
					<section id="lightbox">
						<div class="page-header">
							<h1>iLightBox Video Player <small>ilightbox.js</small></h1>
						</div>
						<h2>Example Lightbox Options</h2>
						<p>This shows the four examples of the lightbox themes. Each has it's own ID (demo1, demo2, demo3, demo4).</p>
						<div class="bs-docs-example">
							<div class="row-fluid">
							<div class="span3">
								<div class="videos"><a class="ilightbox" href='http://player.vimeo.com/video/77088391?autoplay=1'
											id="demo1"
											data-type="iframe"
											data-options="width: 800, height: 450"><span class="play" ></span><img src="https://secure-b.vimeocdn.com/ts/452/162/452162109_150.jpg" alt="video1" /></a></div>
								<div class="item-description alt">
									<h5>Video Caption - Mac Theme Lightbox</h5>
								</div>
							</div>
							<div class="span3">
								<div class="videos"><a class="ilightbox" href='http://player.vimeo.com/video/77088391?autoplay=1'
											id="demo2"
											data-type="iframe"
											data-options="width: 800, height: 450"><span class="play" ></span><img src="https://secure-b.vimeocdn.com/ts/452/162/452162109_150.jpg" alt="video1" /></a></div>
								<div class="item-description alt">
									<h5>Video Caption - Smooth Theme Lightbox</h5>
								</div>
							</div>
							<div class="span3">
								<div class="videos"><a class="ilightbox" href='http://player.vimeo.com/video/77088391?autoplay=1'
											id="demo3"
											data-type="iframe"
											data-options="width: 800, height: 450"><span class="play" ></span><img src="https://secure-b.vimeocdn.com/ts/452/162/452162109_150.jpg" alt="video1" /></a></div>
								<div class="item-description alt">
									<h5>Video Caption - Dark Theme Lightbox</h5>
								</div>
							</div>
							<div class="span3">
								<div class="videos"><a class="ilightbox" href='http://player.vimeo.com/video/77088391?autoplay=1'
											id="demo4"
											data-type="iframe"
											data-options="width: 800, height: 450"><span class="play" ></span><img src="https://secure-b.vimeocdn.com/ts/452/162/452162109_150.jpg" alt="video1" /></a></div>
								<div class="item-description alt">
									<h5>Video Caption - Light Theme Lightbox</h5>
								</div>
							</div>
							
							</div>
						</div>
						<pre class="prettyprint linenums">
&lt;div class=&quot;videos&quot;&gt;&lt;a class=&quot;ilightbox&quot; href='http://player.vimeo.com/video/77088391?autoplay=1'
  id=&quot;demo1&quot;
  data-type=&quot;iframe&quot;
  data-options=&quot;width: 800, height: 450&quot;&gt;&lt;span class=&quot;play&quot; &gt;&lt;/span&gt;&lt;img src=&quot;https://secure-b.vimeocdn.com/ts/452/162/452162109_150.jpg&quot; alt=&quot;video1&quot; /&gt;&lt;/a&gt;
&lt;/div&gt;
&lt;div class=&quot;item-description alt&quot;&gt;
  &lt;h5&gt;Video Caption - Mac Theme Lightbox&lt;/h5&gt;
&lt;/div&gt;</pre>
					</section>
					<cfinclude template="includes/socialite.cfm">
					<p id="back-top"><a href="#top">Back to Top</a></p>
				</div>
			</section>
			<!---<cfinclude template="includes/sidebar.cfm">--->
			<div class="span3 bs-docs-sidebar">
				<ul class="nav nav-list bs-docs-sidenav affix">
					<li><a href="#typography"><i class="icon-chevron-right"></i> Typography</a></li>
					<li><a href="#anchors"><i class="icon-chevron-right"></i> Anchors</a></li>
					<li><a href="#lists"><i class="icon-chevron-right"></i> Lists</a></li>
					<li><a href="#images"><i class="icon-chevron-right"></i> Images</a></li>
					<li><a href="#columns"><i class="icon-chevron-right"></i> Columns</a></li>
					<li><a href="#modals"><i class="icon-chevron-right"></i> Modal</a></li>
					<li><a href="#misc"><i class="icon-chevron-right"></i> Wells</a></li>
					<li><a href="#tabs"><i class="icon-chevron-right"></i> Tab</a></li>
					<li><a href="#collapse"><i class="icon-chevron-right"></i> Accordions</a></li>
					<li><a href="#carousel"><i class="icon-chevron-right"></i> Carousel</a></li>
					<li><a href="#lightbox"><i class="icon-chevron-right"></i> Lightbox Videos</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<cfinclude template="includes/footer.cfm">
</body>
</html>