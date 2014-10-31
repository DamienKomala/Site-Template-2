$(document).ready(function() {

    window.prettyPrint && prettyPrint();

    var winWidth = $(window).width(),
        thumbs = (winWidth > 767) ? true : false;

    console.log(winWidth);

    //IMAGES - Single Image
    $('#singleimage_1').iLightBox();
    $('#singleimage_2').iLightBox();
    $('#singleimage_3').iLightBox();
    $('#singleimage_4').iLightBox();

    //IMAGES - Image Gallery
    $('ul#image_gallery li a').iLightBox({
        controls: {
            thumbnail: thumbs
        }
    });

    //IMAGES - Advanced Examples
    $('#forceresize').iLightBox({
        attr: 'photo',
        skin: 'mac',
        innerToolbar: true,
        overlay: {
            opacity: 0.7
        },
        controls: {
            fullscreen: false
        }
    });

    $('#inline_gallery').click(function() {
        $.iLightBox(
            [{
                URL: "assets/img/photos/caesarlima/489_1zokvamp_beauty.jpg",
                type: "image",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/489_1zokvamp_beauty.jpg",
                    skin: "dark"
                }
            }, {
                URL: "assets/img/photos/caesarlima/452_1npblonde.jpg",
                type: "image",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/452_1npblonde.jpg"
                }
            }, {
                URL: "assets/img/photos/caesarlima/397_1natascha_wind.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/397_1natascha_wind.jpg",
                    skin: "dark"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/599_1nero_splash_1.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/599_1nero_splash_1.jpg"
                },
                type: "image",
                caption: "Skins can even be modified on a per-element or group basis."
            }, {
                URL: "assets/img/photos/caesarlima/481_1cae_shadow.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/481_1cae_shadow.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/618_1marilia_splash.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/618_1marilia_splash.jpg",
                    skin: "dark"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/319_1caenewpg2.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/319_1caenewpg2.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/350_1r3__2007__caesarlima_seb8mag3.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/350_1r3__2007__caesarlima_seb8mag3.jpg",
                    width: 300
                },
                type: "image",
                caption: "This one resized to wiidth:300px"
            }, {
                URL: "assets/img/photos/caesarlima/625_1beautykaetsite.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/625_1beautykaetsite.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/583_1testsnowwhite.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/583_1testsnowwhite.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/601_1beauty1.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/601_1beauty1.jpg",
                    skin: "dark"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/585_1DawnO_056casei.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/585_1DawnO_056casei.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/592_1r388_yb_banner.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/592_1r388_yb_banner.jpg",
                    skin: "dark"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/604_1beauty3.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/604_1beauty3.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/603_1beauty4.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/603_1beauty4.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/caesarlima/631_1steampunksplash4.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/caesarlima/631_1steampunksplash4.jpg"
                },
                type: "image"
            }], {
                startFrom: 3,
                skin: 'light',
                path: 'horizontal',
                maxScale: 1.3,
                controls: {
                    thumbnail: thumbs
                },
                overlay: {
                    opacity: .4
                },
                styles: {
                    nextOffsetX: 75,
                    nextOpacity: .55,
                    prevOffsetX: 75,
                    prevOpacity: .55
                },
                thumbnails: {
                    normalOpacity: .6,
                    activeOpacity: 1
                }
            }
        );
        return false;
    });

    $('#open_in_modal').click(function() {
        $.iLightBox(
            [{
                URL: "assets/img/photos/MS-test-day-27898.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27898.jpg"
                },
                type: "image",
                caption: "First Caption. It'll blow your mind."
            }, {
                URL: "assets/img/photos/MS-test-day-27771.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27771.jpg"
                },
                type: "image",
                caption: "Oh yeah, it's that good. See for yourself."
            }, {
                URL: "assets/img/photos/MS-test-day-27845.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27845.jpg"
                },
                type: "image",
                caption: "And lastly, this one. Checkmate."
            }, {
                URL: "assets/img/photos/MS-test-day-27780.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27780.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/MS-test-day-278081.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-278081.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/MS-test-day-27749.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27749_2.jpg"
                },
                type: "image"
            }], {
                skin: 'metro-black',
                path: 'horizontal',
                controls: {
                    thumbnail: thumbs
                },
                overlay: {
                    opacity: .7,
                    blur: false
                },
                keyboard: {
                    esc: false
                },
                styles: {
                    nextOpacity: .55,
                    prevOpacity: .55
                }
            }
        );
        return false;
    });

    $('#image_recognizer').click(function() {
        var socialButtons = {
            facebook: true,
            twitter: true,
            googleplus: {
                source: "https://plus.google.com/share?url={URL}",
                text: "Share on Google+"
            },
            digg: {
                width: 800,
                height: 480
            }
        };

        $.iLightBox(
            [{
                URL: "http://instagram.com/p/P72Lw9Oc7L/",
                caption: "This one recognized from this <a href='http://instagram.com/p/P72Lw9Oc7L/' target='_blank'>URL</a> on instagram.",
                options: {
                    social: $.extend(true, {}, socialButtons, {
                        facebook: {
                            URL: "http://instagram.com/p/P72Lw9Oc7L/"
                        },
                        twitter: {
                            URL: "http://instagram.com/p/P72Lw9Oc7L/"
                        },
                        googleplus: {
                            URL: "http://instagram.com/p/P72Lw9Oc7L/"
                        },
                        digg: {
                            URL: "http://instagram.com/p/P72Lw9Oc7L/"
                        }
                    })
                }
            }, {
                URL: "http://www.flickr.com/photos/bruce-hood/8584616829/",
                caption: "This one recognized from this <a href='http://www.flickr.com/photos/bruce-hood/8584616829/' target='_blank'>URL</a> on flickr.",
                options: {
                    social: {
                        facebook: {
                            URL: "http://www.flickr.com/photos/bruce-hood/8584616829/"
                        },
                        twitter: {
                            URL: "http://www.flickr.com/photos/bruce-hood/8584616829/"
                        }
                    }
                }
            }, {
                URL: "http://www.deviantart.com/art/Everflowing-Now-361277015",
                caption: "This one recognized from this <a href='http://www.deviantart.com/art/Everflowing-Now-361277015' target='_blank'>URL</a> on deviantArt.",
                options: {
                    social: $.extend(true, {}, socialButtons, {
                        facebook: {
                            URL: "http://www.deviantart.com/art/Everflowing-Now-361277015"
                        },
                        twitter: {
                            URL: "http://www.deviantart.com/art/Everflowing-Now-361277015"
                        },
                        googleplus: {
                            URL: "http://www.deviantart.com/art/Everflowing-Now-361277015"
                        },
                        digg: {
                            URL: "http://www.deviantart.com/art/Everflowing-Now-361277015"
                        }
                    })
                }
            }], {
                smartRecognition: true,
                skin: 'smooth',
                path: 'horizontal',
                fullAlone: false,
                controls: {
                    thumbnail: thumbs
                },
                caption: {
                    start: false
                },
                social: {
                    start: false,
                    buttons: socialButtons
                },
                styles: {
                    nextScale: 0.6,
                    prevScale: 0.6,
                    nextOpacity: 0.6,
                    prevOpacity: 0.6
                },
                thumbnails: {
                    normalOpacity: .6,
                    activeOpacity: 1
                }
            }
        );
        return false;
    });

    $('#deeplinking_looping_gallery li a').iLightBox({
        skin: 'metro-white',
        path: 'horizontal',
        fullViewPort: 'fill',
        infinite: true,
        linkId: "music",
        overlay: {
            opacity: 1,
            blur: false
        },
        controls: {
            thumbnail: false
        },
        styles: {
            nextOffsetX: -45,
            prevOffsetX: -45
        }
    });

    //HTML - Inline Content
    $('#inline_html_simple').iLightBox({
        attr: 'target',
        skin: 'metro-white'
    });

    $('#inline_html_forced').click(function() {
        $.iLightBox([{
            URL: '#demo_inline_element',
            type: 'inline',
            options: {
                width: 720,
                height: 360
            }
        }], {
            skin: 'metro-white'
        });
        return false;
    });

    //HTML - Ajax
    $('#ajax_simple').iLightBox({
        attr: 'target',
        overlay: {
            opacity: .6
        },
        skin: 'parade',
        minScale: 1
    });

    $('#ajax_forced').iLightBox({
        attr: 'target',
        overlay: {
            opacity: .6
        },
        skin: 'parade',
        minScale: 1
    });

    $('#ajax_modal').iLightBox({
        attr: 'target',
        innerToolbar: true,
        overlay: {
            opacity: .6,
            blur: false
        },
        controls: {
            fullscreen: false
        },
        keyboard: {
            esc: false
        },
        skin: 'parade',
        minScale: 1
    });

    //HTML - FLASH / SWF
    $('#flash_simple').iLightBox({
        innerToolbar: true,
        controls: {
            fullscreen: false
        },
        skin: 'dark'
    });

    $('#flash_forced').iLightBox({
        innerToolbar: true,
        controls: {
            fullscreen: false
        },
        minScale: 1
    });

    //HTML - IFRAME
    $('#iframe_1').iLightBox();

    $('#iframe_2').iLightBox({
        minScale: 1
    });

    $('#iframe_3').iLightBox({
        minScale: 1
    });

    //HTML - Advanced Examples
    $('#DOM').click(function() {
        var html = $('<div class="center"><h2><img src="assets/img/smile.gif">It\'s time to upgrade.</h2><hr><p>iLightBox supports DOM elements created on the fly.</p></div>');
        $.iLightBox([{
            URL: html,
            type: 'html'
        }], {
            innerToolbar: true,
            controls: {
                fullscreen: false
            },
            skin: 'parade',
            minScale: 1
        });
        return false;
    });

    //Video - Simple Usage
    $('#video_1').iLightBox();
    $('#video_2').iLightBox();
    $('#video_3').iLightBox();
    $('#video_html5').iLightBox();

    //Video - Advanced Examples
    $('#video_4').iLightBox({
        smartRecognition: true
    });
    $('#video_5').iLightBox({
        smartRecognition: true
    });
    $('#video_6').iLightBox({
        smartRecognition: true
    });
    $('#video_7').iLightBox({
        smartRecognition: true
    });
    $('#video_8').iLightBox({
        smartRecognition: true
    });
    $('#video_9').iLightBox({
        smartRecognition: true
    });

    $('#video_gallery').click(function() {
        $.iLightBox(
            [{
                URL: "http://www.youtube.com/watch?v=_Z4Z-E-Mxbo"
            }, {
                URL: "http://vimeo.com/55331511"
            }, {
                URL: "http://www.hulu.com/watch/424558"
            }, {
                URL: "http://www.metacafe.com/watch/9542534/man_of_steel_trailer/"
            }, {
                URL: "http://www.dailymotion.com/video/xp53r5_the-avengers-official-trailer-2_shortfilms"
            }, {
                URL: "http://www.gametrailers.com/videos/za4633/crysis-3-the-7-wonders---episode-1--hell-of-a-town",
                options: {
                    width: 1280,
                    height: 720
                }
            }], {
                smartRecognition: true,
                skin: 'dark',
                controls: {
                    thumbnail: thumbs
                },
                overlay: {
                    blur: false
                },
                keyboard: {
                    esc: false
                },
                styles: {
                    nextOpacity: .55,
                    prevOpacity: .55
                }
            }
        );
        return false;
    });

    //Advanced Examples - Mixed & Google Maps
    $('#mixed_contents').click(function() {
        $.iLightBox(
            [{
                URL: "http://iprodev.com/ilightbox/assets/MV5BMTM1NTMyMDE4OV5BMTFeQW1wNF5BbWU3MDEyNTI0OTU.mp4",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/trailer.jpg",
                    html5video: {
                        webm: "http://iprodev.com/ilightbox/assets/MV5BMTM1NTMyMDE4OV5BMTFeQW1wNF5BbWU3MDEyNTI0OTU.webm",
                        poster: "assets/img/sherlock_holmes/trailer.jpg"
                    },
                    width: 1280,
                    height: 544
                }
            }, {
                URL: "assets/img/sherlock_holmes/1.jpg",
                caption: 'This one fill the screen when you enter fullscreen.',
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/1.jpg",
                    fullViewPort: 'fill'
                }
            }, {
                URL: "assets/img/sherlock_holmes/2.jpg",
                caption: 'This one fit to the screen when you enter fullscreen.',
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/2.jpg",
                    fullViewPort: 'fit'
                }
            }, {
                URL: "http://www.youtube.com/embed/lNxhpNpnAkk?autohide=1&border=0&egm=0&showinfo=0&showsearch=0",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/mqdefault.jpg",
                    fullViewPort: 'stretch',
                    icon: "video",
                    width: 1280,
                    height: 720
                }
            }, {
                URL: "assets/img/sherlock_holmes/3.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/3.jpg"
                }
            }, {
                URL: "assets/img/sherlock_holmes/4.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/4.jpg"
                }
            }, {
                URL: "assets/img/sherlock_holmes/5.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/5.jpg"
                }
            }, {
                URL: "assets/img/sherlock_holmes/6.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/6.jpg"
                }
            }, {
                URL: "assets/img/sherlock_holmes/7.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/7.jpg"
                }
            }, {
                URL: "assets/img/sherlock_holmes/8.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/sherlock_holmes/8.jpg"
                }
            }], {
                path: 'horizontal',
                skin: 'metro-black',
                styles: {
                    nextOpacity: 0,
                    prevOpacity: 0
                },
                controls: {
                    thumbnail: thumbs
                }
            }
        );
        return false;
    });

    $('#google_maps').click(function() {
        $.iLightBox([{
            URL: "assets/ajax/maps.html",
            options: {
                width: 720,
                height: 420
            },
            type: 'iframe'
        }], {
            minScale: 1,
            skin: 'metro-black'
        });
        return false;
    });

    var slideShowButton = $('<a class="btn btn-primary slideshow_button">Slideshow</a>'),
        slideshow = false,
        pauseTime = 5000,
        changeTimeout = null;
    //Advanced Examples - Image Gallery with Slideshow
    $('ul#image_gallery_with_slideshow li a').iLightBox({
        skin: 'metro-white',
        path: 'horizontal',
        controls: {
            thumbnail: false
        },
        styles: {
            pageOffsetY: 100,
            nextScale: 0.6,
            prevScale: 0.6,
            nextOpacity: 0.6,
            prevOpacity: 0.6
        },
        effects: {
            switchSpeed: 700
        },
        callback: {
            onOpen: function() {
                var t = this;
                $('body').append(slideShowButton);
                slideShowButton.on('click', function() {
                    if (slideshow) {
                        stopSlideshow();
                    } else {
                        if (t.vars.current == t.vars.total - 1) t.goTo(0);
                        startSlideshow();
                        changeTimeout = setTimeout(function() {
                            t.moveTo('next');
                        }, pauseTime);
                    }
                });
            },
            onHide: function() {
                slideShowButton.off('click').hide().remove();
            },
            onAfterLoad: function() {
                slideShowButton.fadeIn(this.options.effects.loadedFadeSpeed);
            },
            onBeforeChange: function() {
                clearTimeout(changeTimeout);
            },
            onAfterChange: function(api) {
                var t = this;
                if (slideshow) {
                    if (api.currentItem == this.vars.total - 1) {
                        stopSlideshow();
                    } else changeTimeout = setTimeout(function() {
                        t.moveTo('next');
                    }, pauseTime);
                }
            },
            onEnterFullScreen: function() {
                slideShowButton.hide();
                clearTimeout(changeTimeout);
            },
            onExitFullScreen: function() {
                var t = this;
                slideShowButton.show();
                if (slideshow) {
                    if (t.vars.current != t.vars.total - 1) changeTimeout = setTimeout(function() {
                        t.moveTo('next');
                    }, pauseTime);
                }
            }
        }
    });

    function startSlideshow() {
        slideshow = true;
        slideShowButton.text('Stop');
    }

    function stopSlideshow() {
        slideshow = false;
        clearTimeout(changeTimeout);
        slideShowButton.text('Slideshow');
    }


    //Advanced Examples - Alert/Confirm/Prompt
    function dialogue(content, title) {
        content = $('<div />', {
            'class': 'dialogue clearfix'
        }).append(content);

        $.iLightBox([{
            URL: content,
            type: "html",
            title: (title) ? title : null
        }], {
            skin: 'metro-white ilightbox-dialogue',
            minScale: 1,
            innerToolbar: true,
            show: {
                effect: false
            },
            hide: {
                effect: false
            },
            overlay: {
                blur: false
            },
            controls: {
                fullscreen: false
            },
            callback: {
                // Hide the iLightBox when any buttons in the dialogue are clicked
                onRender: function(api) {
                    $('.btn', api.currentElement).click(function() {
                        $('.btn', api.currentElement).unbind('click');
                        api.hide();
                    });
                },
                // Hide the iLightBox when any buttons in the dialogue are clicked
                onShow: function(api) {
                    $('.btn-primary', api.currentElement).focus();
                }
            }
        });
    }

    // Our Alert method
    function Alert(message, title) {
        // Content will consist of the message and an ok button
        var message = $('<p />', {
                html: message,
                'class': 'dialogue_message'
            }),
            ok = $('<button />', {
                html: "OK",
                'class': 'btn btn-primary',
                keyup: function(e) {
                    if (e.keyCode == 13) $(this).trigger('click');
                }
            });

        dialogue(message.add(ok), title);
    }

    // Our Prompt method
    function Prompt(question, title, initial, callback) {
        // Content will consist of a question elem and input, with ok/cancel buttons
        var message = $('<p />', {
                html: question,
                'class': 'dialogue_message'
            }),
            input = $('<input />', {
                'type': 'text',
                val: initial
            }),
            clear = $('<div />', {
                'class': 'clear'
            }),
            ok = $('<button />', {
                html: "OK",
                'class': 'btn btn-primary',
                click: function() {
                    callback(input.val());
                },
                keyup: function(e) {
                    if (e.keyCode == 13) $(this).trigger('click');
                }
            }),
            cancel = $('<button />', {
                html: "Cancel",
                'class': 'btn',
                click: function() {
                    callback(null);
                }
            });

        dialogue(message.add(input).add(clear).add(ok).add(cancel), title);
    }

    // Our Confirm method
    function Confirm(question, title, callback) {
        // Content will consist of the question and ok/cancel buttons
        var message = $('<p />', {
                html: question
            }),
            ok = $('<button />', {
                html: "Yes",
                'class': 'btn btn-primary',
                click: function() {
                    callback(true);
                },
                keyup: function(e) {
                    if (e.keyCode == 13) $(this).trigger('click');
                }
            }),
            cancel = $('<button />', {
                html: "No",
                'class': 'btn',
                click: function() {
                    callback(false);
                }
            });

        dialogue(message.add(cancel).add(ok), title, function() {
            callback(false);
        });
    }

    $('#show_alert').click(function() {
        Alert('Custom alert() functions are cool.', 'Alert!');
    });

    $('#show_prompt').click(function() {
        Prompt('How would you describe iLightBox?', 'Attention!', 'Awesome!', function(response) {
            alert(response);
            // do something with response
        });
    });

    $('#show_confirm').click(function() {
        Confirm('Click Yes if you love iLightBox', 'Do you agree?', function(yes) {
            // do something with yes
            alert(yes);
        });
    });

    //Advanced Examples - Events
    $('#events_gallery').click(function() {
        var con = $('#pre_events');
        $.iLightBox(
            [{
                URL: "assets/img/photos/MS-test-day-27898.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27898.jpg"
                },
                type: "image",
                caption: "First Caption. It'll blow your mind."
            }, {
                URL: "assets/img/photos/MS-test-day-27771.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27771.jpg"
                },
                type: "image",
                caption: "Oh yeah, it's that good. See for yourself."
            }, {
                URL: "assets/img/photos/MS-test-day-27845.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27845.jpg"
                },
                type: "image",
                caption: "And lastly, this one. Checkmate."
            }, {
                URL: "assets/img/photos/MS-test-day-27780.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27780.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/MS-test-day-278081.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-278081.jpg"
                },
                type: "image"
            }, {
                URL: "assets/img/photos/MS-test-day-27749.jpg",
                options: {
                    thumbnail: "assets/img/thumbnails/MS-test-day-27749_2.jpg"
                },
                type: "image"
            }], {
                path: 'horizontal',
                overlay: {
                    opacity: .7
                },
                controls: {
                    thumbnail: thumbs
                },
                callback: {
                    onOpen: function() {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onOpen" fired<br />').scrollTop(10000);
                    },
                    onRender: function(api, position) {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onRender" fired for item ' + position + '.<br />').scrollTop(10000);
                    },
                    onShow: function(api, position) {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onShow" fired for item ' + position + '.<br />').scrollTop(10000);
                    },
                    onHide: function() {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onHide" fired.<br /><p>-----------------------------------</p>').scrollTop(10000);
                    },
                    onEnterFullScreen: function() {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onEnterFullScreen" fired.<br />').scrollTop(10000);
                    },
                    onExitFullScreen: function() {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onExitFullScreen" fired.<br />').scrollTop(10000);
                    },
                    onBeforeLoad: function(api, position) {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onBeforeLoad" fired for item ' + position + '.<br />').scrollTop(10000);
                    },
                    onAfterLoad: function(api, position) {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onAfterLoad" fired for item ' + position + '.<br />').scrollTop(10000);
                    },
                    onBeforeChange: function() {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onBeforeChange" fired.<br />').scrollTop(10000);
                    },
                    onAfterChange: function() {
                        var d = new Date();
                        con.append(d.getHours() + ':' + d.getMinutes() + ':' + d.getSeconds() + '.' + d.getMilliseconds() + ' - Event "onAfterChange" fired.<br />').scrollTop(10000);
                    }
                }
            }
        );
        return false;
    });
});