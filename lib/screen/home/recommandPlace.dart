import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/recommandList.dart';
import 'eachRecommendPlace.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../weeklyDust/weeklyDust.dart';

class RecommendPlace extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: List.generate(
            recommendList.length,
                (index) => EachRecommendPlace(recommendList: recommendList[index]),
            ),
      ),
    );
  }
}