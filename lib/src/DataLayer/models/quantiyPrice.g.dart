// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quantiyPrice.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuantiyPrice _$QuantiyPriceFromJson(Map<String, dynamic> json) {
  return QuantiyPrice(
    from: json['from'] as int,
    to: json['to'] as int,
    price: json['price'],
  );
}

Map<String, dynamic> _$QuantiyPriceToJson(QuantiyPrice instance) =>
    <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
      'price': instance.price,
    };
