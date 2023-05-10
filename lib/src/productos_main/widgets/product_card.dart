import 'package:flutter/material.dart';
import 'package:coolstuff_market/src/productos_spec/prod_spec.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productTitle;
  final Color borderColor;

  const ProductCard({
    Key? key,
    required this.imagePath,
    required this.productTitle,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: ShapeDecoration(
                      color: borderColor,
                      shape: CircleBorder(),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        primary: borderColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => prod_spec()),
                        );
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ),
                  ),
                  Text(
                    'Ver más',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue[900],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productTitle,
              style: TextStyle(
                fontSize: 26,
                color: Colors.blue[900],
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
