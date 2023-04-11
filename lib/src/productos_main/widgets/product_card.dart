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
      color: Colors.grey,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < 3; i++)
                Image.asset(
                  imagePath,
                  height: 105,
                  width: 105,
                  fit: BoxFit.cover,
                ),
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
            ],
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productTitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
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