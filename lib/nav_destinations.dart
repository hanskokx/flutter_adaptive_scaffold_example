import 'package:flutter/material.dart';

enum NavDestination {
  nav1(
    "Nav 1",
    Icons.numbers,
  ),
  nav2(
    "Nav 2",
    Icons.abc,
  ),
  nav3(
    "Nav 3",
    Icons.account_box_rounded,
  ),
  ;

  final String label;
  final IconData icon;

  const NavDestination(
    this.label,
    this.icon,
  );
}
