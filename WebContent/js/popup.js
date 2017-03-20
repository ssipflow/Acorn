window.onload = function() {
	$('.btn_layerpopup').on('click', function(e) {
		e.preventDefault();
		var el = $($(this).attr('href'));
		if (!el.hasClass('open')) {
			el.addClass('open');
		} else {
			el.removeClass('open');
		}
	});

	$('.btn_close_layer').on('click', function(e) {
		$(this).closest('.layer-popup').removeClass('open');
	});
}