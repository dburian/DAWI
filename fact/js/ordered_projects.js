$(document).ready(function(){
    updatePage()
});

function updatePage() {
    $("#list_2017").empty();
    $("#list_2018").empty();
    $("#list_2019").empty();
    $.getJSON("json/projects.json", function (json) {
        $.each(json, function () {
            $('#list_'+this.year)
                .append(
                    $('<li/>')
                        .append(
                            $('<a/>')
                                .attr("href", "project_detail.html?id=" + this.id)
                                .append(
                                    $('<div>')
                                        .addClass("rect-thumb bw-on-hover")
                                        .append(
                                            $('<div>')
                                                .addClass("rect-shape")
                                                .append(
                                                    $('<div>')
                                                        .addClass("max-volume")
                                                        .append(
                                                            $('<img/>')
                                                                .attr("src", "images/" + this.images[0])
                                                                .addClass("thumb-image")
                                                        )
                                                )
                                        )
                                        .append(
                                            $('<h3/>')
                                                .addClass("rect-view-header")
                                                .text('"' + this.name + '"')
                                        )
                                )
                        )
                )
        })
    });
}
/*
                        <li>
                            <a href="project_detail.html">
                                <div class="rect-thumb bw-on-hover">
                                    <div class="rect-shape">
                                        <div class="max-volume">
                                            <img src="images/apartments_2019_a.jpg"
                                                 class="thumb-image"/>
                                        </div>
                                    </div>

                                    <h3 class="rect-thumb-header">Public building</h3>
                                </div>
                            </a>
                        </li>*/
