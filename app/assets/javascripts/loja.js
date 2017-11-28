$(function () {

	var counter = 2;
	$(".2, .3, .4").hide();
	setInterval(mudaImg, 5000);

	function mudaImg() {
		if (counter == 5) {
			$('.1').show();
			$('button[data="1"]').css('background', 'silver');
			$('button[data="4"]').css('background', 'goldenrod');
			$(".2, .3, .4").hide();
			counter = 2;
		} else {
			$('.1').hide();
			$(".".concat(counter)).show();
			$('button').css('background', 'goldenrod');
			$("button[data=\"".concat(counter, "\"]")).css('background', 'silver');
			counter++;
		}
	}

	$("button").click(function() {
		$(".1, .2, .3, .4").hide();
		var e = $(this).attr("data");
		$(".".concat(e)).show();
		$('button').css('background', 'goldenrod');
		$(this).css('background', 'silver');
		counter = e;
	});

	$('img').click(function() {
	  $(this).parent().children('h3').children('a').click();		
	});
	
});
