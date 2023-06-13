import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(title),
            ),
            child: SafeArea(child: child),
          )
        : Scaffold(
            appBar: AppBar(title: Text(title)),
            body: SafeArea(child: child),
          );
  }
}

class MyTabScaffold extends StatelessWidget {
  const MyTabScaffold({
    super.key,
    required this.title,
    required this.pageBuilder,
    required this.navItems,
    required this.currentPageIndex,
    required this.onNavItemTap,
  });

  final String title;
  final Widget Function(int) pageBuilder;
  final List<BottomNavigationBarItem> navItems;
  final int currentPageIndex;
  final void Function(int) onNavItemTap;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(middle: Text(title)),
            child: CupertinoTabScaffold(
              tabBar: CupertinoTabBar(
                items: navItems,
                currentIndex: currentPageIndex,
                onTap: onNavItemTap,
              ),
              tabBuilder: (context, index) =>
                  SafeArea(child: pageBuilder(index)),
            ),
          )
        : Scaffold(
            appBar: AppBar(title: Text(title)),
            body: SafeArea(child: pageBuilder(currentPageIndex)),
            bottomNavigationBar: BottomNavigationBar(
              items: navItems,
              currentIndex: currentPageIndex,
              onTap: onNavItemTap,
            ),
          );
  }
}
