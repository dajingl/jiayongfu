$(document).on('turbolinks:load', function () {
  if ($('.about-us').length > 0) {
    setTimeout(function () {
      $('.loading-bg').css('display', 'none')
    }, 2000)
  }
});