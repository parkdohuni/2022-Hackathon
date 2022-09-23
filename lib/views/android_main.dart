import 'package:flutter/material.dart';
import 'package:hackathon_irang/custom_class/marker_class.dart';
import 'package:hackathon_irang/views/components/store_info_widget.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' as naver;

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
      if (!mounted) return;
      widget.mapProvider.myMarkers.forEach((CustomMarker marker) {
        marker.createImage(context);
        marker.setOnMarkerTab((naver.Marker marker, Map<String, int> iconSize) async {
          _showBottomSheet = true;
          widget.mapProvider.onTapMarker(marker.markerId);
          await _ct?.moveCamera(naver.CameraUpdate.scrollTo(marker.position));
          //this._ct?.moveCamera(naver.CameraUpdate.fitBounds(bounds));
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            naver.NaverMap(

              zoomGestureEnable: true,
              initLocationTrackingMode: widget.mapProvider.trackingMode,
              initialCameraPosition: naver.CameraPosition(target: widget.mapProvider.initLocation),
              locationButtonEnable: true,
              onMapTap: (naver.LatLng ln) {
                setState(() {
                  _showBottomSheet = false;
                });
              },
              onMapCreated: (naver.NaverMapController ct) {
                _ct = ct;
              },
              markers: widget.mapProvider.myMarkers,

            ),
            _showBottomSheet
                ? StoreInfoWidget(store: widget.mapProvider.selectedStore)
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

