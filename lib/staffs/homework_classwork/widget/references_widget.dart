import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/reference_item.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ReferencesWidget extends StatefulWidget {
  final RxBool wantToProvideReference;
  const ReferencesWidget({super.key, required this.wantToProvideReference});

  @override
  State<ReferencesWidget> createState() => _ReferencesWidgetState();
}

class _ReferencesWidgetState extends State<ReferencesWidget> {
  final RxList<ReferenceItem> referencesItems = RxList([]);
  final RxList<TextEditingController> textEditors = RxList([]);
  final ScrollController scrollController = ScrollController();

  final RxList<Map<String, dynamic>> ref = RxList([]);
  int deleteCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          minLeadingWidth: 8,
          visualDensity:
              const VisualDensity(horizontal: VisualDensity.minimumDensity),
          leading: Obx(() {
            return Checkbox(
              visualDensity:
                  const VisualDensity(horizontal: VisualDensity.minimumDensity),
              value: widget.wantToProvideReference.value,
              onChanged: (val) {
                widget.wantToProvideReference.value = val!;
              },
            );
          }),
          title: const Text("Reference"),
          trailing: Obx(() {
            return widget.wantToProvideReference.value
                ? IconButton(
                    onPressed: () {
                      textEditors.add(TextEditingController());
                      referencesItems.add(ReferenceItem(
                        controller: textEditors.last,
                      ));
                      scrollController.animateTo(
                          scrollController.position.maxScrollExtent,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    icon: Icon(
                      Icons.add_box_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : const SizedBox();
          }),
        ),
        Obx(() {
          return ListView.separated(
              controller: scrollController,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return CustomContainer(
                  child: Row(
                    children: [
                      Expanded(child: referencesItems.elementAt(index)),
                      IconButton(
                        onPressed: () {
                          textEditors.removeAt(index);
                          referencesItems.removeAt(index);
                        },
                        icon: const Icon(
                          Icons.close,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 16.0,
                );
              },
              itemCount: referencesItems.length);
        })
      ],
    );
  }
}
