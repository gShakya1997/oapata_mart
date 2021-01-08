// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    supplier: json['supplier'] == null
        ? null
        : Supplier.fromJson(json['supplier'] as Map<String, dynamic>),
    description: json['description'] as String,
    image: json['image'] as List,
    moq: json['moq'] as int,
    unit: json['unit'] as String,
    quantiyPrice: json['quantiyPrice'] == null
        ? null
        : QuantiyPrice.fromJson(json['quantiyPrice'] as Map<String, dynamic>),
    discountRate: json['discountRate'] as int,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'supplier': instance.supplier,
      'description': instance.description,
      'image': instance.image,
      'moq': instance.moq,
      'unit': instance.unit,
      'quantiyPrice': instance.quantiyPrice,
      'discountRate': instance.discountRate,
    };
