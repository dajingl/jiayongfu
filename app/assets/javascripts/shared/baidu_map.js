$(document).on('turbolinks:load', function () {
    if ($('.baidu-map-js').length > 0) {
        var exhibitionsAddress = $('.exhibitions-address').text();
        var map = new BMap.Map('exhibitionMap');
        map.centerAndZoom(exhibitionsAddress, 12);
        var localSearch = new BMap.LocalSearch(map);

        map.clearOverlays();//清空原来的标注
        var keyword = exhibitionsAddress;
        localSearch.setSearchCompleteCallback(function (searchResult) {
            var poi = searchResult.getPoi(0);
            map.centerAndZoom(poi.point, 14);//把该目标地址显示到地图中心
            var marker = new BMap.Marker(new BMap.Point(poi.point.lng, poi.point.lat));  // 创建标注，为要查询的地方对应的经纬度
            map.addOverlay(marker);//把标注添加到地图中
            var infoWindow = new BMap.InfoWindow('<p class=\'addr-info\' style=\'font-size:13px;\'>' + exhibitionsAddress + '</p>');
            marker.addEventListener('click', function () {
                this.openInfoWindow(infoWindow);
            });
        });
        localSearch.search(keyword);

        $('.look-map').attr('href', 'http://api.map.baidu.com/geocoder?address=' + exhibitionsAddress + '&output=html&src=西安旗讯网络|墨客');
    }
});

