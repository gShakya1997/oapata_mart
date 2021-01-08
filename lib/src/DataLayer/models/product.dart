import 'package:oapata_mart/src/DataLayer/models/category.dart';
import 'package:oapata_mart/src/DataLayer/models/quantiyValue.dart';
import 'package:oapata_mart/src/DataLayer/models/supplier.dart';

class Product {
  String id;
  String name;
  String slug;
  Supplier supplier;
  List<Category> categoryList;
  String description;
  List<String> image;
  int moq;
  String unit;
  QuantiyValue quantiyValue;
  int discountRate;

  Product({
    this.id,
    this.name,
    this.slug,
    this.supplier,
    this.categoryList,
    this.description,
    this.image,
    this.moq,
    this.unit,
    this.quantiyValue,
    this.discountRate,
  });
}
