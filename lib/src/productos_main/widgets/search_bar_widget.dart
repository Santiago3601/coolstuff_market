import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 189, 188, 188),
        hintText: 'Buscar Articulos',
        hintStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: const Color.fromARGB(255, 141, 141, 141),
          size: 20, // Reducir el tamaño del ícono de búsqueda
        ),
        suffixIcon: const Icon(
          Icons.filter_list,
          color: const Color.fromARGB(255, 141, 141, 141),
          size: 20, // Reducir el tamaño del ícono de filtro
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
        ), // Ajustar la altura de la caja de texto
      ),
      textAlign: TextAlign.center,
      onTap: () {},
    );
  }
}
