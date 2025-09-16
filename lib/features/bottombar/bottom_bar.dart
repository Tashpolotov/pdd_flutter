import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/view/home_view.dart';
import '../profile/view/profile_view.dart';
import '../rating/view/rating_view.dart';
import '../video/view/video_view.dart';

class BottomBar extends StatelessWidget {
  final Widget child;
  const BottomBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    int _selectedIndex = _getSelectedIndex(currentLocation);

    final List<Widget> _screens = [
      HomeView(),
      VideoView(),
      RatingView(),
      ProfileView(),
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          onTap: (index) => _onItemTapped(context, index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_library),
              label: 'Видео',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Рейтинг',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профиль',
            ),
          ],
        ),
      ),
    );
  }

  int _getSelectedIndex(String currentLocation) {
    if (currentLocation.startsWith('/video')) return 1;
    if (currentLocation.startsWith('/rating')) return 2;
    if (currentLocation.startsWith('/profile')) return 3;
    return 0;
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/video');
        break;
      case 2:
        context.go('/rating');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }
}
