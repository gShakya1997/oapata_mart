import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oapata_mart/src/DataLayer/models/product.dart';
import 'package:oapata_mart/src/DataLayer/resources/product_repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository productRepository;

  ProductBloc({@required this.productRepository}) : super(ProductInitial());

  ProductState get intialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if (event is GetAllProduct) {
      yield ProductLoading();
      var products = await productRepository.fetchAllProducts();
      yield ProductLoaded(products: products);
    } else if (event is GetProductByCategoryId) {
      yield ProductLoading();
      var productsByCategoryId =
          await productRepository.fetchProductsByCategoryId(event.categoryIds);
      yield ProductLoadedByCategoryIds(products: productsByCategoryId);
    } else if (event is GetProductById) {
      yield ProductLoading();
      var productById =
          await productRepository.fetchProductById(event.productId);
      yield ProductLoadedById(product: productById);
    }
  }
}
