part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class GetAllProduct extends ProductEvent {}

class GetProductByCategoryId extends ProductEvent{
  final String categoryIds;

  GetProductByCategoryId({this.categoryIds});
}
