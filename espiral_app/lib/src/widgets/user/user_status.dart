import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final String imageUrl;

  const UserTile({super.key, required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(width: 5),
        Text(name),
      ],
    );
  }
}