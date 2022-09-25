import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../model/recommandList.dart';

class RecommendPlaceFireBase {
  late CollectionReference recommendLocationReference;
  late Stream<QuerySnapshot> recommendLocationStream;

  Future initDB() async {
    recommendLocationReference = FirebaseFirestore.instance.collection('buk');
    recommendLocationStream = recommendLocationReference.snapshots();
  }

  List<RecommendLocation> getRecommendLocations(
      AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((DocumentSnapshot document) {
      return RecommendLocation.fromSnapShot(document);
    }).toList();
  }
}