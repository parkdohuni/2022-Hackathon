import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'scrollable_list_tabview.dart';

class YesKidsZoneCafe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: CafeList(title: '',),
    );
  }
}

class CafeList extends StatefulWidget {
  CafeList({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _CafeList createState() => _CafeList();
}

class _CafeList extends State<CafeList> {
  
  List _items = [];
  List _itemsEast = [];
  List _itemsNorth = [];
  List _itemsSouth = [];
  List _itemsWest = [];
  List _itemsDalsung = [];
  List _itemsSusung = [];
  List _itemDalseo = [];
  List _itemsCenter=[];
/*
  icon: SizedBox(
  width: 45,
  height: 45,
  child: IconButton(
  onPressed: press,
  icon: SvgPicture.asset(icon ?? "assets/icons/star.svg",
  color: isActive ? kPrimaryColor : Colors.black),
  ),
  ),*/
  
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/json/yeskids.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["yeskids"];
    });

    for(int index=0; index<_items.length;index++){
      String location = _items[index]["address"].split(' ')[1];
      if( location == '동구'){
        setState(() {
          _itemsEast.add(_items[index]);
        });
      }else if(location=='서구'){
        setState(() {
          _itemsWest.add(_items[index]);
        });
      }else if(location=='북구'){
        setState(() {
          _itemsNorth.add(_items[index]);
        });
      }else if(location=='남구'){
        setState(() {
          _itemsSouth.add(_items[index]);
        });
      }else if(location=='달서구'){
        setState(() {
          _itemDalseo.add(_items[index]);
        });
      }else if(location=='달성군'){
        setState(() {
          _itemsDalsung.add(_items[index]);
        });
      }else if(location=='수성구'){
        setState(() {
          _itemsSusung.add(_items[index]);
        });
      }else if(location=='중구'){
        setState(() {
          _itemsCenter.add(_items[index]);
        });
      }
    }

  }

  void initState(){
    readJson();
    super.initState();
  }

  // 원래 카드속이미지코드
  // Ink.image(
  // image: Image.network(_itemsCenter[index]["image"], width: 10,).image,
  // fit: BoxFit.cover,
  // ),
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xfffdf359),
        title: Text('대구의 YesKids존 카페를 확인해 보세요', style: TextStyle(color: Color(
            0xff5c5c5c), fontSize: 13, fontWeight: FontWeight.w500),),
      ),
      body: ScrollableListTabView(
        tabHeight: 48,
        bodyAnimationDuration: const Duration(milliseconds: 150),
        tabAnimationCurve: Curves.easeOut,
        tabAnimationDuration: const Duration(milliseconds: 200),
        tabs: [
          ScrollableListTab(
            tab: ListTab(
              label: '북구',
              showIconOnList: false,
            ),
            body: GridView.builder(
                shrinkWrap: true,
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                physics: NeverScrollableScrollPhysics(),
                itemCount: _itemsNorth.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      elevation: 4.0,
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 115.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(_itemsNorth[index]["image"],).image, fit: BoxFit.fill)
                              ),
                            ), flex: 6,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text(_itemsNorth[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 5,),
                                  Text(_itemsNorth[index]["address"], style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ), flex: 4,
                          ),
                        ],
                      ));
                }
            ),
          ),
          ScrollableListTab(
            tab: ListTab(label: '동구',),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemsEast.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      elevation: 4.0,
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 115.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(_itemsEast[index]["image"],).image, fit: BoxFit.fill)
                              ),
                            ), flex: 6,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text(_itemsEast[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 4.0,),
                                  Text(_itemsEast[index]["address"], style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ), flex: 4,
                          ),
                        ],
                      ));
                }
            ),
          ),
          ScrollableListTab(
            tab: ListTab(label: '중구',),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemsCenter.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                    elevation: 4.0,
                    borderOnForeground: true,
                    child: Column(
                      children: [
                        Flexible(
                          child: Container(
                            height: 115.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(image: Image.network(_itemsCenter[index]["image"],).image, fit: BoxFit.fill)
                            ),
                          ), flex: 6,
                        ),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment.bottomLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5,),
                                Text(_itemsCenter[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                SizedBox(height: 4,),
                                Text(_itemsCenter[index]["address"], style: TextStyle(fontSize: 10),),
                              ],
                            ),
                          ), flex: 4,
                        ),
                      ],
                    ));
              }
            ),
          ),
          ScrollableListTab(
            tab: ListTab(
                label: '서구',
                showIconOnList: true),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemsWest.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      elevation: 4.0,
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 115.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(_itemsWest[index]["image"],).image, fit: BoxFit.fill)
                              ),
                            ), flex: 6,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text(_itemsWest[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 4,),
                                  Text(_itemsWest[index]["address"], style: TextStyle(fontSize: 10),),

                                ],
                              ),
                            ), flex: 4,
                          ),
                        ],
                      ));
                }
            ),
          ),
          ScrollableListTab(
            tab: ListTab(label: '달서구',),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemDalseo.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      elevation: 4.0,
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 115.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(_itemDalseo[index]["image"],).image, fit: BoxFit.fill)
                              ),
                            ), flex: 6,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text(_itemDalseo[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 4,),
                                  Text(_itemDalseo[index]["address"], style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ), flex: 4,
                          ),
                        ],
                      ));
                }
            ),
          ),
          ScrollableListTab(
            tab: ListTab(label: '수성구',),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemsSusung.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      elevation: 4.0,
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 115.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(_itemsSusung[index]["image"],).image, fit: BoxFit.fill)
                              ),
                            ), flex: 6,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text(_itemsSusung[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 4,),
                                  Text(_itemsSusung[index]["address"], style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ), flex: 4,
                          ),
                        ],
                      ));
                }
            ),
          ),
          ScrollableListTab(
            tab: ListTab(
              label: '달성군',
              showIconOnList: true,
            ),
            body: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemsDalsung.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                      elevation: 4.0,
                      borderOnForeground: true,
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              height: 115.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: Image.network(_itemsDalsung[index]["image"],).image, fit: BoxFit.fill)
                              ),
                            ), flex: 6,
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.all(10.0),
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5,),
                                  Text(_itemsDalsung[index]["name"] ,style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                                  SizedBox(height: 4,),
                                  Text(_itemsDalsung[index]["address"], style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ), flex: 4,
                          ),
                        ],
                      ));
                }
            ),
          ),
        ],
      ),
    );
  }
}