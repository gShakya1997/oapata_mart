import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

part 'quantiyPrice.g.dart';

@JsonSerializable(explicitToJson: true)
class QuantiyPrice {
  int from;
  int to;
  Float price;

  QuantiyPrice({
    this.from,
    this.to,
    this.price,
  });

  factory QuantiyPrice.fromJson(Map<String, dynamic> json) =>
      _$QuantiyPriceFromJson(json);

  Map<String, dynamic> toJson() => _$QuantiyPriceToJson(this);
}
