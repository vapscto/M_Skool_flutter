class DashboardLopModel {
  String? type;
  List<DashboardLopModelValues>? values;

  DashboardLopModel({this.type, this.values});

  DashboardLopModel.fromJson(Map<String, dynamic> json) {
    type = json['\$type'];
    if (json['\$values'] != null) {
      values = <DashboardLopModelValues>[];
      json['\$values'].forEach((v) {
        values!.add(DashboardLopModelValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['\$type'] = type;
    if (values != null) {
      data['\$values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DashboardLopModelValues {
  String? type;
  double? lOPAmount;
  int? lOPCOUNT;

  DashboardLopModelValues({this.type, this.lOPAmount, this.lOPCOUNT});

  DashboardLopModelValues.fromJson(Map<String, dynamic> json) {
    type = json['$type'];
    lOPAmount = json['LOPAmount'];
    lOPCOUNT = json['LOPCOUNT'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$type'] = type;
    data['LOPAmount'] = lOPAmount;
    data['LOPCOUNT'] = lOPCOUNT;
    return data;
  }
}
