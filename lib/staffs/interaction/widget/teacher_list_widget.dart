import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/interaction/controller/staff_interaction_compose_related_controller.dart';
import 'package:m_skool_flutter/staffs/interaction/model/initialDropdownDetailModel.dart';

class TeacherListWidget extends StatefulWidget {
  final GetdetailsValues data;
  final Function(int) function;
  final Function(int) function1;
  const TeacherListWidget({
    super.key,
    required this.data,
    required this.function,
    required this.function1,
  });

  @override
  State<TeacherListWidget> createState() => _TeacherListWidgetState();
}

class _TeacherListWidgetState extends State<TeacherListWidget> {
  final StaffInteractionComposeController staffInteractionComposeController =
      Get.put(StaffInteractionComposeController());
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 30,
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          checkboxShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          dense: true,
          activeColor: Theme.of(context).primaryColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          visualDensity: const VisualDensity(horizontal: -4.0),
          title: Text(
            staffInteractionComposeController.selectedradio.value == 'EC'
                ? widget.data.examCoordinatorName!
                : widget.data.empName!,
            style: Theme.of(context).textTheme.labelSmall!.merge(
                const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    letterSpacing: 0.3)),
          ),
          value: check,
          onChanged: (value) {
            setState(() {
              check = value!;
            });
            if (value!) {
              if (staffInteractionComposeController.selectedradio.value ==
                      'EC' ||
                  staffInteractionComposeController.selectedradio.value ==
                      'Principal') {
                widget.function(widget.data.id!);
              } else {
                widget.function(widget.data.iD!);
              }
            } else if (staffInteractionComposeController.selectedradio.value ==
                    'EC' ||
                staffInteractionComposeController.selectedradio.value ==
                    'Principal') {
              widget.function1(widget.data.id!);
            } else {
              widget.function1(widget.data.iD!);
            }
          },
        ),
      ),
    );
  }
}
