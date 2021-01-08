import 'package:json_annotation/json_annotation.dart';

part 'supplier.g.dart';

@JsonSerializable(explicitToJson: true)
class Supplier {
  String id;
  // String location;
  String name;

  Supplier({
    this.id,
    this.name,
  });
  // String user;
  // String logo;
  // String backgroundImage;
  // String createdAt;
  // String website;
  // String verified;
  // List<String> legalDocuments;

  factory Supplier.fromJson(Map<String, dynamic> json) =>
      _$SupplierFromJson(json);

  Map<String, dynamic> toJson() => _$SupplierToJson(this);
}
