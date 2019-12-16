$(document).ready(function() {
  $("#architects_list").empty();
  $.getJSON("json/projects.json", "", function(json) {
    $.each(json, function() {
      $.each(this.architects, function() {
        $("#architects_list").append($("<h3/>").text(this));
      });
    });
  });

  $("#description_grid").empty();
  $.getJSON("json/about_us.json", "", function(json) {
    $("#description_grid").append($("<p/>").text(json.description));
    $("#description_grid").append($("<p/>").text(json.description));
  });

  $("#leading_architects_article").empty();
  $.getJSON("json/about_us.json", "", function(json) {
    $.each(json.leading_architects, function() {
      $("#leading_architects_article").append(
        $("<div/>")
          .append(
            $("<div/>")
              .addClass("leader-arch-thumb-wrapper")
              .append(
                $("<div/>")
                  .addClass("square-thumb")
                  .append(
                    $("<div/>")
                      .addClass("square-shape")
                      .append(
                        $("<div/>")
                          .addClass("max-volume")
                          .append(
                            $("<img/>")
                              .addClass("thumb-image")
                              .attr("src", "images/" + this.img)
                          )
                      )
                  )
                  .append(
                    $("<h3>")
                      .addClass("square-thumb-header")
                      .text(this.name)
                  )
              )
          )
          .append(
            $("<p/>")
              .addClass("leader-arch-desc")
              .text(this.description)
          )
      );
    });
  });
});
