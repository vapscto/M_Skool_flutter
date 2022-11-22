import 'package:flutter/material.dart';
import 'package:m_skool_flutter/certificates/api/get_applied_certificates_api.dart';
import 'package:m_skool_flutter/certificates/model/stud_list.dart';
import 'package:m_skool_flutter/certificates/widget/certificate_detail_item.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class ViewDetails extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ViewDetails(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<StudListValues>>(
        future: GetApplyCertificate.instance.getAllAppliedCertificate(
            miId: loginSuccessModel.mIID!,
            asmayId: loginSuccessModel.asmaYId!,
            amstId: loginSuccessModel.amsTId!,
            role: "Student",
            base: baseUrlFromInsCode("portal", mskoolController)),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              controller: ScrollController(),
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (_, index) {
                return CertificateDetailItem(
                  values: snapshot.data!.elementAt(index),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 16.0,
                );
              },
              itemCount: snapshot.data!.length,
            );
          }
          if (snapshot.hasError) {
            return ErrWidget(err: snapshot.error as Map<String, dynamic>);
          }
          return const CustomPgrWidget(
            title: "Getting all your applied certificates",
            desc: "We are getting your applied certificate from heaven",
          );
        });
  }
}
