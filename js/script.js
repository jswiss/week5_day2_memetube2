$(document).ready(function() {
	console.log('I am tired');


getVideos();

});


function getVideos() {
	//AJAX request to get videos
	request('GET', '/videos', null).done(function(response) {
		console.log(response);
	})
}