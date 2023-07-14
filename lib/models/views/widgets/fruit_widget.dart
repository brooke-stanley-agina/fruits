import 'package:flutter/material.dart';
import 'package:fruits/models/fruit.dart';

class FruitItem extends StatelessWidget {
  final Fruit item;
  const FruitItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: <Widget>[
            Image.network(item.imageUrl.toString()),
            Expanded(
                child: Container(
              child: Column(
                children: <Widget>[
                  Text("${item.id}"),
                  Text("${item.title}"),
                  Text("${item.quantity}")
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
