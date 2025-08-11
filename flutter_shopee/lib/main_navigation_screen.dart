import 'package:flutter/material.dart';
import 'package:flutter_shopee/features/profile/presenter/pages/profile_screen.dart';
import 'package:flutter_shopee/theme/dimensions.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ProfileScreen(),
    const ProfileScreen(),
    const ProfileScreen(),  
    const ProfileScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return CustomBottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kWidgetBorderRadius),
          topRight: Radius.circular(kWidgetBorderRadius),
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.outline.withAlpha(10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, 'assets/images/menu_home.png', 'assets/images/menu_home.png'),
          _buildNavItem(context, 1, 'assets/images/menu_wishlist.png', 'assets/images/menu_wishlist.png'),
          _buildNavItem(context, 2, 'assets/images/menu_categories.png', 'assets/images/menu_categories.png'),
          _buildNavItem(context, 3, 'assets/images/menu_cart.png', 'assets/images/menu_cart.png'),
          _buildNavItem(context, 4, 'assets/images/menu_profile.png', 'assets/images/menu_profile.png'),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String unselectedImage, String selectedImage) {
    final isSelected = currentIndex == index;
    
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isSelected ? selectedImage : unselectedImage,
            width: 24,
            height: 24,
            color: isSelected ? Theme.of(context).colorScheme.scrim : Theme.of(context).colorScheme.primary,
          ),
          if (isSelected)
            Container(
              margin: EdgeInsets.only(top: 4),
              width: 10,
              height: 2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.scrim,
                shape: BoxShape.rectangle,
              ),
            ),
        ],
      ),
    );
  }
}
