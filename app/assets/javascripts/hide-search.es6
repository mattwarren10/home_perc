$(document).on("turbolinks:load", function () {
	if ($('.log-out').text() === "Log out") {
		$('.search-form').show();
	}

	else if ($('.log-in').text() === "Log in") {
		$('.search-form').toggle();
	}

});


