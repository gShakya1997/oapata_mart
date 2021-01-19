import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oapata_mart/src/BLL/blocs/product_bloc/product_bloc.dart';
import 'package:oapata_mart/src/constants.dart';

class ProductDetailScreen extends StatelessWidget {
  final String productId;

  const ProductDetailScreen({
    Key key,
    @required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(context).add(
      GetProductById(productId: "5fbfcdc8b86c2cbf8353098d"),
    );
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductLoadedById) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.60,
                    color: kPrimaryColor,
                    child: Stack(
                      children: [
                        Positioned(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.60,
                          top: 0,
                          child: Transform.scale(
                            scale: 1.1,
                            child: Container(
                              child: Hero(
                                tag: state.product.id,
                                child: Image.network(
                                  state.product.image[0],
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Text("Null"),
            );
          }
        },
      ),
    );
  }
}
