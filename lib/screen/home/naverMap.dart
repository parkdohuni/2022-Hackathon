import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackathon_irang/providers/map_provider.dart';
import 'package:hackathon_irang/views/android_main.dart';
import 'package:hackathon_irang/views/ios_main.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class NaverMap extends StatelessWidget {
  const NaverMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MapProvider>(create: (_) => MapProvider())
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MapProvider mapProvider = Provider.of<MapProvider>(context);

    return Platform.isAndroid
        ? AndroidMain(mapProvider: mapProvider,)
        : IosMain();
  }
}
// class DustMap extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: NaverMapTest(),
//     );
//   }
// }
// class NaverMapTest extends StatefulWidget {
//   @override
//   _NaverMapTestState  createState() => _NaverMapTestState ();
// }
//
// class _NaverMapTestState  extends State<NaverMapTest> {
//   Completer<NaverMapController> _controller = Completer();
//   MapType _mapType = MapType.Basic;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: NaverMap(
//           onMapCreated: onMapCreated,
//           mapType: _mapType,
//         ),
//       ),
//     );
//   }
//
//   void onMapCreated(NaverMapController controller) {
//     if (_controller.isCompleted) _controller = Completer();
//     _controller.complete(controller);
//   }
// }