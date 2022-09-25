import 'location_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'marker_class.dart';

// class StoreType {
//   // 사용되는 자료형
//   String? address;
//   String? category;
//   double? lat;
//   double? lng;
//   String? name;
//   int? starRate;
//   String? uid;
//   DocumentReference? reference;
//   final LocationClass location = LocationClass(longitude: 0.0, latitude: 0.0);
//   //생성자
//   StoreType({
//     this.address,
//     this.category,
//     this.lat,
//     this.lng,
//     this.name,
//     this.starRate,
//     this.uid,
//     this.reference,
//   });
//
//   //json => Object로, firestore에서 불러올때
//   StoreType.fromJson(dynamic json, this.reference) {
//     address = json['address'];
//     category = json['category'];
//     lat = json['lat'];
//     lng = json['lng'];
//     name = json['name'];
//     starRate = json['starRate'];
//     uid = json['uid'];
//   }
//
//   // Named Constructor with Initializer
//   // fromSnapShot Named Constructor로 snapshot 자료가 들어오면 이걸 다시 Initializer를 통해
//   // fromJson Named Constructor를 실행함
//   // DocumentSnapshot 자료형을 받아 올때 사용하는 Named Constructor
//   // 특정한 자료를 받아 올때 사용한다.
//   StoreType.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
//       : this.fromJson(snapshot.data(), snapshot.reference);
//
//   // Named Constructor with Initializer
//   // 컬렉션 내에 특정 조건을 만족하는 데이터를 다 가지고 올때 사용한다.
//   StoreType.fromQuerySnapshot(
//       QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
//       : this.fromJson(snapshot.data(), snapshot.reference);
//
//   get markerImage => "assets/markers/restaurant.png";
//
//   //Object => json, firestore에 저장할때
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['address'] = address;
//     map['category'] = category;
//     map['lat'] = lat;
//     map['lng'] = lng;
//     map['name'] = name;
//     map['starRate'] = starRate;
//     map['uid'] = uid;
//     return map;
//   }
// }

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
//
//   StoreType({
//     this.uid = '',
//     this.id = '',
//     this.name = "",
//     this.category = "",
//     this.starRate = "",
//     this.address = "",
//     this.lat = 0,
//     this.lng = 0,
//   });
//   //서버로부터 map형태의 자료를 MessageModel형태의 자료로 변환해주는 역할을 수행함.
//   factory StoreType.fromMap({required String id,required Map<String,dynamic> map}){
//     return StoreType(
//       id: id,
//       name: map['name']??'',
//       category: map['category']??'',
//       starRate: map['starRate']??'',
//       address: map['address']??'',
//       lat: map['lat']??'',
//       lng: map['lng']??'',
//
//     );
//   }
//   Map<String,dynamic> toMap(){
//     Map<String,dynamic> data = {};
//     data['name']=name;
//     data['category']=category;
//     data['starRate']=starRate;
//     data['address']=address;
//     data['lat']=lat;
//     data['lng']=lng;
//     return data;
//   }
// }

//원래 코드
class StoreType {
  final String uid = "";
  final String name = "";
  final String address = "";
  final String markerImage = "assets/markers/icon.png";
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
  final String markerImage = "assets/markers/icon.png";

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


