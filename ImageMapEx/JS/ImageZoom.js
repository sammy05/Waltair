var zoomFactor = 1.20;

function zoomin() {
    var myImg = document.getElementById("mainImg");
    var currWidth = myImg.clientWidth;
    if (currWidth >= 5000) return false;
    else {
        myImg.style.width = (currWidth * zoomFactor) + "px";

        $("area").each(function () {
            var pairs = $(this).attr("coords").split(',');
            for (var i = 0; i < pairs.length; i++) {
                pairs[i] = parseFloat(pairs[i]) * zoomFactor;
            }
            $(this).attr("coords", pairs.join(','));
        });
        $('#canvas').remove();
        setColor(0);
    }
}

function zoomout() {
    var myImg = document.getElementById("mainImg");
    var currWidth = myImg.clientWidth;
    if (currWidth <= 400) return false;
    else {
        myImg.style.width = (currWidth / zoomFactor) + "px";
        $("area").each(function () {
            var pairs = $(this).attr("coords").split(',');
            for (var i = 0; i < pairs.length; i++) {
                pairs[i] = parseFloat(pairs[i]) / zoomFactor;
            }
            $(this).attr("coords", pairs.join(','));
        });
        $('#canvas').remove();
        setColor(0);
    }
}

var rotCount = 0;
function rotateClockWise() {
    var rotationDegrees = (++rotCount) * 45;
    $("#mainImg").css({ 'transform': 'rotate(' + rotationDegrees + 'deg)' });
    $('#canvas').remove();
    setColor(rotationDegrees);
}

function rotateCounterClockWise() {
    var rotationDegrees = (--rotCount) * 45;
    $("#mainImg").css({ 'transform': 'rotate(' + rotationDegrees + 'deg)' });
    $('#canvas').remove();
    setColor(rotationDegrees);
}

function rotateCanvas(degrees) {
    var cnvs = document.getElementById("canvas");
    var ctx = cnvs.getContext("2d");
    ctx.rotate(degrees * Math.PI / 180);
}


function setColor(rotateBy) {
    var img = document.getElementById("mainImg");
    //var cnvs = document.getElementById("canvas");

    $('<canvas>').attr({
        id: 'canvas'
    }).prependTo('#imageDiv');

    var cnvs = document.getElementById("canvas");
    cnvs.style.position = "absolute";
    cnvs.style.zIndex = 1;
    cnvs.style.left = img.offsetLeft + "px";
    cnvs.style.top = img.offsetTop + "px";
    cnvs.setAttribute('width', img.clientWidth + 'px');
    cnvs.setAttribute('height', img.clientHeight + 'px');
    rotateCanvas(rotateBy);

    var radius = 5;
    $('.activeMap > area.activePoint').each(function () {
        var coords = $(this).attr('coords').split(',');
        var id = $(this).attr('id');
        if (data[id] != undefined) {
            var color = data[id].Color;
            var x = coords[0];
            var y = coords[1];
            var r = coords[2];
            drawCoordinates(x, y, r, color);
            radius = r;
        }
    })

    $('.activeMap > area.inactivePoint').each(function () {
        var coords = $(this).attr('coords').split(',');
        coords[2] = 0;
        var color = "#000";
        var x = coords[0];
        var y = coords[1];
        $(this).attr("coords", coords.join(','));
        drawCoordinates(x, y, radius/1.20, color);
    })
}

function drawCoordinates(x, y, r, color) {
    var pointSize = r*1.1; // Change according to the size of the point.
    var ctx = document.getElementById("canvas").getContext("2d");
    ctx.fillStyle = color; // color
    ctx.beginPath(); //Start path
    // Draw a point using the arc function of the canvas with a point structure.
    ctx.arc(x, y, pointSize, 0, Math.PI * 2, true);
    ctx.fill(); // Close the path and fill.
}

function reset() {
    window.location.reload();
}

var fullScreenToggle = true;

