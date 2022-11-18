import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ResultAnalysisItem extends StatelessWidget {
  final Color color;
  final String type;
  const ResultAnalysisItem(
      {super.key, required this.color, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              12.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  backgroundColor: color,
                  label: Text(type),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
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
                    Column(
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
                          style: Theme.of(context).textTheme.titleMedium!.merge(
                              const TextStyle(
                                  fontSize: 20.0, color: Color(0xFF0F8D85))),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.5,
            height: 1.5,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Expanded(
                    flex: 1,
                    child: MarksAnalysisItem(
                      marks: "20",
                      title: "Class Highest",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MarksAnalysisItem(
                      marks: "18",
                      title: "Section Highest",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MarksAnalysisItem(
                      marks: "14.5",
                      title: "Section Average",
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: MarksAnalysisItem(
                      marks: "12.5",
                      title: "Class Average",
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class MarksAnalysisItem extends StatelessWidget {
  final String marks;
  final String title;
  const MarksAnalysisItem({
    Key? key,
    required this.marks,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(
        marks,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      const SizedBox(
        height: 6.0,
      ),
      Text(
        title,
        //maxLines: 2,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleSmall!.merge(
              TextStyle(
                // fontSize: Get.width * 0.0287,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade700,
                letterSpacing: 0.2,
              ),
            ),
      )
    ]);
  }
}
