import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../../constants.dart';
import '../../theme.dart';
import './weather.dart';
import 'package:ml_dataframe/ml_dataframe.dart';
import 'package:ml_algo/ml_algo.dart';
import 'package:collection/collection.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/services.dart' show rootBundle;

late List<double> data_dong=[0,0,0,0,0,0,0];
late List<double> data_buk=[0,0,0,0,0,0,0];
late List<double> data_dal=[0,0,0,0,0,0,0];
late List<double> data_jung=[0,0,0,0,0,0,0];
late List<double> data_nam=[0,0,0,0,0,0,0];
late List<double> data_seo=[0,0,0,0,0,0,0];
late List<double> data_su=[0,0,0,0,0,0,0];

class WeeklyDust extends StatefulWidget {
  @override
  State<WeeklyDust> createState() => _WeeklyDust();
}
List<String> textarea(){
  List<double> dataset=[data_dong[0],data_buk[0],data_dal[0],data_jung[0],data_nam[0],data_seo[0], data_su[0]];
  List<double> dataset_av=[data_dong.average,data_buk.average,data_dal.average,data_jung.average,data_nam.average,data_seo.average, data_su.average];
  String min_data = dataset.reduce(min).toInt().toString();
  List<String> answer = [];

  for(int i=0;i<7;i++)
       if (dataset[i]== dataset.reduce(min))
         if (i ==0) answer.add('동구'); else if (i==1) answer.add('북구');
         else if (i==2) answer.add('달서구');else if (i==3) answer.add('중구');
         else if (i==4) answer.add('남구');  else if (i==5)  answer.add('서구'); else answer.add('수성구');
  answer.add(min_data);

  for(int i=0;i<7;i++)
    if (dataset_av[i]== dataset_av.reduce(max))
      if (i ==0) answer.add('동구'); else if (i==1) answer.add('북구');
      else if (i==2) answer.add('달서구');else if (i==3) answer.add('중구');
      else if (i==4) answer.add('남구');  else if (i==5)  answer.add('서구'); else answer.add('수성구');

  return answer;
}

class _WeeklyDust extends State<WeeklyDust> {
  late List<DustData> chartdata;
  @override


