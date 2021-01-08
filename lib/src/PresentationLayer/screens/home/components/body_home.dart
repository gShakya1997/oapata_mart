import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oapata_mart/src/BLL/blocs/category_bloc/category_bloc.dart';
import 'package:oapata_mart/src/BLL/blocs/product_bloc/product_bloc.dart';
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
            Divider(
              color: kPrimaryColor,
              thickness: 2.0,
            ),
            Text(
              'Deal of the day',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: kPrimaryColor,
              thickness: 2.0,
            ),
            _buildProductList(),
            Divider(
              color: kPrimaryColor,
              thickness: 2.0,
            ),
            Text(
              'Clothing',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: kPrimaryColor,
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildProductList() {
  return BlocBuilder<ProductBloc, ProductState>(
    builder: (context, state) {
      if (state is LoadingProducts) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadProduct) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          height: 300,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(2),
                      ),
                      border: Border.all(color: kPrimaryColor),
                    ),
                    child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border_outlined,
                            color: kPrimaryColor,
                          ),
                          onPressed: () {},
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: 500,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.network(
                                  state.products[index].image[0],
                                  height: 100,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${state.products[index].quantiyValue.price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kPrimaryColor,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '${state.products[index].quantiyValue.from}',
                                    ),
                                    Text(' - '),
                                    Text(
                                      '${state.products[index].quantiyValue.to}',
                                    ),
                                    SizedBox(height: 10.0),
                                    Text(
                                      '${state.products[index].name}',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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

Widget _buildCategories() {
  return BlocBuilder<CategoryBloc, CategoryState>(
    builder: (context, state) {
      if (state is Loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadCategory) {
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
        return Container();
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
