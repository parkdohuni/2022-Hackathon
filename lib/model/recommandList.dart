import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendLocation {
  late int? id;
  late String name;
  late double starRate;
  late String category;
  late String specificLocation;
  late DocumentReference? reference;

  RecommendLocation({
    this.id,
    required this.name,
    required this.starRate,
    required this.category,
    required this.specificLocation,
    this.reference,
    //required this.ImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'starRate': starRate,
      'specificLocation': specificLocation,
    };
  }

  RecommendLocation.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    name = map?['name'];
    category = map?['category'];
    starRate = map?['starRate'];
    specificLocation = map?['specificLocation'];
  }

  RecommendLocation.fromSnapShot(DocumentSnapshot document) {
    Map<String, dynamic> map = document.data() as Map<String, dynamic>;
    id = map['id'];
    name = map['name'];
    category = map['category'];
    starRate = map['starRate'];
    specificLocation = map['specificLocation'];
    reference = document.reference;
  }
}

List<RecommendLocation> recommendList = [
  RecommendLocation(
    name: '아르떼 수성랜드',
    starRate: 4.0,
    category: '관광 명소',
    specificLocation: '무학로 42',
  ),
  RecommendLocation(
    name: '고산골 공룡공원',
    starRate: 4.2,
    category: '관광 명소',
    specificLocation: '봉덕 2동 1586-4',
  ),
  RecommendLocation(
    name: '대구 수목원',
    starRate: 4.6,
    category: '관광 명소',
    specificLocation: '화암로 432',
  ),
  RecommendLocation(
    name: '토이빌리지 대구혁신점',
    starRate: 4.2,
    category: '실내 놀이터',
    specificLocation: '혁신대로 468',
  ),
  RecommendLocation(
    name: '청솔공원',
    starRate: 4.2,
    category: '공원',
    specificLocation: '신매동',
  ),
];
