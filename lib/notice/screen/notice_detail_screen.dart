import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:readmore/readmore.dart';

class NoticeDetailScreen extends StatefulWidget {
  const NoticeDetailScreen({super.key});

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: Text("Cultural Activities"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: CustomThemeData.getShadow(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cultural Activities",
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  ReadMoreText(
                    "India, officially the Republic of India (Hindi: Bhārat Gaṇarājya),[25] is a country in South Asia. It is the seventh-largest country by area, the second-most populous country, and the most populous democracy in the world. Bounded by the Indian Ocean on the south, the Arabian Sea on the southwest, and the Bay of Bengal on the southeast, it shares land borders with Pakistan to the west;[f] China, Nepal, and Bhutan to the north; and Bangladesh and Myanmar to the east. In the Indian Ocean, India is in the vicinity of Sri Lanka and the Maldives; its Andaman and Nicobar Islands share a maritime border with Thailand, Myanmar, and Indonesia. The nation's capital city is New Delhi. Modern humans arrived on the Indian subcontinent from Africa no later than 55,000 years ago.[26][27][28] Their long occupation, initially in varying forms of isolation as hunter-gatherers, has made the region highly diverse, second only to Africa in human genetic diversity.[29] Settled life emerged on the subcontinent in the western margins of the Indus river basin 9,000 years ago, evolving gradually into the Indus Valley Civilisation of the third millennium BCE.[30]",
                    style: Theme.of(context).textTheme.labelSmall!.merge(
                          const TextStyle(
                            fontSize: 16,
                            letterSpacing: 0.3,
                            height: 1.4,
                          ),
                        ),
                    trimExpandedText: " Read Less",
                    trimCollapsedText: "Read More",
                    moreStyle: const TextStyle(color: Color(0xFFF97A33)),
                    lessStyle: const TextStyle(color: Color(0xFFF97A33)),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Start Date",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      Text(":"),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          "29-11-2021",
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
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "End Date",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      const Text(":"),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          "30-11-2021",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
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
                      Text(":"),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          "https://www.google.com/search?q=elon+musk&rlz=1C1RXQR_enIN1024IN1024&oq=Elon",
                          maxLines: 2,
                          style: const TextStyle(color: Color(0xFF35658F)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/pdf.svg',
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Download",
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                                const TextStyle(
                                  color: Color(0xFF35658F),
                                  letterSpacing: 0.3,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
