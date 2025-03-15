import 'package:fipe_valor/data/models/fipe_value.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.value});
  final FipeValue value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${value.marca}'),
          Text('${value.marca}'),
          Text('${value.marca}'),
          Text('${value.marca}'),
          Text('${value.marca}'),
          Text('${value.marca}'),
        ],
      ),
    );
  }
}
