// Place your application-specific JavaScript functions and classes here
$(document).ready(function() {
	$('.velg-summary').bind('click', function() { 
		var position = $(this).position().top;
		var rightpos = $('.panel').position().top ;
		//alert(jump) ; 
		$(".active").toggleClass("active") ;
		$(this).toggleClass("active") ;  
    		$.ajax({
			  url: $(this).attr("id"),
			  success: function(data){
			    $(".panel").html(data);
			    $(".single_image").fancybox({'cyclic':true, 'showNavArrows':true,'padding':'50'});
			  }
			});  
	});  


	var oldpos = 0 ;
	$(".panel").css({"height": $(window), "overflow-y": "auto"}) ;
	$(".velgen-left").css("min-height", $(window)) ;
	/* This is basic - uses default settings */
	$(".single_image").fancybox({'cyclic':true, 'showNavArrows':true,'padding':'50'});
	$(".selected").parent().show() ;
	$(".velg-summary").first().toggleClass("active");
	

	$('.velg-summary').click(function()
		{
		var id= $(this).attr('id'); // .block ID
		var data_id= $(".data").html(); // .data DIV value
		var panel= $('.panel');
		var panel_width=$('.panel').css('velgen-left'); // rolling panel width


		if(data_id==id)
		{
			// Rolling Animation
			panel.animate({right: parseInt(panel.css('velgen-left'),0) == 0 ? +panel.outerWidth() : 0});
		}
		else
		{
			// panel width CSS width:340px + border:1px = 341px
		if(panel_width=='496px')
			{
			// No rolling animation
			}
			else
			{
			// Rolling Animation
			panel.animate({left: parseInt(panel.css('velgen-left'),0) == 0 ? +panel.outerWidth() : 0});
			}
		}
		// passing id value to <div class='data'$gt; </div>
		$('.data').html(id);
		return false;
		});

		// panel close link
	$('.close').click(function()
	{
		var panel= $('.panel');
		panel.animate({left: parseInt(panel.css('velgen-left'),0) == 0 ? +panel.outerWidth() : 0});
		return false;
	});
	/*$(".expandable").parent().mouseover(function(){
		$(this).children().show() ;
    	});
	$(".expandable").parent().mouseout(function(){
		if(!($(".expandable").parent().attr("class")=="selected")) {
	      		$(".expandable").hide() ;
		}
   	});*/

	$("#language-selector").mouseover(function(){
		$(".nf").toggleClass("ff") ;
    	});
	$("#language-selector").mouseout(function(){
		$(".nf").toggleClass("ff") ;
   	});

   	        $(window).scroll(function () { 
	var dif = $('.panel').parent().offset().top-$(window).scrollTop() ;
	var bottomdif = parseInt($(".panel").css('marginTop').replace(/[A-Za-z$-]/g, "")) + $(".panel").height()-$(".panel").height() ;
	//alert(bottomdif) ;
	if((bottomdif<0)||(oldpos - $(window).scrollTop() > 0)) 
	{
	if(dif<0)
	{
			var maxmove = $(".panel").height() - $(".panel").height() ;
			//alert(maxmove) ;
			var tomove = 5-dif ;
			//alert(5-dif) ;
			if(5-dif > maxmove)
			{
				tomove = maxmove ;
			}
			//alert(tomove) ;
			$('.panel').stop().animate({
			     marginTop: tomove

			    }, "slow", function() {

			    });
	} else {
			$('.panel').stop().animate({
			     marginTop: 8

			    }, "slow", function() {

			    });
	}		}
	oldpos = $(window).scrollTop() ;
        });
});