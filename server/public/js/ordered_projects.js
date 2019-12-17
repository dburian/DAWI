$(document).ready(function() {
  updatePage();
});

function updatePage() {
  $.getJSON("/api/v1/projects", function(json) {
    switch (getUrlParameter("order_by")) {
      case "function":
        json.sort(function(a, b) {
          return b.function_id - a.function_id;
        });
        $.each(json, function() {
          if ($("#list_" + this.function_id).length === 0) {
            $("#list_of_lists").append(
              $("<section/>")
                .addClass("ordered-section")
                .append($("<h1/>").text(getFunction(this.function_id)))
                .append(
                  $("<ul/>")
                    .addClass("l-ordered-grid-container")
                    .attr("id", "list_" + this.function_id)
                )
            );
          }
          $("#list_" + this.function_id).append(
            $("<li/>").append(
              $("<a/>")
                .attr("href", "project_detail.html?id=" + this.id)
                .append(
                  $("<div>")
                    .addClass("rect-thumb bw-on-hover")
                    .append(
                      $("<div>")
                        .addClass("rect-shape")
                        .append(
                          $("<div>")
                            .addClass("max-volume")
                            .append(
                              $("<img/>")
                                .attr("src", this.images[0])
                                .addClass("thumb-image")
                            )
                        )
                    )
                    .append(
                      $("<h3/>")
                        .addClass("rect-thumb-header")
                        .text('"' + this.name + '"')
                    )
                )
            )
          );
        });
        break;
      case "status":
        json.sort(function(a, b) {
          return b.status_id - a.status_id;
        });
        $.each(json, function() {
          if ($("#list_" + this.status_id).length === 0) {
            $("#list_of_lists").append(
              $("<section/>")
                .addClass("ordered-section")
                .append($("<h1/>").text(getStatus(this.status_id)))
                .append(
                  $("<ul/>")
                    .addClass("l-ordered-grid-container")
                    .attr("id", "list_" + this.status_id)
                )
            );
          }
          $("#list_" + this.status_id).append(
            $("<li/>").append(
              $("<a/>")
                .attr("href", "project_detail.html?id=" + this.id)
                .append(
                  $("<div>")
                    .addClass("rect-thumb bw-on-hover")
                    .append(
                      $("<div>")
                        .addClass("rect-shape")
                        .append(
                          $("<div>")
                            .addClass("max-volume")
                            .append(
                              $("<img/>")
                                .attr("src", this.images[0])
                                .addClass("thumb-image")
                            )
                        )
                    )
                    .append(
                      $("<h3/>")
                        .addClass("rect-thumb-header")
                        .text('"' + this.name + '"')
                    )
                )
            )
          );
        });
        break;
      default:
        json.sort(function(a, b) {
          return b.year - a.year;
        });
        $.each(json, function() {
          if ($("#list_" + this.year).length === 0) {
            $("#list_of_lists").append(
              $("<section/>")
                .addClass("ordered-section")
                .append($("<h1/>").text(this.year))
                .append(
                  $("<ul/>")
                    .addClass("l-ordered-grid-container")
                    .attr("id", "list_" + this.year)
                )
            );
          }
          $("#list_" + this.year).append(
            $("<li/>").append(
              $("<a/>")
                .attr("href", "project_detail.html?id=" + this.id)
                .append(
                  $("<div>")
                    .addClass("rect-thumb bw-on-hover")
                    .append(
                      $("<div>")
                        .addClass("rect-shape")
                        .append(
                          $("<div>")
                            .addClass("max-volume")
                            .append(
                              $("<img/>")
                                .attr("src", this.images[0])
                                .addClass("thumb-image")
                            )
                        )
                    )
                    .append(
                      $("<h3/>")
                        .addClass("rect-thumb-header")
                        .text('"' + this.name + '"')
                    )
                )
            )
          );
        });
    }
  });
}

function getStatus(status_id) {
  switch (status_id) {
    case 1:
      return "In Construction";
      break;
    case 2:
      return "Planned";
      break;
    default:
      return "Built";
  }
}

function getFunction(function_id) {
  switch (function_id) {
    case 1:
      return "Public Building";
      break;
    case 2:
      return "Residential Building";
      break;
    case 3:
      return "Administration Building";
      break;
    default:
      return "Urbanism";
  }
}

var getUrlParameter = function getUrlParameter(sParam) {
  var sPageURL = window.location.search.substring(1),
    sURLVariables = sPageURL.split("&"),
    sParameterName,
    i;

  for (i = 0; i < sURLVariables.length; i++) {
    sParameterName = sURLVariables[i].split("=");

    if (sParameterName[0] === sParam) {
      return sParameterName[1] === undefined
        ? true
        : decodeURIComponent(sParameterName[1]);
    }
  }
};
