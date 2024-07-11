import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key, required this.onTap});

  final void Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Container(
        child: GNav(
            mainAxisAlignment: MainAxisAlignment.center,
            color: Colors.grey.shade400,
            activeColor: Colors.grey.shade700,
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.grey.shade100,
            tabBorderRadius: 16,
            onTabChange: onTap,
            tabs: [
          GButton(
            icon: Icons.home,
          ),
          GButton(
              icon: Icons.shopping_cart
          ),
        ]),
      ),
    );
  }
}
