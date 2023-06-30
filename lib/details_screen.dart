import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String? id;
  const DetailsScreen({this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: id != null
              ? Text('List Item $id details')
              : const SizedBox.shrink()),
      body: Container(color: Colors.green[100]),
    );
  }
}
