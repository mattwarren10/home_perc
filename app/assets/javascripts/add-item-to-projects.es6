$(document).on("turbolinks:load", function () {
	$('.dropdown-content').hide();
	$('.js-add-item').click(
		function (){
			$('.dropdown-content').toggle();
		})
});


