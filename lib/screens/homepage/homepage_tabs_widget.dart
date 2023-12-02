import 'package:flutter/material.dart';
import 'package:movie_app/screens/account_screen/my_account_screen.dart';
import 'package:movie_app/utils/index.dart';

class HomepageTabsWidget extends StatefulWidget {
  const HomepageTabsWidget({super.key});

  @override
  State<HomepageTabsWidget> createState() => _HomepageTabsWidgetState();
}

class _HomepageTabsWidgetState extends State<HomepageTabsWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Homepage(),
          Homepage(),
          MyAccountScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedIconTheme: const IconThemeData(color: Colors.grey),
        selectedLabelStyle: const TextStyle(color: Colors.white),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
              activeIcon: Image.asset('assets/images/homepage.png'),
              icon: const Icon(
                Icons.home_filled,
              ),
              label: StringConstants.home),
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/images/youtube.png'),
              icon: const Icon(Icons.ondemand_video), label: StringConstants.videos),
          BottomNavigationBarItem(
              activeIcon: Image.asset('assets/images/user.png'),
              icon: const Icon(Icons.person), label: StringConstants.myAccount),
        ],
      ),
    );
  }
}
