import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReceiptNoCard extends StatefulWidget {
  const ReceiptNoCard({super.key});

  @override
  State<ReceiptNoCard> createState() => _ReceiptNoCardState();
}

class _ReceiptNoCardState extends State<ReceiptNoCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            value: isChecked,
            onChanged: (value) {
              setState(
                () {
                  isChecked = value!;
                },
              );
            },
          ),
          Text('SF2212/22-23'),
        ],
      ),
    );
  }
}
