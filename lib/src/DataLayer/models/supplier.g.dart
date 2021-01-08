// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Supplier _$SupplierFromJson(Map<String, dynamic> json) {
  return Supplier(
    id: json['id'] as String,
    location: json['location'] as String,
    name: json['name'] as String,
    user: json['user'] as String,
    logo: json['logo'] as String,
    backgroundImage: json['backgroundImage'] as String,
    createdAt: json['createdAt'] as String,
    website: json['website'] as String,
    verified: json['verified'] as String,
    legalDocuments:
        (json['legalDocuments'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SupplierToJson(Supplier instance) => <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'name': instance.name,
      'user': instance.user,
      'logo': instance.logo,
      'backgroundImage': instance.backgroundImage,
      'createdAt': instance.createdAt,
      'website': instance.website,
      'verified': instance.verified,
      'legalDocuments': instance.legalDocuments,
    };
