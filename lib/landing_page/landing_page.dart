import 'dart:ffi';

import 'package:community_app/landing_page/SharedController.dart';
import 'package:community_app/main.dart';
import 'package:community_app/post/add_post_page.dart';
import 'package:community_app/post/post_page.dart';
import 'package:community_app/profile/profile_page.dart';
import 'package:community_app/search/search_page.dart';
import 'package:community_app/updates/updates_page.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  SharedController sharedController = Get.isRegistered()? Get.find():Get.put(SharedController());
  List<Widget> tabItems = [
    Center(child: PostPage()),
    Center(child: SearchPage()),
    Center(child: AddPostPage()),
    Center(child: UpdatesPage()),
    Center(child: ProfilePage())
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(() => tabItems[sharedController.selectedIndex.value]),
      ),
      bottomNavigationBar: FlashyTabBar(
        selectedIndex: sharedController.selectedIndex.value,
        showElevation: true,
        animationCurve: Curves.easeInOut,
        onItemSelected: (index) => setState(() {
          sharedController.selectedIndex.value = index;
        }),
        items: [
          createTabBarItem(Icons.home_filled, 'Home', Colors.orange, Colors.grey),
          createTabBarItem(Icons.search, 'Search', Colors.orange, Colors.grey),
          createTabBarItem(Icons.add_box, 'Create', Colors.orange, Colors.grey),
          createTabBarItem(Icons.notifications_none_outlined, 'Updates', Colors.orange, Colors.grey),
          createTabBarItem(Icons.person, 'Profile', Colors.orange, Colors.grey),

        ],
      ),
    );
  }

  FlashyTabBarItem createTabBarItem(IconData icon, String title, Color activeColor, Color inactiveColor) {
    return FlashyTabBarItem(
      icon: Icon(icon),
      title: Text(title),
      activeColor: activeColor,
      inactiveColor: inactiveColor,
    );
  }
}
