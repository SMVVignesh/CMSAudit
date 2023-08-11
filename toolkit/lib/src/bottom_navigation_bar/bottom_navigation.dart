import 'package:flutter/material.dart';

import 'model/bottom_navigation_model.dart';

/*
This class will have all method related to the BottomNavigationBar creation
 */
class BottomNavigation {
  /*
  This method is used to return the BottomNavigationBar widget
   */
  BottomNavigationBar getBottomNavigationBar(
      List<BottomNavigationModel> menus,
      int currentIndex,
      Color selectedItemColor,
      Color unSelectedItemColor,
      Function(int index) onTap) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: _getNavigationMenus(menus),
      currentIndex: currentIndex,
      selectedItemColor: selectedItemColor,
      unselectedItemColor: unSelectedItemColor,
      showUnselectedLabels: true,
      onTap: (int index) {
        onTap(index);
      },
    );
  }

/*
This method is used to create the list of BottomNavigationBarItem using the give inputs
 */
  List<BottomNavigationBarItem> _getNavigationMenus(
      List<BottomNavigationModel> menuValues) {
    List<BottomNavigationBarItem> menu = [];
    for (BottomNavigationModel item in menuValues) {
      menu.add(BottomNavigationBarItem(
        icon: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                item.icon,
                width: 24,
                height: 24,
              ),
            ),
            ((item.notificationCount ?? 0) > 0)
                ? Positioned(
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 14,
                        minHeight: 14,
                      ),
                      child: Center(
                        child: Text(
                          '${item.notificationCount}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
        activeIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(item.activeIcon, width: 15, height: 15),
        ),
        label: item.title,
      ));
    }

    return menu;
  }
}
