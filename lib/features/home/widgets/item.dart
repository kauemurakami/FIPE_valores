import 'package:fipe_valor/data/models/fipe_value.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.value});
  final FipeValue value;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16.0,
            children: [
              Row(
                spacing: 4.0,
                children: [
                  Text('Marca:', style: TextStyle(fontWeight: FontWeight.w700)),
                  Text('${value.marca}'),
                ],
              ),
              Row(
                spacing: 4.0,
                children: [
                  Text(
                    'Modelo:',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Text('${value.modelo}'),
                ],
              ),
            ],
          ),
          Row(
            spacing: 4.0,
            children: [
              Text('Ano:', style: TextStyle(fontWeight: FontWeight.w700)),
              Text('${value.anoModelo}'),
            ],
          ),
          Row(
            spacing: 4.0,
            children: [
              Text(
                'Combustível:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text('${value.combustivel}'),
            ],
          ),
          Row(
            spacing: 4.0,
            children: [
              Text(
                'Código FIPE:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text('${value.codigoFipe}'),
            ],
          ),
          Row(
            spacing: 4.0,
            children: [
              Text('Preço:', style: TextStyle(fontWeight: FontWeight.w700)),
              Text('${value.valor}'),
            ],
          ),
          Row(
            spacing: 4.0,
            children: [
              Text(
                'Data referência:',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Flexible(child: Text('${value.dataConsulta}')),
            ],
          ),
        ],
      ),
    );
  }
}
