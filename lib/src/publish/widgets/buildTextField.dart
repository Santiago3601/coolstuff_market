import 'package:flutter/material.dart';
  
  Widget buildTextField(String label) {
    
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
