import 'package:flutter/material.dart';
import 'package:fruits/models/fruit.dart';
import 'package:fruits/models/views/widgets/fruit_widget.dart';

class FriutList extends StatelessWidget {
  final List<Fruit>? items;
  const FriutList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items!.length,
        itemBuilder: (context, index) {
          return FruitItem(item: items![index]);
        });
  }
}
