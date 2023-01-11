import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_class.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_section.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_subject.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/controller/hw_cw_controller.dart';
import 'package:m_skool_flutter/staffs/view_notice/model/view_notice_session_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class HwCwAcademicYearDD extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const HwCwAcademicYearDD({
    Key? key,
    required this.hwCwController,
    required this.loginSuccessModel,
    required this.mskoolController,
  }) : super(key: key);

  final HwCwController hwCwController;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: DropdownButtonFormField<ViewNoticeSessionModelValues>(
          value: hwCwController.selectedSession.value,
          style: Theme.of(context).textTheme.titleSmall!.merge(
                const TextStyle(fontSize: 16.0),
              ),
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            label: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFDFFBFE),
                borderRadius: BorderRadius.circular(24.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/cap.png",
                    height: 24.0,
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Text(
                    " Academic Year ",
                    style: Theme.of(context).textTheme.labelMedium!.merge(
                          const TextStyle(
                              backgroundColor: Color(0xFFDFFBFE),
                              fontSize: 20.0,
                              color: Color(0xFF28B6C8)),
                        ),
                  ),
                ],
              ),
            ),
            border: const OutlineInputBorder(),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(top: 4.5),
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              size: 30,
            ),
          ),
          items: hwCwController.session
              .map((e) => DropdownMenuItem<ViewNoticeSessionModelValues>(
                  value: e,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 5),
                    child: Text(e.asmaYYear!),
                  )))
              .toList(),
          onChanged: (e) async {
            hwCwController.updateSelectedSession(e!);
            await loadAgain();
          }),
    );
  }

  Future<void> loadAgain() async {
    await HwCwGetClassApi.instance.getHwCwClasses(
      miId: loginSuccessModel.mIID!,
      loginId: loginSuccessModel.userId!,
      asmayId: hwCwController.selectedSession.value.asmaYId!,
      ivrmrtId: loginSuccessModel.roleId!,
      base: baseUrlFromInsCode(
        "portal",
        mskoolController,
      ),
      hwCwController: hwCwController,
    );

    if (hwCwController.isErrorOccuredLoadingClass.value ||
        hwCwController.classes.isEmpty) {
      return;
    }

    await HwCwGetSection.instance.getSections(
        miId: loginSuccessModel.mIID!,
        ivrmrtId: loginSuccessModel.roleId!,
        asmayId: hwCwController.selectedSession.value.asmaYId!,
        userId: loginSuccessModel.userId!,
        loginId: loginSuccessModel.userId!,
        asmclId: hwCwController.selectedClass.value.asmcLId!,
        base: baseUrlFromInsCode("portal", mskoolController),
        hwCwController: hwCwController);
    if (hwCwController.isErrorOccuredLoadingSection.value ||
        hwCwController.sections.isEmpty) {
      return;
    }

    await HwCwGetSubjectsApi.instance.getSubjects(
      miId: loginSuccessModel.mIID!,
      asmayId: hwCwController.selectedSession.value.asmaYId!,
      asmclId: hwCwController.selectedClass.value.asmcLId!,
      sections: [
        {"ASMS_Id": hwCwController.selectedSection.value.asmSId!}
      ],
      ivrmrtId: loginSuccessModel.roleId!,
      loginId: loginSuccessModel.userId!,
      base: baseUrlFromInsCode("portal", mskoolController),
      hwCwController: hwCwController,
    );
  }
}
