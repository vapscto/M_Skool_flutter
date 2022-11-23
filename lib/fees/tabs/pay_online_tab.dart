import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/fees/widgets/custom_detail_widget.dart';

class PayOnlineTab extends StatefulWidget {
  const PayOnlineTab({super.key});

  @override
  State<PayOnlineTab> createState() => _PayOnlineTabState();
}

class _PayOnlineTabState extends State<PayOnlineTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Academic Year : 2022-2023',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Image.asset(
                        'assets/images/info_icon.png',
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(202, 244, 244, 0.3),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDetailWidget(title: 'Net Amount', amount: 60000),
                      CustomDetailWidget(title: 'Paid Amount', amount: 0),
                      CustomDetailWidget(title: 'Concession', amount: 0),
                      CustomDetailWidget(title: 'Balance', amount: 0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Text('VAPS International School'),
          )
        ],
      ),
    );
  }
}
