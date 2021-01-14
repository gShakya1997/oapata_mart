import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oapata_mart/src/BLL/blocs/category_bloc/category_bloc.dart';
import 'package:oapata_mart/src/BLL/blocs/product_bloc/product_bloc.dart';
import 'package:oapata_mart/src/PresentationLayer/screens/widgets/divider_category.dart';
import 'package:oapata_mart/src/PresentationLayer/screens/widgets/product_card.dart';
import 'package:oapata_mart/src/constants.dart';

class BodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            _search(),
            _buildCategories(),
            DividerCategory(title: 'Deal of the day'),
            _buildAllProductList(context),
            DividerCategory(title: 'Clothing'),
            _buildAllProductList(context),
          ],
        ),
      ),
    );
  }
}

Widget _buildProductListByCategory(BuildContext context) {
  return BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProductLoaded) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          height: 264,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                productName: state.products[index].name,
                productFrom: state.products[index].quantiyPrice.from,
                productImageLink: state.products[index].image[0],
                productPrice: state.products[index].quantiyPrice.price,
                productTo: state.products[index].quantiyPrice.to,
              );
            },
          ),
        );
      } else if (state is ProductLoadedByCategoryIds) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          height: 264,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                productName: state.products[index].name,
                productFrom: state.products[index].quantiyPrice.from,
                productImageLink: state.products[index].image[0],
                productPrice: state.products[index].quantiyPrice.price,
                productTo: state.products[index].quantiyPrice.to,
              );
            },
          ),
        );
      } else {
        return Container(
          child: Text('NULL'),
        );
      }
    },
  );
}

Widget _buildAllProductList(BuildContext context) {
  BlocProvider.of<ProductBloc>(context).add(
    GetAllProduct(),
  );
  return BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
      if (state is ProductLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ProductLoaded) {
        BlocProvider.of<ProductBloc>(context).add(
          GetProductByCategoryId(categoryIds: "5fbfc8cbb86c2cbf83530981"),
        );
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          height: 264,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                productName: state.products[index].name,
                productFrom: state.products[index].quantiyPrice.from,
                productImageLink: state.products[index].image[0],
                productPrice: state.products[index].quantiyPrice.price,
                productTo: state.products[index].quantiyPrice.to,
              );
            },
          ),
        );
      } else if (state is ProductLoadedByCategoryIds) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          height: 264,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                productName: state.products[index].name,
                productFrom: state.products[index].quantiyPrice.from,
                productImageLink: state.products[index].image[0],
                productPrice: state.products[index].quantiyPrice.price,
                productTo: state.products[index].quantiyPrice.to,
              );
            },
          ),
        );
      } else {
        return Container(
          child: Text('NULL'),
        );
      }
    },
  );
}

Widget _buildCategories() {
  return BlocBuilder<CategoryBloc, CategoryState>(
    builder: (context, state) {
      if (state is CategoryLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CategoryLoaded) {
        return Container(
          height: 80.0,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 10,
                          spreadRadius: 5,
                          offset: Offset(5, 5),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            state.categories[index].icon,
                          ),
                          SizedBox(width: 5.0),
                          Text(
                            '${state.categories[index].name}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      } else {
        return Container(
          child: Text('Null'),
        );
      }
    },
  );
}

Widget _search() {
  return Container(
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search Products",
                  hintStyle: TextStyle(fontSize: 12),
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                  prefixIcon: Icon(Icons.search, color: Colors.black54)),
            ),
          ),
        ),
      ],
    ),
  );
}