//&#9776;
var buttons =
    '<button id="toggleBtn" type="button" onclick="toggle()"><i class="fa fa-caret-left"></i></button>'
    + '<button type="button" onclick="zoomin()" class="toggle" ><i class="fa fa-search-plus"></i></button>'
    + '<button type="button" onclick="zoomout()" class="toggle"><i class="fa fa-search-minus"></i></button>'
    // + '<button type="button" onclick="rotateClockWise()" class="toggle">Rotate Clockwise</button>'
    // + '<button type="button" onclick="rotateCounterClockWise()" class="toggle">Rotate Counter Clockwise</button>'
    + '<button type="button" onClick="document.location.reload(true)" class="toggle"><i class="fa fa-repeat"></i></button>'
    + '<button id="controlBtn" type="button" onClick="hidebars()" class="toggle"><i class="fa fa-arrows-alt"></i></button>';

function hidebars() {
    if (fullScreenToggle) {
        $('#navbarId').hide(400);
        //$('#divSideBar').hide(400);
        $('#controlBtn > i').removeClass("fa-arrows-alt").addClass("fa-compress");
        document.getElementById("form1").style.marginLeft = "0%";
        document.getElementById("imageDiv").style.marginLeft = "0%";
        document.getElementById("imageDiv").style.marginTop = "0%";

        [...Array(3).keys()].forEach(function (i) {
            zoomin();
        });
        //document.getElementById("imageDiv").style.marginLeft = "5%";
        //document.getElementById("imageDiv").style.marginTop = "0%";
        //document.getElementById("form1").style.marginTop = "0%";
    } else {
        $('#navbarId').show(600);
        //$('#divSideBar').show(400);
        $('#controlBtn > i').removeClass("fa-compress").addClass("fa-arrows-alt");
        document.getElementById("form1").style.marginLeft = "15%";
        document.getElementById("imageDiv").style.marginLeft = "15%";
        document.getElementById("imageDiv").style.marginTop = "5%";
        [...Array(3).keys()].forEach(function (i) {
            zoomout();
        });
        //document.getElementById("imageDiv").style.marginLeft = "0%";
    }

    fullScreenToggle = !fullScreenToggle;
}

//var filterButtons =
//    //'<button type="button">&#9776;</button>' + 
//    '<button type="button" class="filter">Corporate</button>'
//    + '<button type="button" class="filter">Corporate1</button>'
//    + '<button type="button" class="filter">Corporate2</button>'
//    + '<button type="button" class="filter">Retail</button>';



$(document).ready(function () {
    //$('#buttonDiv').append(buttons);
    //toggle();
    //$('#filterDiv').append(filterButtons);
    $(':button').addClass("btn w3-hover-green btn-outline-primary");

    //$('.filter').click(function () {
    //    $('.filter').removeClass("w3-blue");
    //    $('.filter').addClass("w3-hover-green");
    //    $(this).removeClass("w3-hover-green");
    //    $(this).addClass("w3-blue");
    //});
});

var visible = true;
function toggle() {
    if (visible) {
        $('#toggleBtn > i').removeClass("fa-caret-left").addClass("fa-caret-right");
        $('.toggle').hide();
    }
    else {
        $('#toggleBtn > i').removeClass("fa-caret-right").addClass("fa-caret-left");
        $('.toggle').show();
    }
    visible = !visible;
}

var localShrinkFactor = 1;
var originalImageWidth = 100;
function setInitialState(shrinkFactor, pageLoad) {
    localShrinkFactor = shrinkFactor;
    var width = $(window).width() * shrinkFactor;
    var factor = 1;
    if (pageLoad) {
        originalImageWidth = mainImg.clientWidth;
        var currWidth = mainImg.clientWidth;
        factor = width / currWidth;
        mainImg.style.width = (currWidth * factor) + "px";
    }
    else {
        var factor = mainImg.clientWidth / originalImageWidth;
    }
    $("area").each(function () {
        var pairs = $(this).attr("coords").split(',');
        for (var i = 0; i < pairs.length; i++) {
            pairs[i] = parseFloat(pairs[i]) * factor;
        }
        $(this).attr("coords", pairs.join(','));
    });
    $('#canvas').remove();
    setColor(0);
}

//$(window).resize(function () {
    //setInitialState(localShrinkFactor,true);
//});





