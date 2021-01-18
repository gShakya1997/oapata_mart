import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:oapata_mart/src/constants.dart';

import 'components/body_home.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => currentIndex = index);
          },
          children: [
            BodyHome(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
        bottomNavigationBar: buildBottomNavBar(currentIndex),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: kPrimaryColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: IconButton(
          icon: Icon(Icons.shopping_cart_sharp),
          onPressed: () {},
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 15.0),
          child: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  BottomNavyBar buildBottomNavBar(int currentIndex) {
    return BottomNavyBar(
      animationDuration: Duration(milliseconds: 250),
      showElevation: true,
      itemCornerRadius: 20,
      backgroundColor: Colors.white,
      selectedIndex: currentIndex,
      onItemSelected: (index) {
        setState(() => currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.black54,
          inactiveColor: kPrimaryColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_bag),
          title: Text('Cart'),
          activeColor: Colors.black54,
          inactiveColor: kPrimaryColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Wishlist'),
          activeColor: Colors.black54,
          inactiveColor: kPrimaryColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          activeColor: Colors.black54,
          inactiveColor: kPrimaryColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
