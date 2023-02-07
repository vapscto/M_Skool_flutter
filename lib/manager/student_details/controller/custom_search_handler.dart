import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchHandler extends GetxController {
  RxList<String> fields = RxList();
  RxList<String> operators = RxList();
  RxList<String> conditions = RxList();
  RxList<dynamic> values = RxList();

  RxList<Widget> options = RxList();

  void addOptions(Widget op) {
    options.add(op);
  }

  void updateFields(String val) {
    fields.add(val);
  }

  void updateOperators(String op) {
    operators.add(op);
  }

  void addConditions(String condn) {
    conditions.add(condn);
  }

  void addValues(dynamic val) {
    values.add(val);
  }
}
