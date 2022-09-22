import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoKidsZoneCafe extends StatelessWidget {
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
      body: Container(
          child: Center(
            child: Text("RecommandPlace Screen"),
          )
      ),
    );
  }
}