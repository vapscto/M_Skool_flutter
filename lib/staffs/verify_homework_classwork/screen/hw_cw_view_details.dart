import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class VerifyHwCwViewDetails extends StatelessWidget {
  final String title;
  final bool forHw;
  const VerifyHwCwViewDetails(
      {super.key, required this.title, required this.forHw});

  @override
  Widget build(BuildContext context) {
    int color = -1;
    return Scaffold(
      appBar: CustomAppBar(title: title).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            forHw
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFFBCFCF)),
                    child: Text(
                      "Maximum Marks : 20",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .merge(const TextStyle(color: Color(0xFFA83232))),
                    ),
                  ),
            forHw
                ? const SizedBox()
                : const SizedBox(
                    height: 16.0,
                  ),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  color += 1;
                  if (color % 6 == 0) {
                    color = 0;
                  }
                  return VerifyHwCwItem(
                    forHw: forHw,
                    color: lighterColor.elementAt(color),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: 10)
          ],
        ),
      ),
    );
  }
}

class VerifyHwCwItem extends StatelessWidget {
  final Color color;
  const VerifyHwCwItem({
    Key? key,
    required this.forHw,
    required this.color,
  }) : super(key: key);

  final bool forHw;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: color),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 36.0,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=388&q=80",
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prasanna",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0)),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "2013-325",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .color,
                                    fontSize: 14.0,
                                    letterSpacing: 0.2)),
                          ),
                        ],
                      ))
                    ],
                  )
                ]),
              ),
              forHw
                  ? const SizedBox()
                  : Text(
                      "02.75",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            TextStyle(
                                fontSize: 20.0,
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).primaryColor),
                          ),
                    ),
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          HwCwUploadedContentItem(
            onViewClicked: () {},
            onDownloadClicked: () {},
            isPdf: false,
            title: 'Eye Diagram',
          ),
          const SizedBox(
            height: 12.0,
          ),
          HwCwUploadedContentItem(
            onViewClicked: () {},
            onDownloadClicked: () {},
            isPdf: false,
            title: 'Intestine Description',
          ),
          const SizedBox(
            height: 12.0,
          ),
          HwCwUploadedContentItem(
            onViewClicked: () {},
            onDownloadClicked: () {},
            isPdf: true,
            title: 'Human eye',
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Dialog(
                          insetPadding: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Uploaded Files",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .merge(
                                            const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.0),
                                          ),
                                    ),
                                    IconButton(
                                        padding: const EdgeInsets.all(0),
                                        visualDensity: const VisualDensity(
                                            horizontal:
                                                VisualDensity.minimumDensity,
                                            vertical:
                                                VisualDensity.minimumDensity),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(children: [
                                  HwCwUploadedContentItem(
                                    onViewClicked: () {},
                                    onDownloadClicked: () {},
                                    isPdf: false,
                                    title: 'Eye Diagram',
                                    deleteAsset: "assets/svg/delete.svg",
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  HwCwUploadedContentItem(
                                    onViewClicked: () {},
                                    onDownloadClicked: () {},
                                    isPdf: false,
                                    title: 'Intestine Description',
                                    deleteAsset: "assets/svg/delete.svg",
                                  ),
                                  const SizedBox(
                                    height: 12.0,
                                  ),
                                  HwCwUploadedContentItem(
                                    onViewClicked: () {},
                                    onDownloadClicked: () {},
                                    isPdf: true,
                                    title: 'Human eye',
                                    deleteAsset: "assets/svg/delete.svg",
                                  ),
                                ]),
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text(
                  "View Uploaded files",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width * 0.4, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    )),
                onPressed: () {},
                child: const Text("Upload"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
