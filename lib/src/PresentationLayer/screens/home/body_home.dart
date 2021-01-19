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
      child: Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: _search(),
          ),
          _buildCategories(),
          DividerCategory(title: 'Deal of the day'),
          _buildAllProductList(context),
        ],
      ),
    );
  }
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
        return GridView.count(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          childAspectRatio: (MediaQuery.of(context).size.width / 2) /
              (MediaQuery.of(context).size.height / 3),
          crossAxisCount: 2,
          children: _getProductTitles(state.products),
        );
      } else {
        return Container(
          child: Text('NULL'),
        );
      }
    },
  );
}

List<Widget> _getProductTitles(List<dynamic> productStates) {
  final List<Widget> tiles = <Widget>[];
  for (int i = 0; i < productStates.length; i++) {
    tiles.add(
      GridTile(
        child: InkResponse(
          enableFeedback: true,
          child: ProductCard(
            productName: productStates[i].name,
            productFrom: productStates[i].quantiyPrice.from,
            productImageLink: productStates[i].image[0],
            productPrice: productStates[i].quantiyPrice.price,
            productTo: productStates[i].quantiyPrice.to,
          ),
          onTap: () => debugPrint(
            "You tapped on item ${productStates[i].id}",
          ),
        ),
      ),
    );
  }
  return tiles;
}

Widget _buildCategories() {
  return BlocBuilder<CategoryBloc, CategoryState>(
    builder: (context, state) {
      if (state is CategoryLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is CategoryLoaded) {
        return GridView.count(
          shrinkWrap: true,
          childAspectRatio: (MediaQuery.of(context).size.width / 2) /
              (MediaQuery.of(context).size.height / 3),
          crossAxisCount: 4,
          children: List.generate(
            7,
            (index) => Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Container(
                  height: 80,
                  width: 80,
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.network(
                          state.categories[index].icon,
                        ),
                      ),
                      Divider(),
                      Text(
                        "${state.categories[index].name}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
