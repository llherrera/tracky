import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: const Color(0xFFE0EDF6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: 'Search',
      )
    );
  }
}