import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class FeedBackHome extends StatefulWidget {
  const FeedBackHome({super.key});

  @override
  State<FeedBackHome> createState() => _FeedBackHomeState();
}

class _FeedBackHomeState extends State<FeedBackHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text("Feedback".tr),
        leading: const CustomGoBackButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.secondary,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {},
              child: Text(
                "View Feedback",
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: CustomThemeData.getShadow(),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/vpslogo.png',
                          height: 36,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "VAPS International School".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .merge(const TextStyle(color: Color(0xFF35658F))),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          "Please Complete This Form To Report The Feedback And Issue To Vaps Technosoft - School",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium!.merge(
                                const TextStyle(
                                  color: Color(0xFF35658F),
                                  fontSize: 16.0,
                                ),
                              ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Text(
                          "Suggestions for Improvement",
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                                const TextStyle(
                                  color: Color(0xFF35658F),
                                  letterSpacing: 0.3,
                                  fontSize: 16.0,
                                ),
                              ),
                        ),
                        const SizedBox(
                          height: 24.0,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          decoration: BoxDecoration(
                            boxShadow: CustomThemeData.getShadow(),
                            borderRadius: BorderRadius.circular(12.0),
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          child: TextField(
                            maxLines: 8,
                            style:
                                Theme.of(context).textTheme.labelSmall!.merge(
                                      const TextStyle(
                                          letterSpacing: 0.3, fontSize: 16.0),
                                    ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Feedback'.tr,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 36, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Submit",
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
            )
          ],
        ),
      ),
    );
  }
}
