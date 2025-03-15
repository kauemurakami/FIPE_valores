// To parse this JSON data, do
//
//     final fipeValue = fipeValueFromJson(jsonString);

import 'dart:convert';

List<FipeValue> fipeValueFromJson(String str) =>
    List<FipeValue>.from(json.decode(str).map((x) => FipeValue.fromJson(x)));

String fipeValueToJson(List<FipeValue> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FipeValue {
  String? valor,
      marca,
      modelo,
      combustivel,
      codigoFipe,
      mesReferencia,
      siglaCombustivel,
      dataConsulta;
  int? anoModelo, tipoVeiculo;

  FipeValue({
    this.valor,
    this.marca,
    this.modelo,
    this.anoModelo,
    this.combustivel,
    this.codigoFipe,
    this.mesReferencia,
    this.tipoVeiculo,
    this.siglaCombustivel,
    this.dataConsulta,
  });

  factory FipeValue.fromJson(Map<String, dynamic> json) => FipeValue(
    valor: json["valor"],
    marca: json["marca"],
    modelo: json["modelo"],
    anoModelo: json["anoModelo"],
    combustivel: json["combustivel"],
    codigoFipe: json["codigoFipe"],
    mesReferencia: json["mesReferencia"],
    tipoVeiculo: json["tipoVeiculo"],
    siglaCombustivel: json["siglaCombustivel"],
    dataConsulta: json["dataConsulta"],
  );

  Map<String, dynamic> toJson() => {
    "valor": valor,
    "marca": marca,
    "modelo": modelo,
    "anoModelo": anoModelo,
    "combustivel": combustivel,
    "codigoFipe": codigoFipe,
    "mesReferencia": mesReferencia,
    "tipoVeiculo": tipoVeiculo,
    "siglaCombustivel": siglaCombustivel,
    "dataConsulta": dataConsulta,
  };
}
