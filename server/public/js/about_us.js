$(document).ready(function(){

    $("#architects_list").empty();
    $.getJSON("json/projects.json","",function(json){
        $.each(json,function () {
            $.each(this.architects, function(){
                $('#architects_list').append(
                    $('<h3/>')
                        .text(this)
                );
            })
        })
    });
});