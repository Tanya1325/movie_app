import 'package:flutter/material.dart';

class HomepageTabsWidget extends StatefulWidget {
  const HomepageTabsWidget({super.key});

  @override
  State<HomepageTabsWidget> createState() => _HomepageTabsWidgetState();
}

class _HomepageTabsWidgetState extends State<HomepageTabsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          HomepageTabsWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled,color: Colors.white,), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ondemand_video), label: "Videos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "My Netflix"),
        ],
      ),
    );
  }
}
