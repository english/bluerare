$(function() {
  var sliderarrow = $('#slider_arrow');
  var header = $('.slider .container');
  var headerHeight = '404';
  var image = $('.slider img');

  sliderarrow.click(function() {
    if ($(this).hasClass('arrow_up')) {
      image.fadeOut(1000);
      header.animate({ 
        height: '80'
      }, 1000, function() {
        sliderarrow.removeClass("arrow_up").addClass("arrow_down");
      });
    } else {
      image.fadeIn(1000);
      header.animate({ 
        height: headerHeight
      }, 1000, function() {
        sliderarrow.removeClass("arrow_down").addClass("arrow_up");
      });
    }
  });

  sliderarrow.hover(
    function() {
      $(this).animate({
        top: "-8px"
      }, 100 );
    },
    function() {
      $(this).animate({
        top: "-6px"
      }, 100 );
    }
  );
});
