$(document).ready(function(){
    updateDetails();
});

function updateDetails(){
    $("#gallery").empty();
    $("#project-text").empty();
    $.getJSON("/api/v1/projects/"+getUrlParameter("id"),"",function(json){
        var obj = getObjects(json,"id",getUrlParameter("id"));
        for(var i = 0; i < obj[0].images.length; i++) {
            $('#gallery').append(
                    $('<img/>')
                        .attr("src", obj[0].images[i])
                        .attr("alt", "here should be a picture")
                        .addClass("gallery-image")
                    );
        }
        $('#project-text')
            .append(
                $('<h2/>')
                    .addClass("section-header")
                    .text(obj[0].name)
            )
            .append(
                $('<p/>')
                    .text(obj[0].long_desc)
            )
    });
}

function getObjects(obj, key, val) {
    var objects = [];
    for (var i in obj) {
        if (!obj.hasOwnProperty(i)) continue;
        if (typeof obj[i] == 'object') {
            objects = objects.concat(getObjects(obj[i], key, val));
        } else if (i == key && obj[key] == val) {
            objects.push(obj);
        }
    }
    return objects;
}

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
};
