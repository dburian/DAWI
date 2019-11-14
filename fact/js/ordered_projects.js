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
                                        .addClass("rect-view grey-on-hover")
                                        .append(
                                            $('<img/>')
                                                .attr("src", "images/" + this.images[0])
                                                .attr("alt", '"' + this.name + '"')
                                                .addClass("rect-view-image l-rect-grid-sized")
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
                                <div class="rect-view grey-on-hover">
                                    <img src="images/apartments_2019_a.jpg"
                                         alt="Public building"
                                         class="rect-view-image l-rect-grid-sized" />
                                    <h3 class="rect-view-header">Public building</h3>
                                </div>
                            </a>
                        </li>*/
