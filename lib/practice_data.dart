import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'custom_class/location_class.dart';
import 'custom_class/marker_class.dart';
import 'custom_class/store_class.dart';
//
// class PracticeData {
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
//   PracticeData({
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
//   PracticeData.fromJson(dynamic json, this.reference) {
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
//   PracticeData.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> snapshot)
//       : this.fromJson(snapshot.data(), snapshot.reference);
//
//   // Named Constructor with Initializer
//   // 컬렉션 내에 특정 조건을 만족하는 데이터를 다 가지고 올때 사용한다.
//   PracticeData.fromQuerySnapshot(
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
//   static List<CustomMarker> myMarkers(){
//     List<CustomMarker> list = [];
//     PracticeData..forEach((StoreType st) => list.add(CustomMarker.fromMyStores(st)));
//     return list;
//   }
// }

// Future<List<StoreType>> getFireModel() async {
//   CollectionReference<Map<String, dynamic>> _collectionReference =
//   FirebaseFirestore.instance.collection("memo");
//   QuerySnapshot<Map<String, dynamic>> querySnapshot =
//   await _collectionReference.orderBy("date").get();
//
//   List<StoreType> mottos = [];
//   for (var doc in querySnapshot.docs) {
//     StoreType fireModel = StoreType.fromQuerySnapshot(doc);
//     mottos.add(fireModel);
//   }
//   return mottos;
// }
class PracticeData {
  static final List<StoreType> myStores = [
    Info(
      address: "서울 마포구 연희로1길 41",
      category: "관광 명소",
      name: "대구 교육박물관",
      starRate: "4.3",
      uid: "1",
      location: LocationClass(latitude: 35.8973491, longitude: 128.6118352),
    ),
    Info(
      address: "북구 침산동 호암로 51",
      category: "관광 명소",
      name: "대구 삼성 창조 캠퍼스",
      starRate: "4.2",
      uid: "2",
      location: LocationClass(latitude: 35.8836624, longitude: 128.5959743),
    ),
    Info(
      address: "북구 침산남로9길 118",
      category: "관광 명소",
      name: "침산공원",
      starRate: "4.3",
      uid: "3",
      location: LocationClass(latitude: 35.89536896, longitude: 128.5859309),
    ),
    Info(
      address: "북구 유통단지로14길 22",
      category: "실내 놀이터",
      name: "모모키즈빌리지",
      starRate: "4.4",
      uid: "4",
      location: LocationClass(latitude: 35.9052132, longitude: 128.6103554),
    ),
    Info(
      address: "북구 유통단지로 61",
      category: "공원",
      name: "유통단지공원",
      starRate: "4.4",
      uid: "5",
      location: LocationClass(latitude: 35.9074042, longitude: 128.6090479),
    ),
    Info(
      address: "달서구 대곡동 1088",
      category: "공원",
      name: "한실공원",
      starRate: "4.4",
      uid: "6",
      location: LocationClass(latitude: 35.80244738, longitude: 128.53292508),
    ),
    Info(
      address: "달서구 성당동 154",
      category: "관광 명소",
      name: "두류공원",
      starRate: "4.4",
      uid: "7",
      location: LocationClass(latitude: 35.84882513, longitude: 128.55914003),
    ),
    Info(
      address: "달서구 두류동 두류공원로 200",
      category: "관광 명소",
      name: "83 타워",
      starRate: "4.4",
      uid: "8",
      location: LocationClass(latitude: 35.8548554, longitude: 128.564821),
    ),
    Info(
      address: "달서구 도원동 952",
      category: "관광 명소",
      name: "월광수변공원",
      starRate: "4.4",
      uid: "9",
      location: LocationClass(latitude: 35.79878804, longitude: 128.54774582),
    ),
    Info(
      address: "달서구 화암로 342",
      category: "관광 명소",
      name: "대구수목원",
      starRate: "4.6",
      uid: "10",
      location: LocationClass(latitude: 35.79896432, longitude: 128.52368335),
    ),
    Info(
      address: "동구 신암동",
      category: "관광 명소",
      name: "신암 공원",
      starRate: "4.3",
      uid: "11",
      location: LocationClass(latitude: 35.88973604, longitude: 128.62352149),
    ),
    Info(
      address: "동구 효목1동 효동로6길",
      category: "관광 명소",
      name: "동촌 유원지",
      starRate: "4.2",
      uid: "12",
      location: LocationClass(latitude: 35.88253957, longitude: 128.65064351),
    ),
    Info(
      address: "동구 도장길 29",
      category: "관광 명소",
      name: "대구 방짜유기 박물관",
      starRate: "4.1",
      uid: "13",
      location: LocationClass(latitude: 35.965585, longitude: 128.701213),
    ),
    Info(
      address: "불로 봉무동 산134-3",
      category: "관광 명소",
      name: "봉무 나비 생태원",
      starRate: "4.4",
      uid: "14",
      location: LocationClass(latitude: 35.92001225, longitude: 128.65146044),
    ),
    Info(
      address: "동구 동부로 149",
      category: "관광 명소",
      name: "대구 아쿠아리움",
      starRate: "4.3",
      uid: "15",
      location: LocationClass(latitude: 35.8777043, longitude: 128.6291671),
    ),
    Info(
      address: "중구 달성공원로 35",
      category: "관광 명소",
      name: "달성공원",
      starRate: "4.2",
      uid: "16",
      location: LocationClass(latitude: 35.8733797, longitude: 128.5759076),
    ),
    Info(
      address: "중구 중앙대로 449",
      category: "관광 명소",
      name: "향촌문화관",
      starRate: "4.4",
      uid: "17",
      location: LocationClass(latitude: 35.8733743, longitude: 128.5941672),
    ),
    Info(
      address: "중구 남산동",
      category: "관광 명소",
      name: "남산어린이공원",
      starRate: "4.3",
      uid: "18",
      location: LocationClass(latitude: 35.85814571, longitude: 128.58146761),
    ),
    Info(
      address: "중구 대봉동",
      category: "관광 명소",
      name: "김광석 다시그리기길",
      starRate: "4.2",
      uid: "19",
      location: LocationClass(latitude: 35.8602606, longitude: 128.60685893),
    ),
    Info(
      address: "중구 동성로2길 61",
      category: "관광 명소",
      name: "스파크랜드",
      starRate: "4.3",
      uid: "20",
      location: LocationClass(latitude: 35.8686692, longitude: 128.5966694),
    ),
    Info(
      address: "남구 봉덕2동 1586-4",
      category: "관광 명소",
      name: "고산골 공룡공원",
      starRate: "4.2",
      uid: "21",
      location: LocationClass(latitude: 35.82987784, longitude: 128.60350444),
    ),
    Info(
      address: "남구 봉덕동 1617-1",
      category: "광장",
      name: "신천종합생활체육광장",
      starRate: "4.5",
      uid: "22",
      location: LocationClass(latitude: 35.83925573, longitude: 128.6062643),
    ),
    Info(
      address: "남구 앞산순환로 574-57",
      category: "관광 명소",
      name: "앞산공원",
      starRate: "4.5",
      uid: "23",
      location: LocationClass(latitude: 35.82454441, longitude: 128.60231015),
    ),
    Info(
      address: "서구 상중이동 366-1",
      category: "공원",
      name: "그린웨이 백합원",
      starRate: "4",
      uid: "24",
      location: LocationClass(latitude: 35.871342, longitude: 128.5397109),
    ),
    Info(
      address: "서구 중리동 산163",
      category: "관광 명소",
      name: "상리공원",
      starRate: "4.2",
      uid: "25",
      location: LocationClass(latitude: 35.86315123, longitude: 128.53078392),
    ),
    Info(
      address: "수성구 대흥동 504",
      category: "관광 명소",
      name: "아이니 테마파크",
      starRate: "4",
      uid: "26",
      location: LocationClass(latitude: 35.83166002, longitude: 128.687326),
    ),
    Info(
      address: "수성구 지산동 61",
      category: "캠핑장",
      name: "인디언캠프",
      starRate: "3.9",
      uid: "27",
      location: LocationClass(latitude: 35.8292283, longitude: 128.6451986),
    ),
    Info(
      address: "수성구 두산동 용학로 106-7",
      category: "카페",
      name: "펀더랜드",
      starRate: "4.3",
      uid: "28",
      location: LocationClass(latitude: 35.8241399, longitude: 128.6184081),
    ),
    Info(
      address: "수성구 미술관로 40",
      category: "관광 명소",
      name: "대구미술관",
      starRate: "4.4",
      uid: "29",
      location: LocationClass(latitude: 35.8271354, longitude: 128.6741762),
    ),
    Info(
      address: "수성구 동대구로 176",
      category: "청소년 센터",
      name: "어린이회관",
      starRate: "4.2",
      uid: "30",
      location: LocationClass(latitude: 35.8466821, longitude: 128.627775),
    ),
    Info(
      address: "수성구 고모동 팔현길 88-46",
      category: "관광 명소",
      name: "수성페밀리파크",
      starRate: "4.3",
      uid: "31",
      location: LocationClass(latitude: 35.870391, longitude: 128.6730882),
    ),
    Info(
      address: "수성구 두산동 518-3",
      category: "공원",
      name: "수성유원지",
      starRate: "4.8",
      uid: "32",
      location: LocationClass(latitude: 35.82912177, longitude: 128.61789053),
    ),
    Info(
      address: "수성구 무학로 42",
      category: "관광 명소",
      name: "아르떼 수성랜드",
      starRate: "4",
      uid: "33",
      location: LocationClass(latitude: 35.82857, longitude: 128.6133741),
    ),
    Info(
      address: "수성구 만촌동 1417",
      category: "관광 명소",
      name: "화랑 공원",
      starRate: "4.4",
      uid: "34",
      location: LocationClass(latitude: 35.87116036, longitude: 128.63982754),
    ),
  ];

  static List<CustomMarker> myMarkers(){
    List<CustomMarker> list = [];
    PracticeData.myStores.forEach((StoreType st) => list.add(CustomMarker.fromMyStores(st)));
    return list;
  }
  static readData(){
    final userCollectionReference = FirebaseFirestore.instance.collection("buk").doc("Ao79WIrKBwsw3K57luCO");
    userCollectionReference.get().then((value) => {
      value.data()
    });
  }
}