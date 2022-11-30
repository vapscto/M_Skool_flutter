import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'dart:ui' as ui;

class DashboardProfile extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  const DashboardProfile({required this.loginSuccessModel, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height / 2,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: Get.height / 3,
            child: CustomPaint(
              painter: ProfilePaint(),
              child: Stack(
                children: [
                  Positioned(
                    top: (Get.height / 9) - 49,
                    left: (Get.width / 2) - 47,
                    child: CircleAvatar(
                      radius: 49,
                      backgroundImage: loginSuccessModel.userImagePath != null
                          ? NetworkImage(loginSuccessModel.userImagePath!)
                          : null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: (Get.height / 3) - 90,
            left: (Get.width * 0.1),
            child: Column(
              children: [
                Text(loginSuccessModel.userName ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 15),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: SizedBox(
                    width: Get.width * 0.8,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text('2012-055  |  IX A',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 18)),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text("Attendance",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16)),
                                        Spacer(),
                                        Text("80 %",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15))
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const LinearProgressIndicator(
                                        value: 0.8,
                                        minHeight: 7,
                                        color: Color(0xffBFECE1),
                                        backgroundColor: Color(0xffBFECE1),
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Color(0xff2EA689))),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: const [
                                        Text("Fee",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16)),
                                        Spacer(),
                                        Text("56 %",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 15))
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    const LinearProgressIndicator(
                                      value: 0.5,
                                      minHeight: 7,
                                      color: Color(0xffFF8B00),
                                      backgroundColor: Color(0xffFFEBD4),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProfilePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height),
        Paint()..color = const Color(0xffDFEFFD));
    canvas.drawCircle(
        Offset((size.width / 2) + 46, (size.height / 3) + 43),
        16,
        Paint()
          ..color = const Color(0xff00308F)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 8);

    canvas.drawCircle(Offset((size.width / 2) + 6, (size.height / 3)), 62,
        Paint()..color = const Color(0xffF9F5EF));
    canvas.drawCircle(
        Offset((size.width / 2) + 6, (size.height / 3) + 4),
        49,
        Paint()
          ..color = Colors.white
          ..shader = ui.Gradient.radial(
              Offset((size.width / 2) + 6, (size.height / 3) + 4),
              49,
              [Colors.black.withOpacity(0.4), Colors.white]));
    for (int i = 0; i < 6; i++) {
      var paint = Paint()
        ..color = const Color(0xff00308F)
        ..style = PaintingStyle.stroke;
      if (i == 4) {
        paint.strokeWidth = 3;
      } else {
        paint.strokeWidth = 0.7;
      }
      canvas.drawCircle(
          Offset((size.width / 2) - 34, (size.height / 3) - 30), i * 6, paint);
    }
    // canvas.save();
    canvas.rotate(-0.48);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(-110, size.height - (size.height * 0.5), 90, 90),
            const Radius.circular(6)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = const Color.fromARGB(144, 54, 89, 158));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(-90, size.height - (size.height * 0.6), 90, 90),
            const Radius.circular(6)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = const Color.fromARGB(144, 54, 89, 158));
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
                size.width - 118, size.height - (size.height * 0.15), 100, 100),
            const Radius.circular(6)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = const Color.fromARGB(144, 54, 89, 158));
    // canvas.rotate(-0.45);
    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromLTWH(
                size.width - 140, size.height - (size.height * 0.25), 100, 100),
            const Radius.circular(6)),
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5
          ..color = const Color.fromARGB(144, 54, 89, 158));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
