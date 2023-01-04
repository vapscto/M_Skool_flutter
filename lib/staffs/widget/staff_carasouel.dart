import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StaffCarasouel extends StatelessWidget {
  const StaffCarasouel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 3,
      itemBuilder: (_, index, count) {
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 4, right: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
              image: AssetImage("assets/images/banner.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: const Text("This is carasouel Slider .... "),
        );
      },
      options: CarouselOptions(
          height: Get.height * 0.2,
          viewportFraction: 1,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          autoPlay: true),
    );
  }
}
