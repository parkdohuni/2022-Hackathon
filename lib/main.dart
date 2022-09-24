import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'theme.dart';
import 'screen/mainScreen.dart';
import 'screen/splashScreen/splashScreen.dart';
import 'route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
