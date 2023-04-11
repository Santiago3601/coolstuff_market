import 'package:flutter/material.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/product_card.dart';
import 'bottom_navigation_bar.dart';
import 'widgets/app_bar.dart';

String searchText = '';

class dashb extends StatelessWidget {
  const dashb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            const SearchBar(),
            Container(
              width: 100,
              height: 20,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            const ProductCard(
                imagePath: 'assets/images/productos/cafe1.png',
                productTitle: 'CAFETERA DE ALUMINIO',
                borderColor: Color.fromARGB(255, 1, 16, 85)),
            const ProductCard(
                imagePath: 'assets/images/productos/cafe2.png',
                productTitle: 'CAFETERA DE VIDRIO',
                borderColor: Color.fromARGB(255, 1, 16, 85)),
            const ProductCard(
                imagePath: 'assets/images/productos/saco1.jpg',
                productTitle: 'CAMISA POLO ALGODÓN',
                borderColor: Color.fromARGB(255, 1, 16, 85)),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
