import 'package:flutter/material.dart';
import 'package:test_app_sql/core/theme/style.dart';

class ScaffoldWithNavigationBar extends StatefulWidget {
  const ScaffoldWithNavigationBar({
    Key? key,
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
  }) : super(key: key);

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  State<ScaffoldWithNavigationBar> createState() => _ScaffoldWithNavigationBarState();
}

class _ScaffoldWithNavigationBarState extends State<ScaffoldWithNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: widget.body,
      bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: const TextStyle(
            color: AppColors.black36,
          ),
          selectedLabelStyle: const TextStyle(
            color: AppColors.black,
          ),
          unselectedItemColor: AppColors.black36,
          selectedItemColor: AppColors.black,
          backgroundColor: Colors.white,
          currentIndex: widget.selectedIndex,
          onTap: widget.onDestinationSelected,
          items: itemsMenuForUser()),
    );
  }

  List<BottomNavigationBarItem> itemsMenuForUser() {
    final List<BottomNavigationBarItem> items = [
      buildNavigationBarItem(
        Icons.home,
        'Главная',
        0,
      ),
      buildNavigationBarItem(
        Icons.list_alt,
        'Заказы',
        1,
      ),
    ];

    return items;
  }

  BottomNavigationBarItem buildNavigationBarItem(IconData icon, String label, int index) {
    final isActive = widget.selectedIndex == index;
    final color = isActive ? AppColors.black : AppColors.black36;
    return BottomNavigationBarItem(
      icon: InkWell(
          onTap: () {
            widget.onDestinationSelected(index);
          },
          child: Icon(
            icon,
            color: color,
          )),
      label: label,
    );
  }
}
