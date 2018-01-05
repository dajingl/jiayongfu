$(document).on('turbolinks:load', function () {
    var footerFun = function () {
        var windowH = $(window).height();
        var bodyH = $('body').height();
        var $diff = windowH - bodyH;
        var $footer = $('.footer');
     console.log(windowH ,'-----', bodyH , $diff)
        if ($diff < 188) {
            $footer.css('position', 'relative');
        } else if ($diff > 188) {
            $footer.css('position', 'fixed');
        }
    };
    footerFun();

});
