import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:oapata_mart/src/constants.dart';
import 'package:oapata_mart/src/screens/home/components/body_home.dart';

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
    return Scaffold(
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
    );
  }

  BottomNavyBar buildBottomNavBar(int currentIndex) {
    return BottomNavyBar(
      animationDuration: Duration(milliseconds: 250),
      showElevation: true,
      itemCornerRadius: 20,
      backgroundColor: kPrimaryColor,
      selectedIndex: currentIndex,
      onItemSelected: (index) {
        setState(() => currentIndex = index);
        _pageController.jumpToPage(index);
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
          activeColor: Colors.black,
          inactiveColor: Colors.black54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.shopping_bag),
          title: Text('Cart'),
          activeColor: Colors.black,
          inactiveColor: Colors.black54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Wishlist'),
          activeColor: Colors.black,
          inactiveColor: Colors.black54,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
          activeColor: Colors.black,
          inactiveColor: Colors.black54,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text('Oapata Mart'),
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {},
      //   )
      // ],
    );
  }
}