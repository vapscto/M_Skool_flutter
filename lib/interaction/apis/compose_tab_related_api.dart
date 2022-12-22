import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';

import '../../controller/global_utilities.dart';
import '../../main.dart';
import '../model/staff_detail_model.dart';

var dio = Dio();

Future<StaffDetailsModel?> getStaffList({
  required int miId,
  required int amstId,
  required int asmayId,
  required int userId,
  required String key,
  required String base,
}) async {
  var url = base + URLS.getStaffList;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_ID": miId,
        "AMST_Id": amstId,
        "ASMAY_Id": asmayId,
        "IVRMRT_Id": 7,
        "roleflg": 'student',
        "UserId": userId,
        "userflag": key,
      },
    );
    if (response.statusCode == 200) {
      StaffDetailsModel staffDetailsModel =
          StaffDetailsModel.fromJson(response.data);
      return staffDetailsModel;
    } else {
      return null;
    }
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}
