import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class HwCwDetailScreen extends StatelessWidget {
  final String subject;
  final String topic;
  final String assignment;
  final String date;
  final String? url;
  final String? attachmentType;
  final String? attachmentName;
  final String? attachmentUrl;
  const HwCwDetailScreen(
      {super.key,
      required this.subject,
      required this.topic,
      required this.assignment,
      required this.date,
      this.url,
      this.attachmentType,
      this.attachmentName,
      this.attachmentUrl});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(date);
    return Scaffold(
      appBar: const CustomAppBar(title: "English").getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Subject",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    subject,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Topic",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    topic,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Assignment",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    assignment,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Date",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "URL",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    "https://www.google.com/search?q=elon+musk&rlz=1C1RXQR_enIN1024IN1024&oq=Elon",
                    maxLines: 2,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.image_outlined,
                        color: Theme.of(context).primaryColor,
                      ),
                      visualDensity: const VisualDensity(
                        horizontal: VisualDensity.minimumDensity,
                      ),
                      minLeadingWidth: 24,
                      title: const Text("Screenshot.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 36.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: const Color(0xFFD9EDFF)),
                  child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/svg/download.svg',
                        color: Theme.of(context).primaryColor,
                        height: 20.0,
                      )),
                )
                // ElevatedButton(
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor:
                //         Theme.of(context).colorScheme.secondary,
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 24, vertical: 12.0),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30.0),
                //     ),
                //   ),
                //   onPressed: () {},
                //   child: Text(
                //     "Download",
                //     style: Theme.of(context).textTheme.labelSmall!.merge(
                //           const TextStyle(
                //             color: Color(0xFF35658F),
                //             letterSpacing: 0.3,
                //             fontSize: 16,
                //             fontWeight: FontWeight.w700,
                //           ),
                //         ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            MSkollBtn(
              title: "Upload",
              onPress: () {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    context: context,
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    padding: const EdgeInsets.all(16.0)),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Camera",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    padding: const EdgeInsets.all(16.0)),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Gallery",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(
                                        const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
