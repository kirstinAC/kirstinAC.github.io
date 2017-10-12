$(document).ready(function() {

    //////////Fancybox 2 for the My Account and Register Now forms//////////
    $('.fancybox').fancybox({
        helpers : {
            overlay : {
                css : {
                    'background' : 'rgba(255, 255, 255, 0.90)'
                }
            },
            changeFade: 10,
            changeSpeed: 10,
        }
    });

    //////////Fancybox 2 for gallery page//////////
    $('.gallerybox').fancybox({
        helpers : {
            overlay : {
                css : {
                    'background' : 'rgba(255, 255, 255, 0.90)'
                }
            }
        },
		beforeShow : function(opt) {
			this.title = this.title.replace(/[|]/g,"<br/>");
	    },
		afterShow : function(opt) {
			if (this.href.indexOf("k=video") >= 0)
			{
				this.width = ($('.fancybox-iframe').contents().find('html').width())+80;
				this.height = ($('.fancybox-iframe').contents().find('html').height())+50;	

				window_width = $(window).innerWidth();
				window_height = $(window).innerHeight();
				
				this.width = (window_width < this.width) ? window_width : this.width;
				this.height = (window_height < this.height) ? window_height : this.height;

				$('.fancybox-iframe').contents().find('#acn_video_1').css("width", this.width - 80);
				$('.fancybox-iframe').contents().find('#acn_video_1').css("height", this.height - 50);
				
			}
	    }
    });
             
    //////////Toggle nav for mobile//////////
    $("#mblnav").on("click", function(){
        $("#navlist").toggle();
        $(this).toggleClass("active");
    });

    $('#navlist > li').make_dropdown();

    // SGC: Insure that if the mouse goes outside of the <ul> element when hovering over the main navs that it stays for at least 400ms
    $('#navlist > li').hover(function() {
        var windowWidth = $(window).width();

        if(windowWidth >= 768 ) {
            $(this).children('ul').css({display:'block'}, 400);
        }
    });

    //////////Flexslider Setup//////////
     $('.flexslider').flexslider({
            animation: "slide",
            controlNav: true,
            slideshowSpeed: 4500,
            animationDuration: 80,
            pauseOnAction: false, 
            touch: true, 
            slideshow:true,
            pauseOnAction: false,
            start: function(slider){
              $('body').removeClass('loading');
            }
          });

    //////////Make the whole footernav navtabs clickable, and a few other page items//////////
    var triggerLink = function(link) {
        var target = link.attr("target");
        var windowWidth = $(window).width();

        // SGC: Disable top header links for Desktop/tablet
        if(windowWidth >= 768 && $(link).is('.aboutlink, .explorelink, .registerlink, .needlink, .contactlink') ) {
            console.debug('test');
            return false;
        }

        if(target) {
            window.open(link.attr("href"), target);    
        } else {
            window.location =  link.attr("href");
        }
    };

     // $(".navtab, #navlist a, #datewrap01, #datewrap02, #featured").click(function(e){
    $(".navtab, #navlist a, #datewrap01, #datewrap02, #featured").on('click', function(e){
        var link = $(this).find("a");

        if($(this).is('a')) {
            link = $(this);
        }

        // SGC: Fancybox links only
        if ($(link).hasClass('fancybox') ) {
            $.fancybox(link.attr("href"), {
                type: 'iframe',
                autoDimensions: true,
                autoSize: false,
                helpers : {
                    overlay : {
                        css : {
                            'background' : 'rgba(255, 255, 255, 0.90)'
                        }
                    }
                }
            });
        }
        else {
            triggerLink(link);
        }
        
        e.preventDefault();
        // return false;
    });

    //////////Code for the top header up and down//////////
   $('.triggerdown').click(function(){
        $('#drawerwrap').animate({height:'10.5em'}, 500);
        $('.toggle, #loginlink').removeClass('triggerdown');
    })


     $('#drawerclose').live('click', function() {
        $('#drawerwrap').animate({height:'0em'}, 500);
        $('.toggle, #loginlink').addClass('trigger');
    });

    $('.toggle, #login').click(function(){
        $('.login').css("display","list-item");
        //return false;
    })     


    ////////// Accordion sliders //////////
    // 10/2/2012: SGC
    var accordionOptions = {header: 'a', autoHeight: false, collapsible: true, active: false};

    $('.accordionList').accordion(accordionOptions);
    
    accordionOptions.header = 'header';
    $('.subAccordionList').accordion(accordionOptions);

    accordionOptions.header = 'header';
    $('.inlineAccordionList').accordion(accordionOptions);
    
    $('.accordionList, .subAccordionList, .inlineAccordionList').bind('accordionchange', function(event, ui) {        
        $(ui.newHeader).addClass('active');
        $(ui.oldHeader).removeClass('active');
    });


    $('.calendar .inlineAccordionList').accordion( "option", "active", 0 );
    ////////// end accordion sliders //////////


    // SGC: For showing navigation on tablet/mobile
    var showMobileNav = function(event, element) {

        if(!$(element).hasClass('preventRapidClicks')) {

            $(element).addClass('preventRapidClicks');

            if($(window).width() < 1000 ) {
                event.preventDefault();
                $('#pagemenu').toggle();
                $('#sidemenu h2').toggleClass('active');
            }

            setTimeout(function(){
                $(element).removeClass('preventRapidClicks');
            }, 300);
        }
    }

    $('#sidemenu h2').on({
        click: function(e) {
            showMobileNav(e,this);
        },
        dblclick: function(e) {
            showMobileNav(e,this);
        }
    });


    // SGC: If we have hidden the nav, make sure to show it if the window is sized back up
    $(window).resize(function() {

        if(!$('#sidemenu h2').hasClass('preventRapidClicks')) {

            if(window.outerWidth >= 1000) {
                $('#pagemenu').show(); 
            }
            else {
                $('#pagemenu').hide();
            }
        }
    });

    if(window.outerWidth < 1000 ) {
        $('#pagemenu').hide();
    };

    ////////// Touch Events ///////////////
    var hammer = new Hammer(document.body, {
        drag_horizontal: true,
        tap: true,
        prevent_default: false,
        swipe_time: 900,
        swipe_min_distance: 10,
        hold_timeout: 900
    });

    hammer.onswipe = function(e) {
        var mappedKeyCode = 39;

        if(e.direction == 'right') {
            // SGC: Left key command
            mappedKeyCode = 37;
        } else if(e.direction == 'left'){
            // SGC: Right key command
            mappedKeyCode = 39;
        }
        else {
            return true;
        }

        var e = jQuery.Event("keydown", { keyCode: mappedKeyCode });
        $(document).trigger(e);

        var e = jQuery.Event("keyup", { keyCode: mappedKeyCode });
        $(document).trigger(e);

        return true;
    };

});
//////////end document ready function//////////
