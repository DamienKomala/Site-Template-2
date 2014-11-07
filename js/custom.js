jQuery(document)
    .ready(function ($) {
		
        /* -------------------- Styleguide Pretty Code --------------------- */
		
		window.prettyPrint && prettyPrint()
		
		/* -------------------- IE 10 jQuery Fix for non working tabs --------------------- */
		
		if ( $.browser.msie && 10 >= $.browser.version ) {
			$('.fade').removeClass('fade');
		};

        /* -------------------- Back to top --------------------- */

		$('a.back-to-top')
			.click(function () {
				$('body,html')
					.animate({
					scrollTop: 0
				}, 800);
			return false;
         });
		
		/* ------------------- Popovers and Tooltips --------------------- */
	
		$('.tooltip').tooltip()
		$('.popover').popover()
		
		$("a[data-toggle=popover]")
			.popover()
			.click(function(e) {
				e.preventDefault()
		});
		 
		$('.workers-comp').tooltip({
			selector: "a[data-toggle=tooltip]"
		}),
		$('.logos').tooltip({
		  selector: "a[data-toggle=tooltip]"
		}),

        /* ------------------- Open External Links in a new window --------------------- */

        $("a[href^=http]").each(
            function () {
                if (this.href.indexOf(location.hostname) == -1) {
                    $(this).attr('target', '_blank');
                }
            }
        ),

        /* ------------------- Socialite JS Addition --------------------- */

		Socialite.load($(this)[0]);

        /* ------------------- Animated Carousel --------------------- */

		$('#myCarousel').carousel({
			interval: 10000
		}),
		$('#mainCarousel').carousel({
			interval: 10000
		}),
		$('#testimonials-carousel').carousel({
			interval: 50000
		}),
		$('#testimonials-carousel').hover(function () {   
  			$(this).carousel('pause');
		}),
		
		/* ------------------- Open all Accordions --------------------- */

		$('.content .closeall').click(function(){
		$('.content .accordion-body.in')
			.collapse('hide');
		});
		$('.content .openall').click(function(){
		$('.content .accordion-body:not(".in")')
			.collapse('show');
		});

        /* -------------------- Placeholder fix that stupid and outdated browser, IE --------------------- */

        $(function () {
            if (/MSIE 9|MSIE 8|MSIE 7|MSIE 6/g.test(navigator.userAgent)) {
                function resetPlaceholder() {
                    if ($(this).val() === '') {
                        $(this).val($(this).attr('placeholder'))
                            .attr('data-placeholder', true)
                            .addClass('ie-placeholder');
                        if ($(this).is(':password')) {
                            var field = $('<input />');
                            $.each(this.attributes, function (i, attr) {
                                if (attr.name !== 'type') {
                                    field.attr(attr.name, attr.value);
                                }
                            });
                            field.attr({
                                'type': 'text',
                                'data-input-password': true,
                                'value': $(this).val()
                            });
                            $(this).replaceWith(field);
                        }
                    }
                }
                $('[placeholder]').each(function () {
                    //ie user refresh don't reset input values workaround
                    if ($(this).attr('placeholder') !== '' && $(this).attr('placeholder') === $(this).val()) {
                        $(this).val('');
                    }
                    resetPlaceholder.call(this);
                });
                $(document).on('focus', '[placeholder]', function () {
                    if ($(this).attr('data-placeholder')) {
                        $(this).val('').removeAttr('data-placeholder').removeClass('ie-placeholder');
                    }
                }).on('blur', '[placeholder]', function () {
                    resetPlaceholder.call(this);
                });
                $(document).on('focus', '[data-input-password]', function () {
                    var field = $('<input />');
                    $.each(this.attributes, function (i, attr) {
                        if (['type', 'data-placeholder', 'data-input-password', 'value'].indexOf(attr.name) === -1) {
                            field.attr(attr.name, attr.value);
                        }
                    });
                    field.attr('type', 'password').on('focus', function () {
                        this.select();
                    });
                    $(this).replaceWith(field);
                    field.trigger('focus');
                });
            }
        });
		
		/* ------------------- Sort / Resize / Dynamic Tables --------------------- */
	
		/*$("table").tablesorter();
		
		$("#resize, #resize2").colResizable({
			liveDrag:true,
			draggingClass:"dragging" 
		});
	
		oTable = $('.dTable').dataTable({
			"bJQueryUI": false,
			"bAutoWidth": false,
			"sPaginationType": "full_numbers",
			"sDom": '<"H"fl>t<"F"ip>'
		});
		
		$('#dyn .tOptions').click(function () {
			$('#dyn .tablePars').slideToggle(200);
		});	
		
		$('#dyn2 .tOptions').click(function () {
			$('#dyn2 .tablePars').slideToggle(200);
		});	
		
		$('.tOptions').click(function () {
			$(this).toggleClass("act");
		});*/		
		
		/* ------------------- Clean up inline styles --------------------- */
		
		$('span').removeAttr('style');
		$('p').removeAttr('style');
		$('img').removeAttr('style');
		$('a').removeAttr('style');
		$('h1').removeAttr('style');
		$('h2').removeAttr('style');
		$('h3').removeAttr('style');
		$('h4').removeAttr('style');
		
        /* ------------------- Lightbox Effect --------------------- */
		
		$('#demo1').iLightBox({
			skin: 'mac',
			fullViewPort: 'fill',
			social: {
				facebook: true,
				twitter: true,
				googleplus: true
				}
		});
		$('#demo2').iLightBox({
			skin: 'smooth',
			fullViewPort: 'fill',
			social: {
				facebook: false,
				twitter: false,
				googleplus: false
				}
		});
		$('#demo3').iLightBox({
			skin: 'dark',
			fullViewPort: 'fill',
			social: {
				facebook: true,
				twitter: true,
				googleplus: true
				}
		});
		$('#demo4').iLightBox({
			skin: 'light',
			fullViewPort: 'fill',
			social: {
				facebook: true,
				twitter: true,
				googleplus: true
				}
		});

        /* ------------------- Sitemap / 404 Page File tree --------------------- */

		$('#menu ul').hide();
		$('#menu li a').click(
			function() {
			var openMe = $(this).next();
			var mySiblings = $(this).parent().siblings().find('ul');
			if (openMe.is(':visible')) {
				openMe.slideUp('normal');  
			} else {
				mySiblings.slideUp('normal');  
				openMe.slideDown('normal');
			}
		  }
		);
		
        /* ------------------- HTML Entities --------------------- */
		
		function htmlEntities(str) {
		return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g,'&gt;').replace(/"/g, '&quot;');
		}
		
       
    }); // JavaScript Document