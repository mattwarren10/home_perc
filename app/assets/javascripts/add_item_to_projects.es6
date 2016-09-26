$(document).on("turbolinks:load", function () {
	$('.dropdown-content').hide();
	$('.js-add-item').hover(
		function (){
			$('.dropdown-content').show();
		},
		function () {
			$('.dropdown-content').hide();
		})

	// Close the dropdown menu if the user clicks outside of it
	// window.onclick = function(event) {
	//   if (!event.target.matches('.dropbtn')) {

	//     var dropdowns = document.getElementsByClassName("dropdown-content");
	//     var i;
	//     for (i = 0; i < dropdowns.length; i++) {
	//       var openDropdown = dropdowns[i];
	//       if (openDropdown.classList.contains('show')) {
	//         openDropdown.classList.remove('show');
	//       }
	//     }
	//   }
	// }
});


