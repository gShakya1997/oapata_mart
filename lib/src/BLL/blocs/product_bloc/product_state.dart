part of 'product_bloc.dart';

@immutable
abstract class ProductState {
  const ProductState();
}

class ProductInitial extends ProductState {
  const ProductInitial();
}

class ProductLoading extends ProductState {
  const ProductLoading();
}

class ProductLoaded extends ProductState {
  final List<Product> products;

  const ProductLoaded({this.products});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is ProductLoaded && o.products == products;
  }

  @override
  int get hashCode => products.hashCode;
}
