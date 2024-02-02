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
        Material(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.primaryContainer,
          child: InkWell(
            customBorder:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onTap: onTap,
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(label), const SizedBox(width: 10), icon]),
            ),
          ),
        ),
      ],
    );
  }
}
