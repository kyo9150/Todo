$(function () {
  $('.button').prevAll().hide();
  $('.button').click(function () {
      if ($(this).prevAll().is(':hidden')) {
          $(this).prevAll().slideDown();
          $(this).html('<i class="fas fa-chevron-up"></i>').addClass('close');
      } else {
          $(this).prevAll().slideUp();
          $(this).html('<i class="fas fa-chevron-down"></i>').removeClass('close');
      }
  });
});