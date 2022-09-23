import 'package:flutter/material.dart';
import 'theme.dart';
import 'screen/mainScreen.dart';
import 'screen/splashScreen/splashScreen.dart';
import 'route.dart';

void main() {
  runApp(IRang());
}

class IRang extends StatelessWidget {
  //static String routeName = "/mainScreens";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "IRang",
      initialRoute: SplashScreen.routeName,
      //home: MainScreen(),
      routes: route,
      theme: theme(),
    );
  }
}
