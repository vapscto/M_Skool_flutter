import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/model/student_dashboard_model.dart';
import 'package:m_skool_flutter/student/coe/screen/coe_home.dart';

import 'package:m_skool_flutter/widget/coe_shape.dart';

class CoeSliderItem extends StatelessWidget {
  final CalListValues coeValue;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const CoeSliderItem(
      {super.key,
      required this.coeValue,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return CoeHome(
              loginSuccessModel: loginSuccessModel,
              mskoolController: mskoolController);
        }));
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Colors.black26,
        child: Container(
          //height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: const DecorationImage(
                image: AssetImage(
                  'assets/images/coe_banner.png',
                ),
                fit: BoxFit.cover),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        coeValue.cOEMEEventName!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.bubblegumSans(
                          color: const Color(0xFFff6f67),
                          fontSize: 20.0,
                        ),
                        // style: GoogleFonts.moonDance(
                        //     color: const Color(0xFFff6f67), fontSize: 20.0),
                        // style: Theme.of(context).textTheme.titleMedium!.merge(
                        //     const TextStyle(
                        //         color: Color(0xFFff6f67),
                        //         fontSize: 2.0,
                        //         height: 1.2)),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/calendar.svg',
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            getFormatedDate(
                                DateTime.parse(coeValue.cOEEEStartDate!)),
                            style: Theme.of(context).textTheme.titleSmall,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/clock_coe.png',
                            color: Colors.black,
                            height: 20.0,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Expanded(
                            child: Text(
                              "${coeValue.cOEEEStartTime} - ${coeValue.cOEEEEndTime}",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: SizedBox(
                  height: 250,
                  child: ClipPath(
                    clipper: CoeShape(),
                    child: coeValue.cOEEIImages == null
                        ? Image.asset(
                            "assets/images/coe_img.png",
                            height: 250,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            coeValue.cOEEIImages == null
                                ? "https://images.unsplash.com/photo-1498931299472-f7a63a5a1cfa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=873&q=80"
                                : coeValue.cOEEIImages.toString(),
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
