$(document).on('turbolinks:load', function () {
    var footerFun = function () {
        var windowH = $(window).height();
        var bodyH = $('body').height();
        var htmlH = $('html').height();
        var $diff = htmlH - bodyH;
        var $footer = $('.footer');
        if (windowH > htmlH || windowH === htmlH) {
            $footer.css('position', 'fixed');
        } else {
            $footer.css('position', 'relative');
        }
        if ($diff < 0) {
            $footer.css('position', 'relative');
        } else if ($diff > 0 && $diff < 198) {
            $footer.css('position', 'relative');
        }
    };
    footerFun();

});
