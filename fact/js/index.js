$(document).ready(function(){
    updatePage()
});

function updatePage(){
    $("#project-list").empty();
    $.getJSON("json/projects.json",function(json){
        $.each(json,function () {
            $('#project-list').append(
                $('<li/>')
                    .append($('<a/>')
                        .attr("href", "project_detail.html?id="+this.id)
                        .append($('<div/>')
                            .addClass("square-thumb bw-on-hover")
                            .append($('<div/>')
                                .addClass("square-shape")
                                .append($('<div/>')
                                    .addClass("max-volume")
                                    .append($('<img/>')
                                        .addClass("thumb-image")
                                        .attr("src", 'images/'+this.images[0])
                                        .attr("alt", "here should be a picture"))))
                            .append($('<h3>')
                                .addClass("square-thumb-header")
                                .text(this.name))
                        )));
        })
    });
}