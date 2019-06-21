var modalSkeleton = '<div id="myModal" class="modal fade" role="dialog">'
    + '<div id="modalDialog" class="modal-dialog modal-lg w3-card-4"  style="overflow:auto">'
    + '<div class="modal-content">'
    + '<div class="modal-header" style="background-color:#3b5998">'
    + '<button type="button" class="close w3-text-white" data-dismiss="modal">&times;</button>'
    + '<h1 class="modal-title w3-text-white"  id="modalTitle">Summary</h1>'
    + '</div>'
    + '<div class="modal-body">'
    + '<table id="modalTable" class="table table-striped table-bordered table-hover table-condensed">'
    + '<thead class="w3-green">'
    + '<tr>'
    + '<th>Name</th>'
    + '<th>Value</th>'
    + '</tr>'
    + '</thead>'
    + '<tbody>'
    + '</tbody>'
    + '</table>'
    //      + '<a id="modalLinkId" href="https://www.google.com/" target="_blank">Open Dashboard</a>'
    + '</div>'
    + '<div class="modal-footer">'
    + '<button type="button" class="btn btn-default w3-hover-red" data-dismiss="modal">Close</button>'
    + '</div>'
    + '</div>'
    + '</div>'
    + '</div>';



function showModal(areaId) {
    if (!dataPresent)
        return;
    var areaData = data[areaId];
    //$('#modalLinkId').attr('href', areaData.Url);
    var name = $('#' + areaId).attr('title');
    $('#modalTitle').text(getStringInProperCase(name));
    $('#modalTitle').css('w3-large');
    $('#modalTable > thead').find('tr').remove();
    $('#modalTable tbody').find("tr").remove();
    //for (var i = 0; i < areaData.Details.length; i++) {
    //    var obj = areaData.Details[i];
    //    if (obj.Freight == -1 || obj.Amount == -1)
    //        continue;
    //    var $row = $('<tr>' +
    //        '<td>' + obj.Freight + '</td>' +
    //        '<td>' + obj.Amount + '</td>' +
    //        '</tr>');
    //    $('#modalTable > tbody:last').append($row);
    //}
    Object.keys(areaData).forEach(function (key) {
        console.table('Key : ' + key + ', Value : ' + areaData[key]);
        if (key === "Color") { }
        else {
            var $row = $('<tr>' +
                '<td>' + key + '</td>' +
                '<td>' + areaData[key] + '</td>' + '</tr>');
            $('#modalTable > tbody:last').append($row);
        }
    })

    $('#myModal').modal('show');
}

function showModalWithHeader(areaId) {
    var areaData = data[areaId];
    var name = $('#' + areaId).attr('title');
    $('#modalTitle').text(getStringInProperCase(name));
    $('#modalTitle').css('w3-large');

    $('#modalTable > thead').find('tr').remove();
    var temp = '<tr>';
        temp += ('<th>S No</th>');
    for (var i = 0; i < header.length; i++) {
        //temp += ('<th style="text-align:left">' + header[i] + '</th>');
        temp += ('<th>' + header[i] + '</th>');

    }
    temp += '</tr>';
    //var $row = $(temp);
    $('#modalTable > thead:last').append($(temp));

    $('#modalTable tbody').find("tr").remove();

    for (var i = 0; i < areaData.Data.length; i++) {
        var tempData = areaData.Data[i];
        var temp = '<tr>';
        temp += ('<td>' + (i+1) + '</td>');
        Object.keys(tempData).forEach(function (key) {
            //console.table('Key : ' + key + ', Value : ' + tempData[key]);
            if (key === "Color") { }
            else {
                if (isNaN(tempData[key]))
                    temp += ('<td>' + tempData[key] + '</td>');
                else
                    temp += ('<td>' + tempData[key] + '</td>');
            } // style="text-align:left"
        })
        temp += '</tr>';
        //var $row = $(temp);
        $('#modalTable > tbody:last').append($(temp));
    }

    $('#myModal').modal('show');
}

$(document).ready(function () {
    $('#form1').append(modalSkeleton);

});

function getStringInProperCase(str) {
    return str.replace(
        /\w\S*/g,
        function (txt) {
            return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();
        }
    );
}