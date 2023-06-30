import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavListScreen extends StatelessWidget {
  final int listId;
  final String? selectedIndex;
  const NavListScreen({required this.listId, this.selectedIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red[200],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nav Item $listId',
                style: Theme.of(context).textTheme.headlineLarge),
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, i) => Card(
                  child: ListTile(
                    title: Text('List Item ${i + 1}'),
                    selected: (i + 1).toString() == selectedIndex,
                    onTap: () =>
                        context.goNamed('nav${listId}Details', pathParameters: {
                      "id": "${i + 1}",
                    }),
                  ),
                ),
                separatorBuilder: (context, i) => const SizedBox(height: 8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
