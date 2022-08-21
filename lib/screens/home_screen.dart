import 'package:flutter/material.dart';

import 'package:twitch_yee/screens/feed_screen.dart';
import 'package:twitch_yee/screens/go_live_screen.dart';
import 'package:twitch_yee/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  static final String namedRoute = "/homescreenroute";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;

  List<Widget> pages = [
    const FeedScreen(),
    const GoLiveScreen(),
    const Center(
      child: Text("Browser"),
    )
  ];

  onPageChange(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: buttonColor,
        unselectedItemColor: primaryColor,
        backgroundColor: backgroundColor,
        onTap: onPageChange,
        currentIndex: _page,
        unselectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Following",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_rounded),
            label: "Go Live",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy),
            label: "Browse",
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}