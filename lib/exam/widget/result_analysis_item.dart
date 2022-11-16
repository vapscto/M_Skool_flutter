import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ResultAnalysisItem extends StatelessWidget {
  final Color color;
  final String type;
  const ResultAnalysisItem(
      {super.key, required this.color, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        12.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.4),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Chip(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            backgroundColor: color,
            label: Text(type),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mark Obtained",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "10",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .merge(const TextStyle(fontSize: 20.0)),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Grade",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      "A+",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .merge(const TextStyle(fontSize: 20.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
