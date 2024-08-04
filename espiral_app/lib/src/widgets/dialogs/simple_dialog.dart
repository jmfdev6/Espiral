import 'package:flutter/material.dart';
 String? title;
class SimpleDialogTitle extends StatelessWidget {
  const SimpleDialogTitle({super.key, title});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16),
      child: Text(
        'criar escala',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}