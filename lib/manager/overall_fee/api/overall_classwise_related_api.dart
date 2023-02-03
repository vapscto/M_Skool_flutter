import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeAcademicYearModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeClassModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeClasswiseStudentDetailModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeSectionModel.dart';

var dio = Dio();
Future<OverallFeeAcademicYearModel?> getClasswiseAcademicYearData({
  required int miId,
  required String base,
}) async {
  var url = base + URLS.getOverallFeeAcademicYear;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_ID": miId,
      },
    );
    if (response.statusCode == 200) {
      OverallFeeAcademicYearModel overallFeeAcademicYearModel =
          OverallFeeAcademicYearModel.fromJson(response.data);
      return overallFeeAcademicYearModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<OverallFeeClassModel?> getClasswiseClassData({
  required String base,
  required int miId,
  required int asmayId,
}) async {
  var url = base + URLS.getOverallFeeClass;

  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ASMAY_Id": asmayId,
        "MI_Id": miId,
      },
    );
    if (response.statusCode == 200) {
      OverallFeeClassModel overallFeeClassModel =
          OverallFeeClassModel.fromJson(response.data);
      return overallFeeClassModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<OverallFeeSectionModel?> getClasswiseSectionData({
  required String base,
  required int miId,
  required int asmayId,
  required int asmclId,
}) async {
  var url = base + URLS.getOverallFeeSectin;

  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ASMAY_Id": asmayId,
        "MI_Id": miId,
        "asmcL_Id": asmclId,
      },
    );
    if (response.statusCode == 200) {
      OverallFeeSectionModel overallFeeSectionModel =
          OverallFeeSectionModel.fromJson(response.data);
      return overallFeeSectionModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<OverallFeeClasswiseStudentDetailModel?> getClasswiseResultData({
  required String base,
  required int asmayId,
  required int miId,
  required int asmclId,
  required int asmsId,
}) async {
  var url = base + URLS.getOverallFeeResults;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ASMAY_Id": asmayId,
        "asmcL_Id": asmclId,
        "asmS_Id": asmsId,
        "MI_Id": miId,
      },
    );
    if (response.statusCode == 200) {
      OverallFeeClasswiseStudentDetailModel
          overallFeeClasswiseStudentDetailModel =
          OverallFeeClasswiseStudentDetailModel.fromJson(response.data);
      return overallFeeClasswiseStudentDetailModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}
