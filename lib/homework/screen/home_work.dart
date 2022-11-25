import 'package:flutter/material.dart';

import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/homework/screen/hwcw_detail_screen.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class HomeWorkScreen extends StatelessWidget {
  const HomeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "October, 2022",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 24.0,
            ),
            SizedBox(
                height: 100,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 4,
                              color: Colors.black12,
                            )
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${index + 1}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Mon",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    );
                  },
                  // itemCount: DateTime.now()
                  //     .difference(DateTime(
                  //         DateTime.now().year, DateTime.now().month + 1, 1))
                  //     .inDays,
                  itemCount: 30,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      width: 12.0,
                    );
                  },
                )),
            const SizedBox(
              height: 24.0,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const HwCwDetailScreen(
                    topic: '',
                    assignment: '',
                    date: '',
                    subject: '',
                  );
                }));
              },
              child: const HwCwItem(
                sub: "",
                topic: "",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HwCwItem extends StatelessWidget {
  final String sub;
  final String topic;
  const HwCwItem({
    Key? key,
    required this.sub,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: colors.elementAt(2).withOpacity(0.05),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 10,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sub,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    topic,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 12.0,
            )
          ],
        ),
      ),
    );
  }
}
