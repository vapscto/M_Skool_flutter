import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/feedback/model/get_feed_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class FeedBackItem extends StatelessWidget {
  final FeedBacksModelValues feedBacks;
  const FeedBackItem({
    Key? key,
    required this.feedBacks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              getFormatedDate(DateTime.parse(feedBacks.asgfEFeedbackDate!)),
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .merge(TextStyle(color: Colors.grey.shade700)),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              feedBacks.asgfEFeedBack!,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
