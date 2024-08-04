import 'package:flutter/material.dart';

class FullScreenDialogTitle extends StatelessWidget {
  final String title;
  const FullScreenDialogTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(

      centerTitle: false,
      leading: IconButton(
        icon: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}