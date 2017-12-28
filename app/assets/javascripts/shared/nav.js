$(document).on('turbolinks:load', function () {

   $("#btn-close").on('click',function () {
       console.log(1)
       if ($(this).attr("class") === "open") {
           $(this).attr("class", "close-x");
       } else {
           $(this).attr("class", "open");
       }

   })

});
