class RecommendLocation {

  final String name;
  final double starRate;
  final String category;
  final String mainLocation;
  final String specificLocation;
  //final String ImageUrl;

  RecommendLocation({
    required this.name,
    required this.starRate,
    required this.category,
    required this.mainLocation,
    required this.specificLocation,
    //required this.ImageUrl,
  });
}

List<RecommendLocation> recommendList = [
  RecommendLocation(
    name: '아르떼 수성랜드',
    starRate: 4.0,
    category: '관광 명소',
    mainLocation: '수성구 ',
    specificLocation: '무학로 42',
  ),
  RecommendLocation(
    name: '고산골 공룡공원',
    starRate: 4.2,
    category: '관광 명소',
    mainLocation: '남구 ',
    specificLocation: '봉덕 2동 1586-4',
  ),
  RecommendLocation(
    name: '대구 수목원',
    starRate: 4.6,
    category: '관광 명소',
    mainLocation: '달서구 ',
    specificLocation: '화암로 432',
  ),
  RecommendLocation(
    name: '토이빌리지 대구혁신점',
    starRate: 4.2,
    category: '실내 놀이터',
    mainLocation: '동구 ',
    specificLocation: '혁신대로 468',
  ),
  RecommendLocation(
    name: '청솔공원',
    starRate: 4.2,
    category: '공원',
    mainLocation: '수성구 ',
    specificLocation: '신매동',
  ),
];
