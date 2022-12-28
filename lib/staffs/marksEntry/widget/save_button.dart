import 'package:flutter/material.dart';

class SaveBtn extends StatefulWidget {
  final String title;
  final Function() onPress;
  const SaveBtn({super.key, required this.title, required this.onPress});

  @override
  State<SaveBtn> createState() => _SaveBtnState();
}

class _SaveBtnState extends State<SaveBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 2.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      onPressed: widget.onPress,
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.labelSmall!.merge(
              TextStyle(
                color: Theme.of(context).primaryColor,
                letterSpacing: 0.3,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
      ),
    );
  }
}
