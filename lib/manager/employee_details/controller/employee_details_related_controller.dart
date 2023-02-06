import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/manager/employee_details/api/employee_details_related_api.dart';
import 'package:m_skool_flutter/manager/employee_details/model/departmentModel.dart';
import 'package:m_skool_flutter/manager/employee_details/model/typeModel.dart';

import '../model/designationModel.dart';

class EmployeeDetailsController extends GetxController {
  RxList<FilltypesValue> typeList = <FilltypesValue>[].obs;
  RxList<FilldepartmentValue> departmentList = <FilldepartmentValue>[].obs;
  RxList<FilldesignationValue> designationList = <FilldesignationValue>[].obs;

  RxBool isType = RxBool(false);
  RxBool isDepartment = RxBool(false);
  RxBool isDesignation = RxBool(false);

  void istypeloading(bool loading) {
    isType.value = loading;
  }

  void isdepartmentloading(bool loading) {
    isDepartment.value = loading;
  }

  void isdesignationloading(bool loading) {
    isDesignation.value = loading;
  }

  Future<bool> getTypes({
    required String base,
    required int miId,
    required int asmayId,
  }) async {
    TypeModel? typeModel =
        await getTypesData(base: base, miId: miId, asmayId: asmayId);
    try {
      if (typeModel!.filltypes != null || typeModel.filltypes!.values != null) {
        typeList.clear();
        for (var i = 0; i < typeModel.filltypes!.values!.length; i++) {
          typeList.add(typeModel.filltypes!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getDepartment({
    required String base,
    required int miId,
    required int asmayId,
    required String multipletype,
  }) async {
    DepartmentModel? departmentModel = await getDepartmentData(
        base: base, miId: miId, asmayId: asmayId, multipletype: multipletype);
    departmentList.clear();
    designationList.clear();
    try {
      if (departmentModel!.filldepartment != null ||
          departmentModel.filldepartment!.values != null) {
        for (var i = 0;
            i < departmentModel.filldepartment!.values!.length;
            i++) {
          departmentList
              .add(departmentModel.filldepartment!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getDesignation({
    required int miId,
    required int asmayId,
    required String multipletype,
    required String multipledep,
    required String base,
  }) async {
    DesignationModel? designationModel = await getDesignationData(
        miId: miId,
        asmayId: asmayId,
        multipletype: multipletype,
        multipledep: multipledep,
        base: base);
    designationList.clear();
    try {
      if (designationModel!.filldesignation != null ||
          designationModel.filldesignation!.values != null) {
        for (var i = 0;
            i < designationModel.filldesignation!.values!.length;
            i++) {
          designationList
              .add(designationModel.filldesignation!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }
}
