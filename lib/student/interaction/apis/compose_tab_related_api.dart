import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

Future<bool> saveDetail({
  required int miId,
  required int asmayId,
  required int amstId,
  required int userId,
  required String userFlg,
  required String subject,
  required String message,
  required int hrmeId,
  required String base,
}) async {
  var url = base + URLS.composeInteraction;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "mI_ID": 4,
        "ASMAY_Id": 82,
        "AMST_Id": 19311,
        "roleflg": "student",
        "UserId": userId,
        "userflag": userFlg,
        "ISTINT_ToId": 28,
        "ISMINT_ComposedByFlg": "Staff",
        "ISMINT_GroupOrIndFlg": "Individual",
        "ISMINT_Subject": subject,
        "ISMINT_Interaction": message,
        "HRME_Id": hrmeId
      },
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Composed Successfully!!');
      return true;
    }
    Fluttertoast.showToast(msg: 'Something went wrong');
    return false;
  } catch (e) {
    logger.d(e.toString());
    return false;
  }
}
