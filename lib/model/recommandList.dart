import 'package:cloud_firestore/cloud_firestore.dart';

class RecommendLocation {
  late String id;
  late String name;
  late double starRate;
  late String category;
  late String address;
  late String image;
  late DocumentReference? reference;

  RecommendLocation({
    required this.id,
    required this.name,
    required this.starRate,
    required this.category,
    required this.address,
    required this.image,
    this.reference,
    //required this.ImageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'starRate': starRate,
      'address': address,
    };
  }

  RecommendLocation.fromMap(Map<dynamic, dynamic>? map) {
    id = map?['id'];
    name = map?['name'];
    category = map?['category'];
    starRate = map?['starRate'];
    address = map?['address'];
  }

  RecommendLocation.fromSnapShot(DocumentSnapshot document) {
    Map<String, dynamic> map = document.data() as Map<String, dynamic>;
    id = map['id'];
    name = map['name'];
    category = map['category'];
    starRate = map['starRate'];
    address = map['address'];
    reference = document.reference;
  }
}

List<RecommendLocation> recommendList = [
  RecommendLocation(
    id: 'buk',
    name: '모모키즈빌리지',
    starRate: 4.4,
    category: '실내 놀이터',
    address: '북구 유통단지로14길 22',
    image: '',
  ),
  RecommendLocation(
    id: 'buk',
    name: '침산공원',
    starRate: 4.3,
    category: '관광 명소',
    address: '북구 침산남로9길 118',
    image: '',
  ),
  RecommendLocation(
    id: 'su',
    name: '아르떼 수성랜드',
    starRate: 4.0,
    category: '관광 명소',
    address: '수성구 무학로 42',
    image: '',
  ),
  RecommendLocation(
    id: 'su',
    name: '아이니 테마파크',
    starRate: 4.0,
    category: '관광 명소',
    address: '수성구 대흥동 504',
    image: '',
  ),
  RecommendLocation(
    id: 'su',
    name: '펀더랜드',
    starRate: 4.3,
    category: '카페',
    address: '수성구 두산동 용학로 106-7',
    image: '',
  ),
  RecommendLocation(
    id: 'su',
    name: '대구미술관',
    starRate: 4.4,
    category: '관광 명소',
    address: '수성구 미술관로 40',
    image: '',
  ),
  RecommendLocation(
    id: 'nam',
    name: '고산골 공룡공원',
    starRate: 4.2,
    category: '관광 명소',
    address: '남구 봉덕 2동 1586-4',
    image: '',
  ),
  RecommendLocation(
    id: 'jung',
    name: '달성공원',
    starRate: 4.2,
    category: '관광 명소',
    address: '중구 달성공원로 35',
    image: '',
  ),
  RecommendLocation(
    id: 'jung',
    name: '스파크랜드',
    starRate: 4.3,
    category: '관광 명소',
    address: '중구 동성로2길 61',
    image: '',
  ),
  RecommendLocation(
    id: 'dal',
    name: '대구 수목원',
    starRate: 4.6,
    category: '관광 명소',
    address: '달서구 화암로 432',
    image: '',
  ),
  RecommendLocation(
    id: 'dal',
    name: '두류 공원',
    starRate: 4.4,
    category: '관광 명소',
    address: '달서구 성당동 154',
    image: '',
  ),
  RecommendLocation(
    id: 'dal',
    name: '83타워',
    starRate: 4.4,
    category: '관광 명소',
    address: '달서구 도원동 952',
    image: '',
  ),
  RecommendLocation(
    id: 'dong',
    name: '대구 방짜유기 박물관',
    starRate: 4.1,
    category: '관광 명소',
    address: '동구 도장길 29',
    image: '',
  ),
  RecommendLocation(
    id: 'dong',
    name: '등촌유원지',
    starRate: 4.2,
    category: '관광 명소',
    address: '동구 효목1동 효동로6길',
    image: '',
  ),
  RecommendLocation(
    id: 'dong',
    name: '대구아쿠아리움',
    starRate: 4.3,
    category: '관광 명소',
    address: '동구 동부로 149',
    image: '',
  ),
];
