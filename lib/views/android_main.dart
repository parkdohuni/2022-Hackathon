import 'package:flutter/material.dart';
import 'package:hackathon_irang/custom_class/marker_class.dart';
import 'package:hackathon_irang/custom_class/store_class.dart';
import 'package:hackathon_irang/views/components/store_info_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/map_provider.dart';

class AndroidMain extends StatefulWidget {
  AndroidMain({Key? key, required this.mapProvider}) : super(key: key);
  final MapProvider mapProvider;

  @override
  State<AndroidMain> createState() => _AndroidMainState();
}

class _AndroidMainState extends State<AndroidMain> {
  bool _showBottomSheet = false;

  naver.NaverMapController? _ct;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!this.mounted) return;
      this.widget.mapProvider.myMarkers.forEach((CustomMarker marker) {
        marker.createImage(context);
        marker.setOnMarkerTab((naver.Marker marker, Map<String, int> iconSize) async {
          this._showBottomSheet = true;
          this.widget.mapProvider.onTapMarker(marker.markerId);
          await this._ct?.moveCamera(naver.CameraUpdate.scrollTo(marker.position));
          //this._ct?.moveCamera(naver.CameraUpdate.fitBounds(bounds));
        });
      });
    });
    super.initState();
  }
// 마커를 눌렀을때 화면 중앙에 지도가 마커 위치로 이동
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            naver.NaverMap(
              zoomGestureEnable: true,
              initLocationTrackingMode: this.widget.mapProvider.trackingMode,
              initialCameraPosition: naver.CameraPosition(target: this.widget.mapProvider.initLocation),
              locationButtonEnable: true,
              onMapTap: (naver.LatLng ln) {
                setState(() {
                  this._showBottomSheet = false;
                });
              },
              onMapCreated: (naver.NaverMapController ct) {
                this._ct = ct;
              },
              markers: this.widget.mapProvider.myMarkers,

            ),
            this._showBottomSheet
                ? StoreInfoWidget(store: this.widget.mapProvider.selectedStore)
                : Container(),
          ],
        )
    );
  }
}


//
//
// void _onMapCreated(naver.NaverMapController controller) {
//   if (_controller.isCompleted) _controller = Completer();
//   _controller.complete(controller);
// }

