import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ApplyLeaveWidget extends StatelessWidget {
  const ApplyLeaveWidget({
    Key? key,
  }) : super(key: key);

  //final RxBool isHalfDay;

  @override
  Widget build(BuildContext context) {
    RxBool isHalfDay = RxBool(false);
    return CustomContainer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: const BoxDecoration(
                color: Color(0xFFFFEBEA),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(8.0),
                )),
            child: Text(
              "Casual Leaves",
              style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(
                      color: Color(0xFFFF6F67),
                    ),
                  ),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainer(
                  child: TextField(
                    style: Theme.of(context).textTheme.titleSmall,

                    //maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 48.0, left: 12),
                      border: const OutlineInputBorder(),
                      label: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xFFDFFBFE)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/reason.png",
                              color: const Color(0xFF28B6C8),
                              height: 24.0,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              " Reason for Leave ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF28B6C8)),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Enter reason here.',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                CustomContainer(
                  child: TextField(
                    style: Theme.of(context).textTheme.titleSmall,

                    //maxLines: 4,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 48.0, left: 12),
                      border: const OutlineInputBorder(),
                      label: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xFFDBFDF5)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/phone.svg",
                              color: const Color(0xFF47BA9E),
                              height: 24.0,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              " Mobile Number ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF47BA9E),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Enter Phone Number.',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomContainer(
                        child: TextField(
                          style: Theme.of(context).textTheme.titleSmall,
                          readOnly: true,
                          //maxLines: 4,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/svg/calendar_icon.svg',
                                color: const Color(0xFF3E78AA),
                                height: 22.0,
                              ),
                            ),
                            contentPadding:
                                const EdgeInsets.only(top: 48.0, left: 12),
                            border: const OutlineInputBorder(),
                            label: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  color: const Color(0xFFE5F3FF)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/calendar_icon.svg",
                                    color: const Color(0xFF3E78AA),
                                    height: 24.0,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    " Start Date ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .merge(
                                          const TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF3E78AA),
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            hintText: 'Select Date',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: CustomContainer(
                        child: TextField(
                          readOnly: true,
                          style: Theme.of(context).textTheme.titleSmall,

                          //maxLines: 4,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding:
                                const EdgeInsets.only(top: 48.0, left: 12),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/svg/calendar_icon.svg',
                                color: const Color(0xFF3E78AA),
                                height: 22.0,
                              ),
                            ),
                            border: const OutlineInputBorder(),
                            label: Container(
                              margin: const EdgeInsets.only(bottom: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                  color: const Color(0xFFE5F3FF)),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    "assets/svg/calendar_icon.svg",
                                    color: const Color(0xFF3E78AA),
                                    height: 24.0,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    " End Date ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .merge(
                                          const TextStyle(
                                              fontSize: 20.0,
                                              color: Color(0xFF3E78AA)),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            hintText: 'Select Date',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            "No of days : ",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .color,
                                      ),
                                    ),
                          ),
                          const Text("02")
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 38,
                        // padding: const EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(24.0),
                            boxShadow: CustomThemeData.getShadow()),
                        child: Row(
                          children: [
                            Expanded(child: Obx(() {
                              return InkWell(
                                onTap: () {
                                  isHalfDay.value = true;
                                },
                                child: AnimatedContainer(
                                    alignment: Alignment.center,
                                    height: 38,
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      color: isHalfDay.value
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    duration: const Duration(microseconds: 300),
                                    child: Text(
                                      "Half Day",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: isHalfDay.value
                                            ? Theme.of(context)
                                                .scaffoldBackgroundColor
                                            : Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .color,
                                      ),
                                    )),
                              );
                            })),
                            Expanded(
                              child: Obx(() {
                                return InkWell(
                                  onTap: () {
                                    isHalfDay.value = false;
                                  },
                                  child: AnimatedContainer(
                                    height: 38.0,
                                    curve: Curves.easeInOut,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.all(6.0),
                                    decoration: BoxDecoration(
                                      color: isHalfDay.value
                                          ? Colors.transparent
                                          : Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(24.0),
                                    ),
                                    duration: const Duration(microseconds: 300),
                                    child: Text(
                                      "Full Day",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: isHalfDay.value
                                              ? Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .color
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor),
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32.0,
                ),
                CustomContainer(
                  child: TextField(
                    readOnly: true,
                    style: Theme.of(context).textTheme.titleSmall,

                    //maxLines: 4,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 48.0, left: 12),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/svg/calendar_icon.svg',
                          color: const Color(0xFFDE53E1),
                          height: 22.0,
                        ),
                      ),
                      border: const OutlineInputBorder(),
                      label: Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.0),
                            color: const Color(0xFFFFEDFF)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              "assets/svg/calendar_icon.svg",
                              color: const Color(0xFFDE53E1),
                              height: 24.0,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              " Reporting Date ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFFDE53E1),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Select Date',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
