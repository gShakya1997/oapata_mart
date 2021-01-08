import 'package:json_annotation/json_annotation.dart';
import 'package:oapata_mart/src/DataLayer/models/quantiyPrice.dart';
import 'package:oapata_mart/src/DataLayer/models/supplier.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  String id;
  String name;
  String slug;
  Supplier supplier;
  String description;
  List<dynamic> image;
  int moq;
  String unit;
  QuantiyPrice quantiyPrice;
  int discountRate;

  Product({
    this.id,
    this.name,
    this.slug,
    this.supplier,
    this.description,
    this.image,
    this.moq,
    this.unit,
    this.quantiyPrice,
    this.discountRate,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
