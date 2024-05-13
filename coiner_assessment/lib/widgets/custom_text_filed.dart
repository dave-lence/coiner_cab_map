import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.prefixIcon,
    required this.hintText
  });

  final controller;
  final Function(String)? onChanged;
  final Icon prefixIcon;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: hintText,
          focusedBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          borderSide:  BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.inversePrimary,
              style: BorderStyle.solid,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
