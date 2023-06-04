import 'package:flutter/material.dart';

class PlaceListItem extends StatelessWidget {
  const PlaceListItem(
      {super.key,
      required this.displayName,
      required this.onTap,
      required this.icon});
  final String displayName;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        icon,
        errorBuilder: (_, __, ___) {
          return const Icon(Icons.warning_amber_rounded);
        },
      ),
      title: Text(displayName),
      onTap: onTap,
    );
  }
}
