import 'package:flutter/material.dart';

/*
  Circular back button
  Takes an onTap function parameter
*/
class MyBackButton extends StatelessWidget {
  final Function()? onTap;
  const MyBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Theme.of(context).colorScheme.primaryContainer,
      // Splash effect
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap, // Use the onTap function directly
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
    );
  }
}
