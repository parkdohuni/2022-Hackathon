import 'package:geolocator/geolocator.dart';

import '../custom_class/location_class.dart';

class LocationService {
  static const LocationClass initLocation = LocationClass(latitude: 35.88994, longitude: 128.61091);

  Future<LocationPermission> hasLocationPermission() async => await Geolocator.checkPermission();

  Future<bool> isLocationEnabled() async => await Geolocator.isLocationServiceEnabled();

  Future<LocationPermission> requestLocation() async => await Geolocator.requestPermission();

  Future<LocationClass> currentLocation() async {
    final Position position = await Geolocator.getCurrentPosition();
    return LocationClass(latitude: position.latitude, longitude: position.longitude);
  }

  Future<bool> canGetCurrentLocation() async {
    final LocationPermission permission = await this.hasLocationPermission();
    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      final bool enabled = await this.isLocationEnabled();
      if (enabled) return true;
    }
    return false;
  }
}

