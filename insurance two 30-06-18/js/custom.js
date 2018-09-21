(function ($) {

    "use strict";

    /*----------------------------
        Insurance coverage area
     ------------------------------ */
    $("#insurance-service-content").owlCarousel({
        autoPlay: false,
        slideSpeed: 2000,
        pagination: false,
        navigation: true,
        items: 5,
        navigationText: ["<i class='fa fa-angle-left'></i>", "<i class='fa fa-angle-right'></i>"],
        itemsDesktop: [1199, 5],
        itemsDesktopSmall: [980, 3],
        itemsTablet: [768, 2],
        itemsMobile: [479, 1],
    })


    /*----------------------------
        Testimonials script
     ------------------------------ */
    $("#Testimonials-1col").owlCarousel({
        autoPlay: 3e3,
        items: 1,
        itemsDesktop: [1e3, 2],
        itemsDesktopSmall: [900, 2],
        itemsTablet: [600, 1],
        itemsMobile: !1
    }), 
    $("#Testimonials-2col").owlCarousel({
        autoPlay: 3e3,
        items: 2
    }), 
    $("#Testimonials-3col").owlCarousel({
        autoPlay: 3e3,
        items: 3,
        itemsDesktop: [1e3, 2],
        itemsDesktopSmall: [900, 2],
        itemsTablet: [480, 1],
        itemsMobile: !1
    }),



    /*----------------------------
        Our Client script
    ------------------------------ */

    $("#Our-clients").owlCarousel({
        autoPlay: 3e3,
        items: 6,
        pagination: !1,
        itemsDesktop: [1e3, 4],
        itemsDesktopSmall: [900, 4],
        itemsTablet: [600, 3],
        itemsMobile: !1
    }), 


    /*-------------------------------------
        Insurance project slider script
    --------------------------------------- */
    $("#Projects-Slider").owlCarousel({
        slideSpeed: 300,
        items: 3,
        paginationSpeed: 400
    }),

    /*----------------------------
    loading script
    ------------------------------ */
    $(window).load(function() {
    $(".loading-overlay .spinner").fadeOut(300), $(".loading-overlay").fadeOut(300);
    $("body").css({
        overflow: "auto",
        height: "auto",
        position: "relative"
    })
    });


    /*----------------------------
        form submit script
     ------------------------------ */
    var frm = $("#cform");
    frm.submit(function(e) {
        $.ajax({
            type: frm.attr("method"),
            url: frm.attr("action"),
            data: frm.serialize(),
            success: function() {
                $("#cform").append("<div class='alert alert-success'><button type='button' class='close' data-dismiss='alert' aria-hidden='true'>×</button><i class='fa fa-thumbs-o-up'></i><strong>Well done!</strong> Your Message Submitted!</div>")
            }
        }), e.preventDefault()
    }),  jQuery(".tap-title").each(function() {
        jQuery(this).on('click',function() {
            return jQuery(this).parent().parent().hasClass("toggle-accordion") ? (jQuery(this).parent().find("li:first .tap-title").addClass("active"), jQuery(this).parent().find("li:first .tap-title").next(".accordion-inner").addClass("active"), jQuery(this).toggleClass("active"), jQuery(this).next(".accordion-inner").slideToggle().toggleClass("active"), jQuery(this).find("i").toggleClass("fa-plus").toggleClass("fa-minus")) : jQuery(this).next().is(":hidden") ? (jQuery(this).parent().parent().find(".tap-title").removeClass("active").next().slideUp(200), jQuery(this).parent().parent().find(".tap-title").next().removeClass("active").slideUp(200), jQuery(this).toggleClass("active").next().slideDown(200), jQuery(this).next(".accordion-inner").toggleClass("active"), jQuery(this).parent().parent().find("i").removeClass("fa-minus").addClass("fa-plus"), jQuery(this).find("i").removeClass("fa-plus").addClass("fa-minus")) : (jQuery(this).toggleClass("active").next().slideToggle(200), jQuery(this).next(".accordion-inner").toggleClass("active"), jQuery(this).parent().parent().find("i").removeClass("fa-minus").addClass("fa-plus")), !1
        })
    });


    /*----------------------------
        window on scroll
     ------------------------------ */
    var winScroll = $(window).scrollTop();
    winScroll > 1 ? $("#to-top").css({
        bottom: "10px"
    }) : $("#to-top").css({
        bottom: "-100px"
    }), $(window).on("scroll", function() {
        winScroll = $(window).scrollTop(), winScroll > 1 ? $("#to-top").css({
            opacity: 1,
            bottom: "30px"
        }) : $("#to-top").css({
            opacity: 0,
            bottom: "-100px"
        })
    }), $("#to-top").on('click',function() {
        return $("html, body").animate({
            scrollTop: "0px"
        }, 800), !1
    }),(new WOW).init();
        
 

     /*----------------------------
        mobile menu script
     ------------------------------ */

        var $dropToggle= $("ul.dropdown-menu [data-toggle=dropdown]"),
            $module=$(".module");
        $dropToggle.on("click", function(event) {
            event.preventDefault();
            event.stopPropagation();
            $(this).parent().siblings().removeClass("open");
            $(this).parent().toggleClass("open");
        });
        $module.on("click",function(){
            $(this).toggleClass("toggle-module");
        });
        $module.find("input.form-control",".btn",".cancel").on("click",function(e) {
            e.stopPropagation();
        });



/* ==========================================================================
     handleContactForm - validate and ajax submit contact form
========================================================================== */

    handleContactForm();
    selectDropdown();

    function handleContactForm() {

        if(typeof $.fn.validate != 'undefined'){

            $('#contact-form').validate({
                errorClass: 'validation-error', // so that it doesn't conflict with the error class of alert boxes
                rules: {
                    name: {
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    subject: {
                        required: true
                    },
                    message: {
                        required: true
                    }
                },
                messages: {
                    name: {
                        required: "Field is required!"
                    },
                    email: {
                        required: "Field is required!",
                        email: "Please enter a valid email address"
                    },
                    subject: {
                        required: "Field is required!"
                    },
                    message: {
                        required: "Field is required!"
                    }
                },
                submitHandler: function(form) {
                    var result;
                    $(form).ajaxSubmit({
                        type: "POST",
                        data: $(form).serialize(),
                        url: "php/send.php",
                        success: function(msg) {

                            if (msg == 'OK') {
                                result = '<div class="alert success"><i class="fa fa-check-circle-o"></i>The message has been sent!</div>';
                                $('#contact-form').clearForm();
                            } else {
                                result = '<div class="alert error"><i class="fa fa-times-circle"></i>' + msg + '</div>';
                            }
                            $("#formstatus").html(result);

                        },
                        error: function() {

                            result = '<div class="alert error"><i class="fa fa-times-circle"></i>There was an error sending the message!</div>';
                            $("#formstatus").html(result);

                        }
                    });
                }
            });

        }

    }


    function selectDropdown () {
        if($(".selectmenu").length) {
            $( ".selectmenu" ).selectmenu();
        };
    }

    
    
})(jQuery);







