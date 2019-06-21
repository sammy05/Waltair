<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImagResize.aspx.cs" Inherits="ImageMapEx.ImagResize" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="JS/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <title></title>
    <script>
        var data = {};
        data['area1'] = { 'Name': 'Newyork', 'Url': 'https://www.google.com/', 'Details': [{ 'Freight': 1000, 'Amount': 5000 }, { 'Freight': 2000, 'Amount': 7000 }, { 'Freight': 3000, 'Amount': 15000 }] };
        data['area2'] = { 'Name': 'California', 'Url': 'https://www.apple.com/', 'Details': [{ 'Freight': 1200, 'Amount': 35000 }, { 'Freight': 2100, 'Amount': 17000 }, { 'Freight': 3600, 'Amount': 25000 }] };
        data['area3'] = { 'Name': 'Washington', 'Url': 'https://www.yahoo.com/', 'Details': [{ 'Freight': 1400, 'Amount': 25000 }, { 'Freight': 2500, 'Amount': 72000 }, { 'Freight': 3100, 'Amount': 35000 }] };
        data['area4'] = { 'Name': 'Florida', 'Url': 'https://www.facebook.com/', 'Details': [{ 'Freight': 2600, 'Amount': 95000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };
        data['area5'] = { 'Name': 'Texas', 'Url': 'https://www.twitter.com/', 'Details': [{ 'Freight': 1600, 'Amount': 45000 }, { 'Freight': 2700, 'Amount': 57000 }, { 'Freight': 3900, 'Amount': 45000 }] };

        var zoomFactor = 1.1;
        function zoomin() {
            var myImg = document.getElementById("test");
            var currWidth = myImg.clientWidth;
            if (currWidth >= 2500) return false;
            else {
                myImg.style.width = (currWidth * zoomFactor) + "px";

                $("area").each(function () {
                    var pairs = $(this).attr("coords").split(',');
                    for (var i = 0; i < pairs.length; i++) {
                        pairs[i] = parseFloat(pairs[i]) * zoomFactor;
                    }
                    $(this).attr("coords", pairs.join(','));
                });
            }
        }

        function zoomout() {
            var myImg = document.getElementById("test");
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
            }
        }

        function showModal(areaId) {


            var areaData = data[areaId];
            //var name = areaData.Name;

            $('#modalLinkId').attr('href', areaData.Url);
            $('#modalTitle').text(areaData.Name);
            $('#modalTitle').css('w3-large');

            $('#modalTable tbody').find("tr").remove();
            for (var i = 0; i < areaData.Details.length; i++) {
                var obj = areaData.Details[i];
                var $row = $('<tr>' +
                    '<td>' + obj.Freight + '</td>' +
                    '<td>' + obj.Amount + '</td>' +
                    '</tr>');
                $('#modalTable > tbody:last').append($row);
            }
            $('#myModal').modal('show');
        }

        function showToolTip(areaId) {
            var areaData = data[areaId];
            var name = areaData.Name;
            //var title = '<table><tr><td>This is a test html</td></tr><tr><td>' + areaId + '</td></tr><tr><td>This is a test html row 2</td></tr></table>';
            //var title = name;
            $('#' + areaId).attr('title', name);
            //$('#' + areaId).attr('data-toggle', 'tooltip');
            //$('#' + areaId).attr('data-html', 'true');
            //$('#' + areaId).attr('data-placement', 'right');
            //$('#' + areaId).tooltip('enable')
            //$('#' + areaId).tooltip({ boundary: 'viewport' });
            //$('#' + areaId).tooltip('show');
        }

        $(document).ready(function () {
            //$('area').mouseover(function () {
            //    showToolTip(this.id);
            //});

            $('area').click(function () {
                showModal(this.id);
            });
        })
    </script>
    <style>
        body {
            overflow-x: auto;
        }

        html, body {
            height: 100vh;
            width: 100vw;
            margin: 0;
            padding: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar w3-margin">
            <button type="button" onclick="zoomin()" class="btn btn-secondary">Zoom In</button>
            <button type="button" onclick="zoomout()" class="btn btn-secondary">Zoom Out</button>
        </div>
        <div>
            <img id="test" src="Image/Capture.PNG" usemap="#image-map" <%--width="800px" height="800px"--%> />
            <map name="image-map">
                <area id="area1" target="_blank" coords="235,205,7" shape="circle" />
                <area id="area2" target="_blank" coords="524,288,7" shape="circle" />
                <area id="area3" target="_blank" coords="482,334,7" shape="circle" />
                <area id="area4" target="_blank" coords="710,203,7" shape="circle" />
                <area id="area5" target="_blank" coords="557,504,7" shape="circle" />
            </map>
        </div>
        <div id="myModal" class="modal fade" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h1 class="modal-title" id="modalTitle">Summary</h1>
                    </div>
                    <div class="modal-body">
                        <table id="modalTable" class="table table-striped table-dark">
                            <thead class="w3-green">
                                <tr>
                                    <th>Freight Loaded</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>1000</td>
                                    <td>500000</td>
                                </tr>
                                <tr>
                                    <td>2000</td>
                                    <td>450000</td>
                                </tr>
                                <tr>
                                    <td>2000</td>
                                    <td>450000</td>
                                </tr>
                            </tbody>
                        </table>
                        <a id="modalLinkId" href="https://www.google.com/" target="_blank">Open Dashboard</a>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>--%>
    <script src="JS/imageMapResizer.min.js"></script>
    <script type="text/javascript">
        $('map').imageMapResize();
    </script>
</body>
</html>
