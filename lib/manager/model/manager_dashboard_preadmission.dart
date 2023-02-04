class ManagerDashboardPreadmissionDetails {
  String? type;
  List<ManagerDashboardPreadmissionDetailsValues>? values;

  ManagerDashboardPreadmissionDetails({this.type, this.values});

  ManagerDashboardPreadmissionDetails.fromJson(Map<String, dynamic> json) {
    type = json['\$type'];
    if (json['\$values'] != null) {
      values = <ManagerDashboardPreadmissionDetailsValues>[];
      json['\$values'].forEach((v) {
        values!.add(ManagerDashboardPreadmissionDetailsValues.fromJson(v));
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

class ManagerDashboardPreadmissionDetailsValues {
  String? type;
  int? totalRegistred;
  int? totalPaid;
  int? totalConfirmed;

  ManagerDashboardPreadmissionDetailsValues(
      {this.type, this.totalRegistred, this.totalPaid, this.totalConfirmed});

  ManagerDashboardPreadmissionDetailsValues.fromJson(
      Map<String, dynamic> json) {
    type = json['$type'];
    totalRegistred = json['TotalRegistred'];
    totalPaid = json['TotalPaid'];
    totalConfirmed = json['TotalConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['$type'] = type;
    data['TotalRegistred'] = totalRegistred;
    data['TotalPaid'] = totalPaid;
    data['TotalConfirmed'] = totalConfirmed;
    return data;
  }
}
