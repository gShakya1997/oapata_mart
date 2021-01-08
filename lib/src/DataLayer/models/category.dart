import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(nullable: false)
class Category {
  String id;
  String name;
  String slug;
  String backgroundImg;
  String icon;

  Category({
    this.id,
    this.name,
    this.slug,
    this.backgroundImg,
    this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
