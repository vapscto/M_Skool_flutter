class LoginSuccessModel {
  int? amsTId;
  int? smscreditalert;
  bool? smsalrtflag;
  int? roleId;
  bool? isLogged;
  int? amaYActiveFlag;
  int? asmaYOrder;
  int? userId;
  int? rcredit;
  int? ivrMMOId;
  List<MiIdList>? miIdList;
  int? asmaYId;
  int? imfYId;
  int? role;
  String? userName;
  String? mobileprivileges;
  int? ivrmimPId;
  int? mIID;
  String? schoolcollegeflag;
  String? userImagePath;
  int? pageId;
  bool? ivrmirPAddFlag;
  bool? ivrmirPUpdateFlag;
  bool? ivrmirPDeleteFlag;
  bool? ivrmirPReportFlag;
  bool? ivrmirPSearchFlag;
  bool? ivrmirPProcessFlag;
  int? ivrmrmaPId;
  Staffmobileappprivileges? staffmobileappprivileges;
  String? cutoffdate;
  String? subscriptionenddate;
  bool? subscriptionFlag;
  Staffmobileappprivileges? institutionlist;
  String? asmaYYear;
  String? flag;
  String? dob;
  int? mobno;
  String? studname;
  bool? payment;
  bool? registration;
  String? roleforlogin;
  int? empcode;
  int? mIIdforlogin;
  int? paymentNootificationGeneral;
  int? roleTypeId;
  int? empId;
  bool? ivrmumalPAddFlg;
  bool? ivrmumalPUpdateFlg;
  bool? ivrmumalPDeleteFlg;
  int? almsTId;
  String? mIBackgroundImage;
  String? mILogo;

  LoginSuccessModel(
      {this.amsTId,
      this.smscreditalert,
      this.smsalrtflag,
      this.roleId,
      this.isLogged,
      this.amaYActiveFlag,
      this.asmaYOrder,
      this.userId,
      this.rcredit,
      this.ivrMMOId,
      this.miIdList,
      this.asmaYId,
      this.imfYId,
      this.role,
      this.userName,
      this.mobileprivileges,
      this.ivrmimPId,
      this.mIID,
      this.schoolcollegeflag,
      this.userImagePath,
      this.pageId,
      this.ivrmirPAddFlag,
      this.ivrmirPUpdateFlag,
      this.ivrmirPDeleteFlag,
      this.ivrmirPReportFlag,
      this.ivrmirPSearchFlag,
      this.ivrmirPProcessFlag,
      this.ivrmrmaPId,
      this.staffmobileappprivileges,
      this.cutoffdate,
      this.subscriptionenddate,
      this.subscriptionFlag,
      this.institutionlist,
      this.asmaYYear,
      this.flag,
      this.dob,
      this.mobno,
      this.studname,
      this.payment,
      this.registration,
      this.roleforlogin,
      this.empcode,
      this.mIIdforlogin,
      this.paymentNootificationGeneral,
      this.roleTypeId,
      this.empId,
      this.ivrmumalPAddFlg,
      this.ivrmumalPUpdateFlg,
      this.ivrmumalPDeleteFlg,
      this.almsTId,
      this.mIBackgroundImage,
      this.mILogo});

  LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    amsTId = json['amsT_Id'];
    smscreditalert = json['smscreditalert'];
    smsalrtflag = json['smsalrtflag'];
    roleId = json['roleId'];
    isLogged = json['isLogged'];
    amaYActiveFlag = json['amaY_ActiveFlag'];
    asmaYOrder = json['asmaY_Order'];
    userId = json['userId'];
    rcredit = json['rcredit'];
    ivrMMOId = json['ivrM_MO_Id'];
    if (json['mi_Id_List'] != null) {
      miIdList = <MiIdList>[];
      json['mi_Id_List'].forEach((v) {
        miIdList!.add(MiIdList.fromJson(v));
      });
    }
    asmaYId = json['asmaY_Id'];
    imfYId = json['imfY_Id'];
    role = json['role'];
    userName = json['userName'];
    mobileprivileges = json['mobileprivileges'];
    ivrmimPId = json['ivrmimP_Id'];
    mIID = json['mI_ID'];
    schoolcollegeflag = json['schoolcollegeflag'];
    userImagePath = json['userImagePath'];
    pageId = json['pageId'];
    ivrmirPAddFlag = json['ivrmirP_AddFlag'];
    ivrmirPUpdateFlag = json['ivrmirP_UpdateFlag'];
    ivrmirPDeleteFlag = json['ivrmirP_DeleteFlag'];
    ivrmirPReportFlag = json['ivrmirP_ReportFlag'];
    ivrmirPSearchFlag = json['ivrmirP_SearchFlag'];
    ivrmirPProcessFlag = json['ivrmirP_ProcessFlag'];
    ivrmrmaPId = json['ivrmrmaP_Id'];
    staffmobileappprivileges = json['staffmobileappprivileges'] != null
        ? Staffmobileappprivileges.fromJson(json['staffmobileappprivileges'])
        : null;
    cutoffdate = json['cutoffdate'];
    subscriptionenddate = json['subscriptionenddate'];
    subscriptionFlag = json['subscriptionFlag'];
    institutionlist = json['institutionlist'] != null
        ? Staffmobileappprivileges.fromJson(json['institutionlist'])
        : null;
    asmaYYear = json['asmaY_Year'];
    flag = json['flag'];
    dob = json['dob'];
    mobno = json['mobno'];
    studname = json['studname'];
    payment = json['payment'];
    registration = json['registration'];
    roleforlogin = json['roleforlogin'];
    empcode = json['empcode'];
    mIIdforlogin = json['mI_Idforlogin'];
    paymentNootificationGeneral = json['paymentNootificationGeneral'];
    roleTypeId = json['roleTypeId'];
    empId = json['emp_Id'];
    ivrmumalPAddFlg = json['ivrmumalP_AddFlg'];
    ivrmumalPUpdateFlg = json['ivrmumalP_UpdateFlg'];
    ivrmumalPDeleteFlg = json['ivrmumalP_DeleteFlg'];
    almsTId = json['almsT_Id'];
    mIBackgroundImage = json['mI_BackgroundImage'];
    mILogo = json['mI_Logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['amsT_Id'] = amsTId;
    data['smscreditalert'] = smscreditalert;
    data['smsalrtflag'] = smsalrtflag;
    data['roleId'] = roleId;
    data['isLogged'] = isLogged;
    data['amaY_ActiveFlag'] = amaYActiveFlag;
    data['asmaY_Order'] = asmaYOrder;
    data['userId'] = userId;
    data['rcredit'] = rcredit;
    data['ivrM_MO_Id'] = ivrMMOId;
    if (miIdList != null) {
      data['mi_Id_List'] = miIdList!.map((v) => v.toJson()).toList();
    }
    data['asmaY_Id'] = asmaYId;
    data['imfY_Id'] = imfYId;
    data['role'] = role;
    data['userName'] = userName;
    data['mobileprivileges'] = mobileprivileges;
    data['ivrmimP_Id'] = ivrmimPId;
    data['mI_ID'] = mIID;
    data['schoolcollegeflag'] = schoolcollegeflag;
    data['userImagePath'] = userImagePath;
    data['pageId'] = pageId;
    data['ivrmirP_AddFlag'] = ivrmirPAddFlag;
    data['ivrmirP_UpdateFlag'] = ivrmirPUpdateFlag;
    data['ivrmirP_DeleteFlag'] = ivrmirPDeleteFlag;
    data['ivrmirP_ReportFlag'] = ivrmirPReportFlag;
    data['ivrmirP_SearchFlag'] = ivrmirPSearchFlag;
    data['ivrmirP_ProcessFlag'] = ivrmirPProcessFlag;
    data['ivrmrmaP_Id'] = ivrmrmaPId;
    if (staffmobileappprivileges != null) {
      data['staffmobileappprivileges'] = staffmobileappprivileges!.toJson();
    }
    data['cutoffdate'] = cutoffdate;
    data['subscriptionenddate'] = subscriptionenddate;
    data['subscriptionFlag'] = subscriptionFlag;
    if (institutionlist != null) {
      data['institutionlist'] = institutionlist!.toJson();
    }
    data['asmaY_Year'] = asmaYYear;
    data['flag'] = flag;
    data['dob'] = dob;
    data['mobno'] = mobno;
    data['studname'] = studname;
    data['payment'] = payment;
    data['registration'] = registration;
    data['roleforlogin'] = roleforlogin;
    data['empcode'] = empcode;
    data['mI_Idforlogin'] = mIIdforlogin;
    data['paymentNootificationGeneral'] = paymentNootificationGeneral;
    data['roleTypeId'] = roleTypeId;
    data['emp_Id'] = empId;
    data['ivrmumalP_AddFlg'] = ivrmumalPAddFlg;
    data['ivrmumalP_UpdateFlg'] = ivrmumalPUpdateFlg;
    data['ivrmumalP_DeleteFlg'] = ivrmumalPDeleteFlg;
    data['almsT_Id'] = almsTId;
    data['mI_BackgroundImage'] = mIBackgroundImage;
    data['mI_Logo'] = mILogo;
    return data;
  }
}

