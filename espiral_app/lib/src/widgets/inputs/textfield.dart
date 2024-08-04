import 'package:flutter/material.dart';

class TextfieldCustom extends StatefulWidget {
  const TextfieldCustom({super.key, required this.label});
  final String label;
  @override
  State<TextfieldCustom> createState() => _TextfieldCustomState();
}

class _TextfieldCustomState extends State<TextfieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}