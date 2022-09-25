import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/recommandList.dart';
import '../../../theme.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../providers/recommendProvider.dart';

// class EachRecommendPlace extends StatefulWidget {
//
//   @override
//   _EachRecommendPlaceState createState() => _EachRecommendPlaceState();
// }

//class _EachRecommendPlaceState extends State<EachRecommendPlace> {
class EachRecommendPlace extends StatelessWidget {
  // List<RecommendLocation> recommendLocations = [];
  // RecommendPlaceFireBase recommendPlaceFirebase = RecommendPlaceFireBase();
  //
  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     recommendPlaceFirebase = RecommendPlaceFireBase();
  //   });
  // }

  EachRecommendPlace({
    Key? key,
    required this.recommendList,
  }) : super(key: key);

  final RecommendLocation recommendList;

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot> (
    //   // stream: RecommendPlaceFireBase.recommendLocationStream,
    //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (!snapshot.hasData) {
    //       return Container(
    //
    //       );
    //     } else {
          // recommendLocations = RecommendPlaceFireBase.getRecommendLocations(snapshot);
          return Container(
            child: Column(
              children: [
                Card(
                  clipBehavior: Clip.antiAlias,
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Padding(
                      //   padding: EdgeInsets.all(16.0),
                      // ),
                      ListTile(
                        title: Text(
                          recommendList.name,
                          style: textTheme().headline1,
                        ),
                        subtitle: Text(
                          recommendList.category,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            itemSize: 35,
                            initialRating:recommendList.starRate,
                            //minRating: 1,
                            //direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          SizedBox(width: 60),
                          Row(
                            children: [
                              Text(recommendList.starRate.toString(), style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),),
                              Text('/ 5.0', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '대구광역시 ',
                                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                              ),
                              // TextSpan(
                              //   text: recommendList.mainLocation,
                              //   style: TextStyle(color: Colors.black.withOpacity(0.6)),
                              // ),
                              TextSpan(
                                text: recommendList.address,
                                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Image.asset(recommendList.image),
                      //Image.asset('assets/images/sample.jpg'),
                    ],
                  ),
                ),
              ],
            ),
          );
  //       }
  //   );
  // }
  }
}