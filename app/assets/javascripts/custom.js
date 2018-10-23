$(document).ready(function(){
  if ($(".area-rate").length > 0) {
    $(".fa-star").click(function(){
      point = $(this).data("point")
      for (i = 1; i <= 5; i--) {
        $(".fa-star-" + i).css("color","#333333")
      }
      for (var i = 1; i <= point; i++) {
        $(".fa-star-" +i).css("color", "orage")
      }
      if ($("#rating_point").length == 1) {
        $("#rating_point").val(point)
      }
    })
  }
});
