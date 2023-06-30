import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_adaptive_scaffold_example/nav_destinations.dart';
import 'package:go_router/go_router.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? secondaryBody;

  const AppScaffold({
    Key? key,
    required this.body,
    this.secondaryBody,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (_) => secondaryBody != null ? secondaryBody! : body,
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('Body Medium'),
            builder: (_) => body,
          )
        },
      ),
      secondaryBody: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('Body Small'),
            builder: null,
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('Body Medium'),
            builder: secondaryBody != null
                ? (_) => secondaryBody!
                : AdaptiveScaffold.emptyBuilder,
          )
        },
      ),
    );
  }
}

class AppScaffoldShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppScaffoldShell({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      useDrawer: false,
      selectedIndex: navigationShell.currentIndex,
      onSelectedIndexChange: (int index) =>
          context.go('/${NavDestination.values[index].name}'),
      destinations: NavDestination.values
          .map(
            (e) => NavigationDestination(
              icon: Icon(e.icon),
              label: e.label,
            ),
          )
          .toList(),
      body: (_) => navigationShell,
    );
  }

  void onNavigationEvent(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
