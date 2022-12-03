import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomDetailWidget extends StatelessWidget {
  final String title;
  final double amount;
  const CustomDetailWidget(
      {super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              '₹$amount',
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                        color: Colors.black),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
