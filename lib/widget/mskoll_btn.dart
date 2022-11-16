import 'package:flutter/material.dart';

class MSkollBtn extends StatelessWidget {
  final String title;
  final Function() onPress;
  const MSkollBtn({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: onPress,
      child: Text(
        title,
        style: Theme.of(context).textTheme.labelSmall!.merge(
              const TextStyle(
                color: Colors.white,
                letterSpacing: 0.3,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
      ),
    );
  }
}
