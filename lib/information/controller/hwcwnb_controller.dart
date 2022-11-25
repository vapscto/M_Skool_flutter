import 'package:get/get.dart';
import 'package:m_skool_flutter/classwork/model/class_work_model.dart';
import 'package:m_skool_flutter/notice/model/notice_data_model.dart';

class HwCwNbController extends GetxController {
  final RxInt filter = RxInt(0);
  final RxList<DateTime> dtList = RxList();
  final RxString startBy = RxString("Start Date");
  final RxString endBy = RxString("End Date");
  final RxBool startDateProvided = RxBool(false);

  void updateStartBy(String start) {
    startBy.value = start;
  }

  void updateEndby(String end) {
    endBy.value = end;
  }

  void updateShowFilter(int show) {
    filter.value = show;
  }

  void updatedtList(List<DateTime> values) {
    if (dtList.isNotEmpty) {
      dtList.clear();
    }

    dtList.addAll(values);
  }

  void updateStartDateProvided(bool provide) {
    startDateProvided.value = provide;
  }

  RxBool isClassWorkDataLoading = RxBool(true);

  void updateIsClassWorkDataLoading(bool isLoading) {
    isClassWorkDataLoading.value = isLoading;
  }

  RxList<ClassWorkModelValues> classWorkList = RxList<ClassWorkModelValues>();

  void updateClassWorkList(List<ClassWorkModelValues> values) {
    if (classWorkList.isNotEmpty) {
      classWorkList.clear();
    }
    classWorkList.addAll(values);
  }

  RxBool isNoticeDataLoading = RxBool(true);

  void updateIsNoticeDataLoading(bool isLoading) {
    isNoticeDataLoading.value = isLoading;
  }

  RxList<NoticeDataModelValues> noticeList = RxList<NoticeDataModelValues>();

  void updateNoticeDataModelValues(List<NoticeDataModelValues> values) {
    if (noticeList.isNotEmpty) {
      noticeList.clear();
    }
    noticeList.addAll(values);
  }
}
