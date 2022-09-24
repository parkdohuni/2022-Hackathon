import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'custom_class/location_class.dart';
import 'custom_class/marker_class.dart';
import 'custom_class/store_class.dart';

class PracticeData {
  static final List<StoreType> myStores = [
    Info(
      starRate: "0507-1408-1429",
      address: "서울 마포구 연희로1길 41",
      category: "카테고리",
      uid: "1",
      name: "리틀빅토리",
      // lat: 35.8973491,
      // lng: 128.6118352,
      location: LocationClass(latitude: 35.8973491, longitude: 128.6118352),
    ),
    Info(
      starRate: "02-322-4469",
      address: "서울 마포구 양화로21길 23",
      category: "카테고리",
      uid: "2",
      name: "얀 쿠브레",
      // lat: 37.559271,
      // lng: 126.924679,
      location: LocationClass(latitude: 37.559271, longitude: 126.924679),
    ),
    Info(
      starRate: "0507-1350-1881",
      address: "서울 마포구 동교로38길 33-21 2층",
      category: "카테고리",
      uid: "3",
      name: "미쁘동",
      // lat: 37.562138,
      // lng: 126.926221,
      location: LocationClass(latitude: 37.562138, longitude: 126.926221),
    ),
    Info(
      starRate: "02-335-7472",
      address: "서울 마포구 동교로38길 35",
      uid: "4",
      category: "카테고리",
      name: "수브니흐",
      // lat: 35.8973491,
      // lng: 128.6118352,
      location: LocationClass(latitude: 35.8973491, longitude: 128.6118352),
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