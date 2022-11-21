import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomAnalysisContainer extends StatelessWidget {
  final String title;
  final int amount;
  const CustomAnalysisContainer(
      {super.key, required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '₹$amount',
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                  ),
                ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: Color.fromRGBO(0, 0, 0, 0.5)),
                ),
          ),
        ],
      ),
    );
  }
}
