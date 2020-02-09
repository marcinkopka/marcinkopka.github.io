// Smooth Scroll
$(function () {
	$('nav a').on('click', function(e) {
    if (this.hash !== '') {
      e.preventDefault();
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(this.hash).offset().top
      }, 1000, function(){
        window.location.hash = hash;
      });
    }
	});
});
