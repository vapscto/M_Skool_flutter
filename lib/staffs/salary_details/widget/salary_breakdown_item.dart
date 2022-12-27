import 'package:flutter/material.dart';

class SalaryBreakDown extends StatelessWidget {
  const SalaryBreakDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Basic Pay",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          "30350",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .merge(const TextStyle(fontWeight: FontWeight.w600)),
        ),
      ],
    );
  }
}
