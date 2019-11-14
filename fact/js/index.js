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
                            .addClass("square-view grey-on-hover")
                            .append($('<img/>')
                                .addClass("square-view-image l-square-grid-sized")
                                .attr("src", 'images/'+this.images[0])
                                .attr("alt", "here should be a picture"))
                            .append($('<h3>')
                                .addClass("square-view-header")
                                .text(this.name))
                        )));
        })
    });
}