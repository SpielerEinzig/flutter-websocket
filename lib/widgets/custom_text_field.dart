import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String label,
  required Function(String) onSubmitted,
}) {
  return TextField(
    controller: controller,
    onSubmitted: onSubmitted,
    decoration: InputDecoration(
      focusColor: Colors.blue,
      focusedBorder: const OutlineInputBorder(),
      enabledBorder: const OutlineInputBorder(),
      labelText: label,
    ),
  );
}
