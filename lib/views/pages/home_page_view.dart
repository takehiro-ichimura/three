import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePageView extends StatelessWidget {
  const HomePageView(this.navigationShell, {super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: _onTap,
        ),
        body: navigationShell);
  }

  void _onTap(index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
