import 'package:beitouti_chefs/features/profile/presentation/pages/profile_page.dart';
import 'package:beitouti_chefs/features/show_menu/presentation/pages/show_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const Center(
      child: Text("Orders page"),
    ),
    ShowMenuPage(),
    const Center(
      child: Text("Subscriptions page"),
    ),
    const ProfilePage(),
  ];

  int _selectedPage = 0;

  void _onTapChange(int index) {
    if (index != _selectedPage) {
      setState(() {
        _selectedPage = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "بَيتوتيْ",
          style: TextStyle(
            fontSize: 21.sp,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
            ),
            child: Icon(
              Icons.search_rounded,
              size: 25.sp,
            ),
          ),
        ],
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: SizedBox(
        height: 65.h,
        child: GNav(
          onTabChange: _onTapChange,
          backgroundColor: Theme.of(context).colorScheme.primary,
          color: Colors.white,
          activeColor: Theme.of(context).colorScheme.primary,
          tabBackgroundColor: Theme.of(context).colorScheme.tertiary,
          tabs: [
            GButton(
              icon: Icons.playlist_add_check,
              text: 'الطلبات',
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
            ),
            GButton(
              icon: Icons.restaurant_menu,
              text: 'القائمة',
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
            ),
            GButton(
              icon: Icons.subscriptions,
              text: 'الاشتراكات',
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 10.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
            ),
            GButton(
              icon: Icons.person,
              text: 'الملف الشخصي',
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h,
              ),
              margin: EdgeInsets.symmetric(
                horizontal: 5.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
