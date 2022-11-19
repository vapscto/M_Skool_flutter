import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/feedback/api/get_feedback_api.dart';
import 'package:m_skool_flutter/feedback/model/get_feed_model.dart';
import 'package:m_skool_flutter/feedback/widget/feedback_item.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class ViewFeedBackScreen extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ViewFeedBackScreen({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "View").getAppBar(),
      body: FutureBuilder<FeedBacksModel>(
          future: GetFeedBackApi.instance.getStuFeedBack(
            miId: loginSuccessModel.mIID!,
            asmayId: loginSuccessModel.asmaYId!,
            amstId: loginSuccessModel.amsTId!,
            base: baseUrlFromInsCode("portal", mskoolController),
          ),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (_, index) {
                  return FeedBackItem(
                      feedBacks: snapshot.data!.values!.elementAt(index));
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: snapshot.data!.values!.length,
              );
            }
            if (snapshot.hasError) {
              return ErrWidget(err: snapshot.error as Map<String, dynamic>);
            }
            return const CustomPgrWidget(
                title: "Getting your feedback's",
                desc: "Just a moment, we are there to get your feedback's");
          }),
    );
  }
}