class MiIdList {
  int? mIId;

  MiIdList({this.mIId});

  MiIdList.fromJson(Map<String, dynamic> json) {
    mIId = json['mI_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['mI_Id'] = mIId;
    return data;
  }
}

class Staffmobileappprivileges {
  String? type;
  List<LoginValues>? values;

  Staffmobileappprivileges({this.type, this.values});

  Staffmobileappprivileges.fromJson(Map<String, dynamic> json) {
    type = json['\$type'];
    if (json['\$values'] != null) {
      values = <LoginValues>[];
      json['\$values'].forEach((v) {
        values!.add(LoginValues.fromJson(v));
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

class LoginValues {
  int? amsTId;
  int? smscreditalert;
  bool? smsalrtflag;
  int? roleId;
  bool? isLogged;
  int? amaYActiveFlag;
  int? asmaYOrder;
  int? userId;
  int? rcredit;
  int? ivrMMOId;
  int? asmaYId;
  int? imfYId;
  int? role;
  int? ivrmimPId;
  int? mIID;
  int? pageId;
  bool? ivrmirPAddFlag;
  bool? ivrmirPUpdateFlag;
  bool? ivrmirPDeleteFlag;
  bool? ivrmirPReportFlag;
  bool? ivrmirPSearchFlag;
  bool? ivrmirPProcessFlag;
  String? pagename;
  String? pageicon;
  String? pageurl;
  int? ivrmrmaPId;
  String? cutoffdate;
  String? subscriptionenddate;
  bool? subscriptionFlag;
  String? dob;
  int? mobno;
  bool? payment;
  bool? registration;
  int? empcode;
  int? mIIdforlogin;
  int? paymentNootificationGeneral;
  int? roleTypeId;
  int? empId;
  bool? ivrmmaPAddFlg;
  bool? ivrmmaPUpdateFlg;
  bool? ivrmmaPDeleteFlg;
  bool? ivrmumalPAddFlg;
  bool? ivrmumalPUpdateFlg;
  bool? ivrmumalPDeleteFlg;
  int? almsTId;

  LoginValues(
      {this.amsTId,
      this.smscreditalert,
      this.smsalrtflag,
      this.roleId,
      this.isLogged,
      this.amaYActiveFlag,
      this.asmaYOrder,
      this.userId,
      this.rcredit,
      this.ivrMMOId,
      this.asmaYId,
      this.imfYId,
      this.role,
      this.ivrmimPId,
      this.mIID,
      this.pageId,
      this.ivrmirPAddFlag,
      this.ivrmirPUpdateFlag,
      this.ivrmirPDeleteFlag,
      this.ivrmirPReportFlag,
      this.ivrmirPSearchFlag,
      this.ivrmirPProcessFlag,
      this.pagename,
      this.pageicon,
      this.pageurl,
      this.ivrmrmaPId,
      this.cutoffdate,
      this.subscriptionenddate,
      this.subscriptionFlag,
      this.dob,
      this.mobno,
      this.payment,
      this.registration,
      this.empcode,
      this.mIIdforlogin,
      this.paymentNootificationGeneral,
      this.roleTypeId,
      this.empId,
      this.ivrmmaPAddFlg,
      this.ivrmmaPUpdateFlg,
      this.ivrmmaPDeleteFlg,
      this.ivrmumalPAddFlg,
      this.ivrmumalPUpdateFlg,
      this.ivrmumalPDeleteFlg,
      this.almsTId});

  LoginValues.fromJson(Map<String, dynamic> json) {
    amsTId = json['amsT_Id'];
    smscreditalert = json['smscreditalert'];
    smsalrtflag = json['smsalrtflag'];
    roleId = json['roleId'];
    isLogged = json['isLogged'];
    amaYActiveFlag = json['amaY_ActiveFlag'];
    asmaYOrder = json['asmaY_Order'];
    userId = json['userId'];
    rcredit = json['rcredit'];
    ivrMMOId = json['ivrM_MO_Id'];
    asmaYId = json['asmaY_Id'];
    imfYId = json['imfY_Id'];
    role = json['role'];
    ivrmimPId = json['ivrmimP_Id'];
    mIID = json['mI_ID'];
    pageId = json['pageId'];
    ivrmirPAddFlag = json['ivrmirP_AddFlag'];
    ivrmirPUpdateFlag = json['ivrmirP_UpdateFlag'];
    ivrmirPDeleteFlag = json['ivrmirP_DeleteFlag'];
    ivrmirPReportFlag = json['ivrmirP_ReportFlag'];
    ivrmirPSearchFlag = json['ivrmirP_SearchFlag'];
    ivrmirPProcessFlag = json['ivrmirP_ProcessFlag'];
    pagename = json['pagename'];
    pageicon = json['pageicon'];
    pageurl = json['pageurl'];
    ivrmrmaPId = json['ivrmrmaP_Id'];
    cutoffdate = json['cutoffdate'];
    subscriptionenddate = json['subscriptionenddate'];
    subscriptionFlag = json['subscriptionFlag'];
    dob = json['dob'];
    mobno = json['mobno'];
    payment = json['payment'];
    registration = json['registration'];
    empcode = json['empcode'];
    mIIdforlogin = json['mI_Idforlogin'];
    paymentNootificationGeneral = json['paymentNootificationGeneral'];
    roleTypeId = json['roleTypeId'];
    empId = json['emp_Id'];
    ivrmmaPAddFlg = json['ivrmmaP_AddFlg'];
    ivrmmaPUpdateFlg = json['ivrmmaP_UpdateFlg'];
    ivrmmaPDeleteFlg = json['ivrmmaP_DeleteFlg'];
    ivrmumalPAddFlg = json['ivrmumalP_AddFlg'];
    ivrmumalPUpdateFlg = json['ivrmumalP_UpdateFlg'];
    ivrmumalPDeleteFlg = json['ivrmumalP_DeleteFlg'];
    almsTId = json['almsT_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amsT_Id'] = amsTId;
    data['smscreditalert'] = smscreditalert;
    data['smsalrtflag'] = smsalrtflag;
    data['roleId'] = roleId;
    data['isLogged'] = isLogged;
    data['amaY_ActiveFlag'] = amaYActiveFlag;
    data['asmaY_Order'] = asmaYOrder;
    data['userId'] = userId;
    data['rcredit'] = rcredit;
    data['ivrM_MO_Id'] = ivrMMOId;
    data['asmaY_Id'] = asmaYId;
    data['imfY_Id'] = imfYId;
    data['role'] = role;
    data['ivrmimP_Id'] = ivrmimPId;
    data['mI_ID'] = mIID;
    data['pageId'] = pageId;
    data['ivrmirP_AddFlag'] = ivrmirPAddFlag;
    data['ivrmirP_UpdateFlag'] = ivrmirPUpdateFlag;
    data['ivrmirP_DeleteFlag'] = ivrmirPDeleteFlag;
    data['ivrmirP_ReportFlag'] = ivrmirPReportFlag;
    data['ivrmirP_SearchFlag'] = ivrmirPSearchFlag;
    data['ivrmirP_ProcessFlag'] = ivrmirPProcessFlag;
    data['pagename'] = pagename;
    data['pageicon'] = pageicon;
    data['pageurl'] = pageurl;
    data['ivrmrmaP_Id'] = ivrmrmaPId;
    data['cutoffdate'] = cutoffdate;
    data['subscriptionenddate'] = subscriptionenddate;
    data['subscriptionFlag'] = subscriptionFlag;
    data['dob'] = dob;
    data['mobno'] = mobno;
    data['payment'] = payment;
    data['registration'] = registration;
    data['empcode'] = empcode;
    data['mI_Idforlogin'] = mIIdforlogin;
    data['paymentNootificationGeneral'] = paymentNootificationGeneral;
    data['roleTypeId'] = roleTypeId;
    data['emp_Id'] = empId;
    data['ivrmmaP_AddFlg'] = ivrmmaPAddFlg;
    data['ivrmmaP_UpdateFlg'] = ivrmmaPUpdateFlg;
    data['ivrmmaP_DeleteFlg'] = ivrmmaPDeleteFlg;
    data['ivrmumalP_AddFlg'] = ivrmumalPAddFlg;
    data['ivrmumalP_UpdateFlg'] = ivrmumalPUpdateFlg;
    data['ivrmumalP_DeleteFlg'] = ivrmumalPDeleteFlg;
    data['almsT_Id'] = almsTId;
    return data;
  }
}
