import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../model/navItem.dart';
import 'home/home.dart';
import 'yesKidsZoneCafe/yesKidsZoneCafe.dart';
import 'weeklyDust/weeklyDust.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/mainScreens";

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          WeeklyDust(),
          Home(),
          YesKidsZoneCafe(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.white,
        onTap: onTaped,
        items: List.generate(
          navItems.length,
              (index) => _buildBottomNavigationBarItem(
            icon: navItems[index].icon,
            label: navItems[index].label,
            isActive: navItems[index].id == _selectedIndex ? true : false,
          ),
        ),
      ),
    );
  }

  void onTaped(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _buildBottomNavigationBarItem(
      {String? icon,
        String? label,
        bool isActive = false,
        GestureTapCallback? press}) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        width: 45,
        height: 45,
        child: IconButton(
          onPressed: press,
          icon: SvgPicture.asset(icon ?? "assets/icons/face-mask-svgrepo-com.svg",
              color: isActive ? kPrimaryColor : Colors.black),
        ),
      ),
      label: label,
    );
  }
}