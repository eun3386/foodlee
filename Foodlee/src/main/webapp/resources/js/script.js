var scroll_timer = null;
var top_main_nav = 0;

$(function(){
	$('#main_nav>button').click(function(){
		clearInterval(scroll_timer);
		var data_to = $(this).data('to');

		$('#main_nav>button').removeClass('active');
		$(this).addClass('active');

		if(data_to == '')
			return;
		else if(data_to == 'section_edit')
		{
			$('.main_section').hide();
			$('#section_edit').show();
			$(window).scrollTop(0)
		}
		else
		{
			$('.main_section').show();
			$('#section_edit').hide();

			var target_top = $('#'+data_to).offset().top-$('#main_nav').height()+30;
			var window_top = $(window).scrollTop();
			var distance = target_top - window_top;

			scroll_timer = setInterval(function(){
				var plus = (distance/5) + 1;
				distance -= plus;
				console.log(plus);
				window.scrollBy(0,plus);

				if(Math.abs(plus) <= 1)
					clearInterval(scroll_timer);
			}, 15)
		}

	});

	$(window).scroll(function(){
		if(!$('#main_nav').hasClass('active') && $(window).scrollTop()>$('#main_nav').offset().top)
		{
			top_main_nav = $('#main_nav').offset().top;
			$('#main_nav_spacer').height($('#main_nav').height());
			$('#main_nav').addClass('active');
		}
		else if($('#main_nav').hasClass('active') && $(window).scrollTop()<top_main_nav){
			$('#main_nav_spacer').height('auto');
			$('#main_nav').removeClass('active');
		}
	})
});