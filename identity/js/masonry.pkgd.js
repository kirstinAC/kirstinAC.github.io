// external js: masonry.pkgd.js

$(document).ready( function() {

  $('.grid').masonry({
    itemSelector: '.grid-item',
    columnWidth: 260,
    isFitWidth: true,
	gutter: 25
  });
  
});