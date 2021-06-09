import 'package:flutter/material.dart';
import 'package:galaxy_shop_1/screens/search.dart';
import 'package:galaxy_shop_1/widgets/Products_grid.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

import 'Cart.dart';

// ignore: must_be_immutable
class ProductsOverviewScreen extends StatefulWidget {
  final int currentPage;
  ProductsOverviewScreen(this.currentPage);
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState(currentPage);
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  int currentPage;
  _ProductsOverviewScreenState(this.currentPage);

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: currentPage == 0 ? ProductsGrid() : currentPage == 1
            ? MyCart()
            : PageSearch(),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: currentPage,
        key: bottomNavigationKey,
        circleColor: Colors.blue,
        inactiveIconColor: Colors.white,
        barBackgroundColor: Colors.lightBlueAccent,
        tabs: [
          TabData(
            iconData: Icons.home_outlined,
            title: 'home',
            onclick: () {},
          ),
          TabData(
            iconData: Icons.shopping_cart,
            title: 'Cart',
            onclick: () {},

          ),
          TabData(
            iconData: Icons.search,
            title: 'Search',
            onclick: () {},
          ),
        ],
        onTabChangedListener: (indexPage){
          setState(() {
            currentPage = indexPage;
          });
        },
      ),
    );
  }
}

