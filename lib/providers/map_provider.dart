import 'package:flutter/foundation.dart';
import 'package:hackathon_irang/service/location_service.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' show LocationTrackingMode;

import '../custom_class/location_class.dart';
import '../custom_class/marker_class.dart';
import '../custom_class/store_class.dart' show StoreType;
import '../practice_data.dart';

class MapProvider with ChangeNotifier {
  final LocationService _locationService = LocationService();
  final LocationClass initLocation = LocationService.initLocation;

  final List<CustomMarker> myMarkers = PracticeData.myMarkers();

  MapProvider(){
    Future(setCurrentLocation);
  }

  StoreType? _selectedStore;
  StoreType? get selectedStore => _selectedStore;
  set selectedStore(StoreType? s) => throw "error";

  LocationTrackingMode _trackingMode = LocationTrackingMode.None;
  LocationTrackingMode get trackingMode => _trackingMode;
  set trackingMode(LocationTrackingMode m) => throw "error";

  Future<void> setCurrentLocation() async {
    if (await _locationService.canGetCurrentLocation()){
      _trackingMode = LocationTrackingMode.Follow;
      notifyListeners();
    }
  }

  void onTapMarker(String uid){
    final StoreType store = PracticeData.myStores.firstWhere((StoreType s) => s.uid == uid);
    _selectedStore = store;
    notifyListeners();
  }

}