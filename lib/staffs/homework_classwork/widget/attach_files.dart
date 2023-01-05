import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class AttachedFiles extends StatelessWidget {
  const AttachedFiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16.0),
          child: CustomContainer(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {},
                      child: SvgPicture.asset("assets/svg/upload_svg.svg")),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: ListView.separated(
                            //padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: Colors.grey.shade300, width: 1.0),
                                ),
                                child: ListTile(
                                  dense: true,
                                  minLeadingWidth: 10,
                                  visualDensity: const VisualDensity(
                                      horizontal: VisualDensity.minimumDensity),
                                  leading: Icon(
                                    Icons.image_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  title: Text(
                                    "File name.png",
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 12.0,
                              );
                            },
                            itemCount: 3),
                      ),
                      const Expanded(flex: 3, child: SizedBox())
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          //height: 30,
          margin: const EdgeInsets.only(bottom: 5, left: 12.0),
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color(0xFFEBFDFF)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/svg/attach.svg",
                height: 14.0,
              ),
              const SizedBox(
                width: 6.0,
              ),
              Text(
                " Attach Files ",
                style: Theme.of(context).textTheme.labelMedium!.merge(
                      const TextStyle(fontSize: 15.0, color: Color(0xFF32B9CA)),
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