  void initState() {
    machine().then((val) {
      setState(() {});
    }).catchError((error, stackTrace) {
      print("outer: $error");
    });

    super.initState();
  }
  Widget build(BuildContext context){

    List<String> text_list=textarea();
    String min_region = text_list[0];
    String min_predict = text_list[1];
    String max_region = text_list[2];

    Widget textSection = Padding(
        padding: EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text.rich(
                  TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: '내일 ',
                        style: textTheme().headline2?.copyWith(
                            color: kTextColor),
                    ),
                    TextSpan(
                      text: '아이랑 놀기 좋은 곳',
                      style: textTheme().headline1?.copyWith(
                          color: Colors.amber,fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '은\n\n',
                      style: textTheme().headline2?.copyWith(color: kTextColor,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: min_region,
                      style: textTheme().headline2?.copyWith(
                          color: Colors.amberAccent,fontSize: 50,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '에요.\n',
                      style: textTheme().headline2?.copyWith(color: kTextColor,fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: '미세먼지 농도는 ',
                      style: textTheme().headline2?.copyWith(color: kTextColor,),
                    ),
                    TextSpan(
                      text: min_predict,
                      style: textTheme().headline2?.copyWith(
                          color: Colors.amber,fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: '로 예측됩니다.',
                        style: textTheme().headline2?.copyWith(color: kTextColor,),),
                  ]))
            ]));
    Widget textSection2 = Center(
        child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text.rich(
                      TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: max_region,
                          style: textTheme().headline2?.copyWith(
                          color: Colors.deepOrange,fontSize: 25,fontWeight: FontWeight.bold),),
                        TextSpan(
                          text: '는 한동안 피해주세요!',
                          style: textTheme().headline2?.copyWith(color: kTextColor,fontWeight: FontWeight.bold),
                        ),
                      ]
                      ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('일주일 평균 미세먼지 농도가 가장 높아요.',style: textTheme().headline2?.copyWith(color: kTextColor,fontWeight: FontWeight.bold))
            ])));
    Widget chartSection = Center(
      child: Container(
        width: 500,
        height: 300,
        child: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            legend: Legend(
                isVisible: true,
                // Legend will be placed at the left
                position: LegendPosition.bottom),
            series: <CartesianSeries>[
              FastLineSeries<DustData, String>(
                  name: '북구',
                  dataSource: [
                    DustData('1일 후', data_buk[0]),
                    DustData('2일 후', data_buk[1]),
                    DustData('3일 후', data_buk[2]),
                    DustData('4일 후', data_buk[3]),
                    DustData('5일 후', data_buk[4]),
                    DustData('6일 후', data_buk[5]),
                    DustData('7일 후', data_buk[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<DustData, String>(
                  name: '동구',
                  dataSource: [
                    DustData('1일 후', data_dong[0]),
                    DustData('2일 후', data_dong[1]),
                    DustData('3일 후', data_dong[2]),
                    DustData('4일 후', data_dong[3]),
                    DustData('5일 후', data_dong[4]),
                    DustData('6일 후', data_dong[5]),
                    DustData('7일 후', data_dong[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<DustData, String>(
                  name: '중구',
                  dataSource: [
                    DustData('1일 후', data_jung[0]),
                    DustData('2일 후', data_jung[1]),
                    DustData('3일 후', data_jung[2]),
                    DustData('4일 후', data_jung[3]),
                    DustData('5일 후', data_jung[4]),
                    DustData('6일 후', data_jung[5]),
                    DustData('7일 후', data_jung[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<DustData, String>(
                  name: '서구',
                  dataSource: [
                    DustData('1일 후', data_seo[0]),
                    DustData('2일 후', data_seo[1]),
                    DustData('3일 후', data_seo[2]),
                    DustData('4일 후', data_seo[3]),
                    DustData('5일 후', data_seo[4]),
                    DustData('6일 후', data_seo[5]),
                    DustData('7일 후', data_seo[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<DustData, String>(
                  name: '수성구',
                  dataSource: [
                    DustData('1일 후', data_su[0]),
                    DustData('2일 후', data_su[1]),
                    DustData('3일 후', data_su[2]),
                    DustData('4일 후', data_su[3]),
                    DustData('5일 후', data_su[4]),
                    DustData('6일 후', data_su[5]),
                    DustData('7일 후', data_su[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<DustData, String>(
                  name: '달서구',
                  dataSource: [
                    DustData('1일 후', data_dal[0]),
                    DustData('2일 후', data_dal[1]),
                    DustData('3일 후', data_dal[2]),
                    DustData('4일 후', data_dal[3]),
                    DustData('5일 후', data_dal[4]),
                    DustData('6일 후', data_dal[5]),
                    DustData('7일 후', data_dal[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
              FastLineSeries<DustData, String>(
                  name: '남구',
                  dataSource: [
                    DustData('1일 후', data_nam[0]),
                    DustData('2일 후', data_nam[1]),
                    DustData('3일 후', data_nam[2]),
                    DustData('4일 후', data_nam[3]),
                    DustData('5일 후', data_nam[4]),
                    DustData('6일 후', data_nam[5]),
                    DustData('7일 후', data_nam[6]),
                  ],
                  xValueMapper: (DustData sales, _) => sales.date,
                  yValueMapper: (DustData sales, _) => sales.value,
                  // dataLabelSettings: DataLabelSettings(
                  //   // Renders the data label
                  //     isVisible: true),
                  markerSettings: MarkerSettings(isVisible: true)),
            ]
        ),

      ),
    );



    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/logo.png',
                fit: BoxFit.contain,
                height: 165,
              ),
            ],
          ),
        ),
        body: SafeArea(
            child:Center(
              child: ListView(
                children: <Widget>[
                  textSection,
                  chartSection,
                  textSection2,
                ],
              ),
            )));
  }
}

class DustData {
  DustData(this.date, this.value);

  final String? date;
  final double value;
}

void predict(String datapath,double air,String region) async{

  final data = [
    ['pm',  'y'], [air,  ],
  ];

  final rawCsvContent = await rootBundle.loadString(datapath);
  final samples = DataFrame.fromRawCsv(rawCsvContent,headerExists: true);

  final regressor= LinearRegressor(samples, 'y',iterationsLimit: 300, initialLearningRate: 0.001, batchSize: 5,
      fitIntercept: true, interceptScale: 3.0, learningRateType: LearningRateType.constant);
  final knnregressor= KnnRegressor(samples, 'y', 3);

  for(int k=0;k<9;k++) {
    final unlabel = DataFrame(data, headerExists: true);
    final prediction = regressor.predict(unlabel);
    String i = prediction.rows.elementAt(k).toString();
    double next = double.parse(i.substring(1, i.length - 1));
    data.add([next, ]);
  }
  if (region=='seo')
    print(data);

  final unlabel = DataFrame(data, headerExists: true);
  final prediction = knnregressor.predict(unlabel);

  for(int k=0;k<7;k++) {
    String i = prediction.rows.elementAt(k+2).toString();
    if (region == 'dong') {
      data_dong[k] = double.parse(i.substring(1, i.length - 1));
    }else if (region == 'buk') {
      data_buk[k] = double.parse(i.substring(1, i.length - 1));
    }else if (region == 'dal') {
      data_dal[k] = double.parse(i.substring(1, i.length - 1));
    }else if (region == 'jung') {
      data_jung[k] = double.parse(i.substring(1, i.length - 1));
    }else if (region == 'nam') {
      data_nam[k] = double.parse(i.substring(1, i.length - 1));
    }else if (region == 'seo') {
      data_seo[k] = double.parse(i.substring(1, i.length - 1));
    }else if (region == 'su') {
      data_su[k] = double.parse(i.substring(1, i.length - 1));
    }
  }
}

Future machine() async{

  final airPollution = await dust();

  predict('assets/dataset/train_dong.csv',double.parse(airPollution[1]),'dong');
  predict('assets/dataset/train_jung.csv',double.parse(airPollution[0]),'jung');
  predict('assets/dataset/train_seo.csv',double.parse(airPollution[2]),'seo');
  predict('assets/dataset/train_nam.csv',double.parse(airPollution[3]),'nam');
  predict('assets/dataset/train_buk.csv',double.parse(airPollution[4]),'buk');
  predict('assets/dataset/train_su.csv',double.parse(airPollution[5]),'su');
  predict('assets/dataset/train_dal.csv',double.parse(airPollution[6]),'dal');

  return airPollution;
}

