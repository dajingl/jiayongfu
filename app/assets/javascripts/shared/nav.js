$(document).on('turbolinks:load', function () {

   $("#btn-close").on('click',function () {
       console.log(1)
       if ($(this).attr("class") === "open") {
           $(this).attr("class", "close-x");
           $(".right").removeClass("visible-md visible-lg");
       } else {
           $(this).attr("class", "open");
           $(".right").addClass("visible-md visible-lg");
       }

   })

});
