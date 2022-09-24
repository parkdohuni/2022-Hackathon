import 'location_class.dart';
// class StoreType {
//   final String id; //해당 도큐먼트의 ID를 담기위함.
//   final String uid;
//   final String name;
//   final String address;
//   final String markerImage = "assets/markers/restaurant.png";
//   final LocationClass location = LocationClass(longitude: 0.0, latitude: 0.0);
//   final double lat;
//   final double lng;
//   final String category;
//   final String starRate;

  // StoreType({
  //   this.uid = '',
  //   this.id = '',
  //   this.name = "",
  //   this.category = "",
  //   this.starRate = "",
  //   this.address = "",
  //   this.lat = 0,
  //   this.lng = 0,
  // });
  // //서버로부터 map형태의 자료를 MessageModel형태의 자료로 변환해주는 역할을 수행함.
  // factory StoreType.fromMap({required String id,required Map<String,dynamic> map}){
  //   return StoreType(
  //     id: id,
  //     name: map['name']??'',
  //     category: map['category']??'',
  //     starRate: map['starRate']??'',
  //     address: map['address']??'',
  //     lat: map['lat']??'',
  //     lng: map['lng']??'',
  //
  //   );
  // }
  // Map<String,dynamic> toMap(){
  //   Map<String,dynamic> data = {};
  //   data['name']=name;
  //   data['category']=category;
  //   data['starRate']=starRate;
  //   data['address']=address;
  //   data['lat']=lat;
  //   data['lng']=lng;
  //   return data;
  // }
// }
class StoreType {
  final String uid = "";
  final String name = "";
  final String address = "";
  final String markerImage = "assets/markers/restaurant.png";
  final LocationClass location = LocationClass(longitude: 0.0, latitude: 0.0);
  final String category = "";
  final String starRate = "";
}

class Info implements StoreType {
  @override
  final String uid;

  @override
  final String address;

  @override
  final String category;

  @override
  final String starRate;

  @override
  final String markerImage = "assets/markers/restaurant.png";

  @override
  final String name;

  @override
  final LocationClass location;

  Info({
    required this.uid,
    required this.name,
    required this.location,
    required this.address,
    required this.category,
    required this.starRate
  });
}


