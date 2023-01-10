class StaffCoeModel {
  String? type;
  List<StaffCoeModelValues>? values;

  StaffCoeModel({this.type, this.values});

  StaffCoeModel.fromJson(Map<String, dynamic> json) {
    type = json['\$type'];
    if (json['\$values'] != null) {
      values = <StaffCoeModelValues>[];
      json['\$values'].forEach((v) {
        values!.add(StaffCoeModelValues.fromJson(v));
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

class StaffCoeModelValues {
  int? mIId;
  int? asmaYId;
  int? asmcLId;
  int? month;
  int? count;
  String? eventName;
  String? eventDesc;
  String? coeEEStartDate;
  String? coeEEEndDate;
  int? year;
  int? hrmlYId;
  int? asmaYOrder;
  int? amCId;
  bool? categoryflag;
  String? coeeVVideos;
  String? coeeIImages;

  StaffCoeModelValues(
      {this.mIId,
      this.asmaYId,
      this.asmcLId,
      this.month,
      this.count,
      this.eventName,
      this.eventDesc,
      this.coeEEStartDate,
      this.coeEEEndDate,
      this.year,
      this.hrmlYId,
      this.asmaYOrder,
      this.amCId,
      this.categoryflag});

  StaffCoeModelValues.fromJson(Map<String, dynamic> json) {
    mIId = json['mI_Id'];
    asmaYId = json['asmaY_Id'];
    asmcLId = json['asmcL_Id'];
    month = json['month'];
    count = json['count'];
    eventName = json['eventName'];
    eventDesc = json['eventDesc'];
    coeEEStartDate = json['coeE_EStartDate'];
    coeEEEndDate = json['coeE_EEndDate'];
    year = json['year'];
    hrmlYId = json['hrmlY_Id'];
    asmaYOrder = json['asmaY_Order'];
    amCId = json['amC_Id'];
    categoryflag = json['categoryflag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mI_Id'] = mIId;
    data['asmaY_Id'] = asmaYId;
    data['asmcL_Id'] = asmcLId;
    data['month'] = month;
    data['count'] = count;
    data['eventName'] = eventName;
    data['eventDesc'] = eventDesc;
    data['coeE_EStartDate'] = coeEEStartDate;
    data['coeE_EEndDate'] = coeEEEndDate;
    data['year'] = year;
    data['hrmlY_Id'] = hrmlYId;
    data['asmaY_Order'] = asmaYOrder;
    data['amC_Id'] = amCId;
    data['categoryflag'] = categoryflag;
    return data;
  }
}
