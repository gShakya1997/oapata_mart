part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingProducts extends ProductState {}

class LoadProduct extends ProductState {
  final List<Product> products;

  LoadProduct({this.products});
}
