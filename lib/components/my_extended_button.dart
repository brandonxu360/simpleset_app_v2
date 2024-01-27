import 'package:flutter/material.dart';

/*
  Button class for a button with a label and icon
*/
class MyExtendedButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final void Function()? onTap;

  const MyExtendedButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Wrap in row to shrinkwrap button around children
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(12)),
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 35),
            margin: const EdgeInsets.only(left: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [icon, Text(label)]),
          ),
        ),
      ],
    );
  }
}
