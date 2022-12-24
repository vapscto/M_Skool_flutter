import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widget_mask/widget_mask.dart';

class CoeSliderItem extends StatelessWidget {
  const CoeSliderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        image: DecorationImage(
            image: AssetImage(
              'assets/images/coe_banner.png',
            ),
            fit: BoxFit.cover),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Column(
                  children: [
                    Text("COE Event will appear here"),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: SizedBox(
            child: WidgetMask(
                blendMode: BlendMode.srcATop,
                childSaveLayer: true,
                mask: Image.network(
                  "https://images.unsplash.com/photo-1498931299472-f7a63a5a1cfa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80",
                  height: 250,
                  fit: BoxFit.cover,
                ),
                child: SizedBox(
                  child: Image.asset(
                    "assets/images/mask.png",
                    height: 250,
                  ),
                )),
          ))
        ],
      ),
    );
  }
}
