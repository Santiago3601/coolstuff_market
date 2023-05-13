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
    List<ProductCard> products = [
      const ProductCard(
          imagePath: 'assets/images/productos/cafe1.png',
          productTitle: 'CAFETERA DE ALUMINIO',
          borderColor: Color.fromARGB(255, 1, 16, 85)),
      const ProductCard(
          imagePath: 'assets/images/productos/vidrio1.png',
          productTitle: 'CAFETERA DE VIDRIO',
          borderColor: Color.fromARGB(255, 1, 16, 85)),
      const ProductCard(
          imagePath: 'assets/images/productos/saco1.jpg',
          productTitle: 'CAMISA POLO ALGODÓN',
          borderColor: Color.fromARGB(255, 1, 16, 85)),
    ];

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CustomAppBar(),
        drawer: Drawer(
          child: Container(
            color: Colors.grey[200],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Categorías',
                      style: TextStyle(color: Color.fromARGB(255, 1, 16, 85), fontSize: 24),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/productos/imagenproductos.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                menuItem(context, 'Electrónicos', Icons.electrical_services),
                dividerItem(),
                menuItem(context, 'Ropa', Icons.shopping_bag),
                dividerItem(),
                menuItem(context, 'Hogar', Icons.home),
                dividerItem(),
                menuItem(context, 'Deportes', Icons.sports),
                dividerItem(),
                menuItem(context, 'Cerrar Sesión', Icons.logout),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            const SearchBar(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  return products[index];
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }

    Widget menuItem(BuildContext context, String title, IconData icon) {
    return Builder(
      builder: (BuildContext innerContext) {
        return ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.pop(innerContext);
            handleCategoryAction(innerContext, title);
          },
        );
      },
    );
  }


  Widget dividerItem() {
    return Divider(
      color: Color.fromARGB(255, 1, 16, 85),
      thickness: 1.0,
    );
  }

  void handleCategoryAction(BuildContext context, String title) {
  switch (title) {
    case 'Electrónicos':
      
      break;
    case 'Ropa':
      
      break;
    case 'Hogar':
      
      break;
    case 'Deportes':
      
      break;
    case 'Cerrar Sesión':
      // Acción para cerrar sesión
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Se ha cerrado la sesión'),
        ),
      );
      return; // Regresar después de mostrar el mensaje de cerrar sesión
    default:
      // Acción predeterminada para las demás categorías
      break;
  }

  if (title != 'Cerrar Sesión') {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Categoría seleccionada: $title'),
      ),
    );
  }
}
}