import 'package:flutter/material.dart';
class SectionHeader extends StatelessWidget {
  final String tittle;
  final String actions;

  const SectionHeader({
    super.key,
    required this.tittle,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tittle,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          actions,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(),
        )
      ],
    );
  }
}