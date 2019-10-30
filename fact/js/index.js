$(document).ready(function(){
    $("#project-list").empty();
    $.getJSON("json/projects.json",function(json){
        $.each(json,function () {
            $('#project-list').append('<li><a href="project_detail.html"><div class="square-view grey-on-hover"><img src="images/'+this.images[0]+'" class="square-view-image l-square-grid-sized"/><h3 class="square-view-header">'+this.name+'</h3></div></a></li>');
        })
    });
});