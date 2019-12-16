$(document).ready(function() {
  $("#branches_list").empty();
  $("#phone_label").empty();
  $("#info_mail_label").empty();
  $("#business_mail_label").empty();
  $("#insta_label").empty();
  $.getJSON("json/contacts.json", function(json) {
    $.each(json.branches, function() {
      $("#branches_list").append(
        $("<li/>")
          .addClass("contacts-article-list-item")
          .append(
            $("<h3/>")
              .addClass("contacts-article-list-item-header")
              .text(this.name)
          )
          .append(
            $("<p/>")
              .append(this.address_1)
              .append($("<br/>"))
              .append(this.address_2)
              .append($("<br/>"))
              .append(this.address_3)
          )
      );
    });
    $("#phone_label").text(json.phone_number);
    $("#info_mail_label").text(json.info_mail);
    $("#business_mail_label").text(json.business_mail);
    $("#insta_label").text(json.insta_link);
  });
});
