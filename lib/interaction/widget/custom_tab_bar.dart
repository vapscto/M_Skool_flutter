import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomTabBar extends StatefulWidget {
  final ValueChanged<int> onTabSelect;
  const CustomTabBar({required this.onTabSelect, super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  List<Map<String, String>> names = [
    {"name": "Inbox", "img": "compose.svg"},
    {"name": "Compose", "img": "compose.svg"},
    {"name": "Unread", "img": "compose.svg"},
    {"name": "All", "img": "compose.svg"}
  ];
  late double width;
  double height = 45;
  double shrinkRatio = 0.9;
  double enlargeRatio = 1 + ((1.0 - 0.9) * 3);
  @override
  void initState() {
    width = (Get.width - 10) / 4;
    super.initState();
  }

  final indexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: MediaQuery.of(context).size.width,
      child: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < names.length; i++)
                  InkWell(
                    onTap: () {
                      indexNotifier.value = i;
                      widget.onTabSelect(i);
                    },
                    child: CustomPaint(
                      painter: TabBarPainter(
                          context: context,
                          left: index == (i - 1),
                          right: index == (i + 1)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                            color:
                                index == i ? Colors.white : Colors.transparent,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(15))),
                        width: index == i
                            ? (width * enlargeRatio)
                            : (width * shrinkRatio),
                        height: height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            index == i
                                ? SvgPicture.asset(
                                    "assets/svg/${names[i]["img"]}")
                                : const SizedBox.shrink(),
                            const SizedBox(width: 6),
                            Text(names[i]["name"] ?? '',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    fontSize: 13.5,
                                    color: index == i
                                        ? Colors.black
                                        : Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  )
              ],
            );
          }),
    );
  }
}

class TabBarPainter extends CustomPainter {
  final BuildContext context;
  final bool left;
  final bool right;
  TabBarPainter(
      {required this.context, required this.left, required this.right});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Theme.of(context).primaryColor
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndCorners(Rect.fromLTWH(0, 0, size.width, size.height),
            bottomLeft: left ? const Radius.circular(15) : Radius.zero,
            bottomRight: right ? const Radius.circular(15) : Radius.zero),
        paint);
  }

  @override
  bool shouldRepaint(TabBarPainter oldDelegate) => false;
}
