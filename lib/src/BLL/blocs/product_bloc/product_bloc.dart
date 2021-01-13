import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:oapata_mart/src/DataLayer/models/product.dart';
import 'package:oapata_mart/src/DataLayer/resources/repository.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  Repository repository;

  ProductBloc({@required this.repository}) : super(ProductInitial());

  ProductState get intialState => ProductInitial();

  @override
  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    yield LoadingProducts();
    var products = await repository.fetchAllProducts();
    yield LoadProduct(products: products);
  }
}
