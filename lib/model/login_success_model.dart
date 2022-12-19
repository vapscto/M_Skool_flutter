class LoginSuccessModel {
  int? amsTId;
  int? asmcLId;
  int? asmSId;
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
  String? clsnme;
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
  Institutedetails? institutedetails;

  LoginSuccessModel(
      {this.amsTId,
      this.asmSId,
      this.asmcLId,
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
      this.clsnme,
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
      this.mILogo,
      this.institutedetails});

  LoginSuccessModel.fromJson(Map<String, dynamic> json) {
    amsTId = json['amsT_Id'];
    asmcLId = json['asmcL_Id'];
    asmSId = json['asmS_Id'];
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
    clsnme = json['clsnme'];
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
    institutedetails = json['institutedetails'] != null
        ? Institutedetails.fromJson(json['institutedetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['amsT_Id'] = amsTId;
    data['asmcL_Id'] = asmcLId;
    data['asmS_Id'] = asmSId;
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
    data['clsnme'] = clsnme;
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
    if (institutedetails != null) {
      data['institutedetails'] = institutedetails!.toJson();
    }
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

class Institutedetails {
  Institutedetails({
    this.type,
    this.values,
  });

  Institutedetails.fromJson(dynamic json) {
    type = json['\$type'];
    if (json['\$values'] != null) {
      values = [];
      json['\$values'].forEach((v) {
        values?.add(InstitutedetailsValues.fromJson(v));
      });
    }
  }
  String? type;
  List<InstitutedetailsValues>? values;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['\$type'] = type;
    if (values != null) {
      map['\$values'] = values?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// mI_Id : 4
/// mO_Id : 2
/// mI_Name : "Vaps Technosoft Pvt LTD"
/// mI_Type : "Yearly"
/// mI_Address1 : "No. 90"
/// mI_Address2 : "KHB Colony , Basaveshwara Nagar"
/// mI_Address3 : "Bangalore"
/// ivrmmcT_Name : "Bangalore"
/// ivrmmS_Id : 17
/// ivrmmC_Id : 101
/// mI_Pincode : 560025
/// mI_BackgroundImage : "https://bdcampusstrg.blob.core.windows.net/files/3/InstitutionLogo/59bf1c56-9f32-4ba3-ad56-3d412cee2ab3.jpg"
/// mI_FormColor : "#663e3e"
/// mI_FontColor : "#663a3a"
/// mI_FontSize : 12
/// mI_WeekStartDay : "Monday"
/// mI_DateFormat : "DMY"
/// mI_DateSeparator : "/"
/// mI_Logo : "https://bdcampusstrg.blob.core.windows.net/files/3/InstitutionLogo/59bf1c56-9f32-4ba3-ad56-3d412cee2ab3.jpg"
/// mI_ActiveFlag : 1
/// mI_FranchiseFlag : 0
/// mI_Affiliation : "ICSC"
/// mI_Subdomain : "BGHSRS"
/// mI_AboutInstitute : "\n\"Vaps Group of Institutions\", a member of the prestigious Vaps group of Institutions,\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n             Keeping alive the vision of our founders, we endeavour to equip our students academically, socially and spiritually to meet the challenges and adapt to a fast moving world with wisdom and fortitude for the general good of the community."
/// mI_ContactDetails : "If you have queries regarding online application submission or technical issues please contact to above given \r\nemail address or phone number, between 9 am to 3 pm except holidays."
/// mI_HelpFile : "Welcome to Vaps Tech demo presentation"
/// mI_SchoolCollegeFlag : "S"
/// mI_NAAC_InstitutionTypeFlg : "School"
/// mI_NAAC_SubInstitutionTypeFlg : "Others"
/// mI_VCStudentFlag : ""
/// mI_VCOthersFlag : ""
/// mI_MSTeamsClientId : "1b3429dd-a80d-4434-a399-6f153d0f88c3"
/// mI_MSTeamsTenentId : "28e2455c-c0be-4145-b1eb-88fb593b5e0a"
/// mI_MSTemasClinetSecretCode : "9Fl-2SdET44~G~cIxdGk3qbH8.l36zHa33"
/// mI_MSTeamsAppAccessTockenURL : "https://login.microsoftonline.com/{{TenantID}}/oauth2/v2.0/token"
/// mI_MSTeamsUserAceessTockenURL : "https://login.microsoftonline.com/TenantID/oauth2/v2.0/token"
/// mI_MSTeamsMeetingScheduleURL : "https://graph.microsoft.com/beta/me/onlineMeetings"
/// mI_MSTeamsAdminUsername : "admin@bghsschools.onmicrosoft.com"
/// mI_MSTeamsAdminPassword : "BGHS@2468"
/// mI_MSTeamsScope : "https://graph.microsoft.com/.default"
/// mI_MSTeamsGrantType : "password"
/// mI_SMSAlertToemailids : ""
/// mI_WhatsAppTextUrl : "https://digiglitz.in/whatsapi/api/send/text"
/// mI_WhatsAppImageUrl : "https://digiglitz.in/whatsapi/api/send/image"
/// mI_WhatsAppPdfUrl : "https://digiglitz.in/whatsapi/api/send/pdf"
/// mI_WhatsAppVideoUrl : "https://digiglitz.in/whatsapi/api/send/video"
/// mI_EntityId : "1201159279971179231"
/// createdDate : "2017-05-19T19:10:18.03"
/// updatedDate : "2022-11-24T12:39:48.88"

class InstitutedetailsValues {
  InstitutedetailsValues({
    this.mIId,
    this.mOId,
    this.mIName,
    this.mIType,
    this.mIAddress1,
    this.mIAddress2,
    this.mIAddress3,
    this.ivrmmcTName,
    this.ivrmmSId,
    this.ivrmmCId,
    this.mIPincode,
    this.mIBackgroundImage,
    this.mIFormColor,
    this.mIFontColor,
    this.mIFontSize,
    this.mIWeekStartDay,
    this.mIDateFormat,
    this.mIDateSeparator,
    this.mILogo,
    this.mIActiveFlag,
    this.mIFranchiseFlag,
    this.mIAffiliation,
    this.mISubdomain,
    this.mIAboutInstitute,
    this.mIContactDetails,
    this.mIHelpFile,
    this.mISchoolCollegeFlag,
    this.mINAACInstitutionTypeFlg,
    this.mINAACSubInstitutionTypeFlg,
    this.mIVCStudentFlag,
    this.mIVCOthersFlag,
    this.mIMSTeamsClientId,
    this.mIMSTeamsTenentId,
    this.mIMSTemasClinetSecretCode,
    this.mIMSTeamsAppAccessTockenURL,
    this.mIMSTeamsUserAceessTockenURL,
    this.mIMSTeamsMeetingScheduleURL,
    this.mIMSTeamsAdminUsername,
    this.mIMSTeamsAdminPassword,
    this.mIMSTeamsScope,
    this.mIMSTeamsGrantType,
    this.mISMSAlertToemailids,
    this.mIWhatsAppTextUrl,
    this.mIWhatsAppImageUrl,
    this.mIWhatsAppPdfUrl,
    this.mIWhatsAppVideoUrl,
    this.mIEntityId,
    this.createdDate,
    this.updatedDate,
  });

  InstitutedetailsValues.fromJson(dynamic json) {
    mIId = json['mI_Id'];
    mOId = json['mO_Id'];
    mIName = json['mI_Name'];
    mIType = json['mI_Type'];
    mIAddress1 = json['mI_Address1'];
    mIAddress2 = json['mI_Address2'];
    mIAddress3 = json['mI_Address3'];
    ivrmmcTName = json['ivrmmcT_Name'];
    ivrmmSId = json['ivrmmS_Id'];
    ivrmmCId = json['ivrmmC_Id'];
    mIPincode = json['mI_Pincode'];
    mIBackgroundImage = json['mI_BackgroundImage'];
    mIFormColor = json['mI_FormColor'];
    mIFontColor = json['mI_FontColor'];
    mIFontSize = json['mI_FontSize'];
    mIWeekStartDay = json['mI_WeekStartDay'];
    mIDateFormat = json['mI_DateFormat'];
    mIDateSeparator = json['mI_DateSeparator'];
    mILogo = json['mI_Logo'];
    mIActiveFlag = json['mI_ActiveFlag'];
    mIFranchiseFlag = json['mI_FranchiseFlag'];
    mIAffiliation = json['mI_Affiliation'];
    mISubdomain = json['mI_Subdomain'];
    mIAboutInstitute = json['mI_AboutInstitute'];
    mIContactDetails = json['mI_ContactDetails'];
    mIHelpFile = json['mI_HelpFile'];
    mISchoolCollegeFlag = json['mI_SchoolCollegeFlag'];
    mINAACInstitutionTypeFlg = json['mI_NAAC_InstitutionTypeFlg'];
    mINAACSubInstitutionTypeFlg = json['mI_NAAC_SubInstitutionTypeFlg'];
    mIVCStudentFlag = json['mI_VCStudentFlag'];
    mIVCOthersFlag = json['mI_VCOthersFlag'];
    mIMSTeamsClientId = json['mI_MSTeamsClientId'];
    mIMSTeamsTenentId = json['mI_MSTeamsTenentId'];
    mIMSTemasClinetSecretCode = json['mI_MSTemasClinetSecretCode'];
    mIMSTeamsAppAccessTockenURL = json['mI_MSTeamsAppAccessTockenURL'];
    mIMSTeamsUserAceessTockenURL = json['mI_MSTeamsUserAceessTockenURL'];
    mIMSTeamsMeetingScheduleURL = json['mI_MSTeamsMeetingScheduleURL'];
    mIMSTeamsAdminUsername = json['mI_MSTeamsAdminUsername'];
    mIMSTeamsAdminPassword = json['mI_MSTeamsAdminPassword'];
    mIMSTeamsScope = json['mI_MSTeamsScope'];
    mIMSTeamsGrantType = json['mI_MSTeamsGrantType'];
    mISMSAlertToemailids = json['mI_SMSAlertToemailids'];
    mIWhatsAppTextUrl = json['mI_WhatsAppTextUrl'];
    mIWhatsAppImageUrl = json['mI_WhatsAppImageUrl'];
    mIWhatsAppPdfUrl = json['mI_WhatsAppPdfUrl'];
    mIWhatsAppVideoUrl = json['mI_WhatsAppVideoUrl'];
    mIEntityId = json['mI_EntityId'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
  }
  num? mIId;
  num? mOId;
  String? mIName;
  String? mIType;
  String? mIAddress1;
  String? mIAddress2;
  String? mIAddress3;
  String? ivrmmcTName;
  num? ivrmmSId;
  num? ivrmmCId;
  num? mIPincode;
  String? mIBackgroundImage;
  String? mIFormColor;
  String? mIFontColor;
  num? mIFontSize;
  String? mIWeekStartDay;
  String? mIDateFormat;
  String? mIDateSeparator;
  String? mILogo;
  num? mIActiveFlag;
  num? mIFranchiseFlag;
  String? mIAffiliation;
  String? mISubdomain;
  String? mIAboutInstitute;
  String? mIContactDetails;
  String? mIHelpFile;
  String? mISchoolCollegeFlag;
  String? mINAACInstitutionTypeFlg;
  String? mINAACSubInstitutionTypeFlg;
  String? mIVCStudentFlag;
  String? mIVCOthersFlag;
  String? mIMSTeamsClientId;
  String? mIMSTeamsTenentId;
  String? mIMSTemasClinetSecretCode;
  String? mIMSTeamsAppAccessTockenURL;
  String? mIMSTeamsUserAceessTockenURL;
  String? mIMSTeamsMeetingScheduleURL;
  String? mIMSTeamsAdminUsername;
  String? mIMSTeamsAdminPassword;
  String? mIMSTeamsScope;
  String? mIMSTeamsGrantType;
  String? mISMSAlertToemailids;
  String? mIWhatsAppTextUrl;
  String? mIWhatsAppImageUrl;
  String? mIWhatsAppPdfUrl;
  String? mIWhatsAppVideoUrl;
  String? mIEntityId;
  String? createdDate;
  String? updatedDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mI_Id'] = mIId;
    map['mO_Id'] = mOId;
    map['mI_Name'] = mIName;
    map['mI_Type'] = mIType;
    map['mI_Address1'] = mIAddress1;
    map['mI_Address2'] = mIAddress2;
    map['mI_Address3'] = mIAddress3;
    map['ivrmmcT_Name'] = ivrmmcTName;
    map['ivrmmS_Id'] = ivrmmSId;
    map['ivrmmC_Id'] = ivrmmCId;
    map['mI_Pincode'] = mIPincode;
    map['mI_BackgroundImage'] = mIBackgroundImage;
    map['mI_FormColor'] = mIFormColor;
    map['mI_FontColor'] = mIFontColor;
    map['mI_FontSize'] = mIFontSize;
    map['mI_WeekStartDay'] = mIWeekStartDay;
    map['mI_DateFormat'] = mIDateFormat;
    map['mI_DateSeparator'] = mIDateSeparator;
    map['mI_Logo'] = mILogo;
    map['mI_ActiveFlag'] = mIActiveFlag;
    map['mI_FranchiseFlag'] = mIFranchiseFlag;
    map['mI_Affiliation'] = mIAffiliation;
    map['mI_Subdomain'] = mISubdomain;
    map['mI_AboutInstitute'] = mIAboutInstitute;
    map['mI_ContactDetails'] = mIContactDetails;
    map['mI_HelpFile'] = mIHelpFile;
    map['mI_SchoolCollegeFlag'] = mISchoolCollegeFlag;
    map['mI_NAAC_InstitutionTypeFlg'] = mINAACInstitutionTypeFlg;
    map['mI_NAAC_SubInstitutionTypeFlg'] = mINAACSubInstitutionTypeFlg;
    map['mI_VCStudentFlag'] = mIVCStudentFlag;
    map['mI_VCOthersFlag'] = mIVCOthersFlag;
    map['mI_MSTeamsClientId'] = mIMSTeamsClientId;
    map['mI_MSTeamsTenentId'] = mIMSTeamsTenentId;
    map['mI_MSTemasClinetSecretCode'] = mIMSTemasClinetSecretCode;
    map['mI_MSTeamsAppAccessTockenURL'] = mIMSTeamsAppAccessTockenURL;
    map['mI_MSTeamsUserAceessTockenURL'] = mIMSTeamsUserAceessTockenURL;
    map['mI_MSTeamsMeetingScheduleURL'] = mIMSTeamsMeetingScheduleURL;
    map['mI_MSTeamsAdminUsername'] = mIMSTeamsAdminUsername;
    map['mI_MSTeamsAdminPassword'] = mIMSTeamsAdminPassword;
    map['mI_MSTeamsScope'] = mIMSTeamsScope;
    map['mI_MSTeamsGrantType'] = mIMSTeamsGrantType;
    map['mI_SMSAlertToemailids'] = mISMSAlertToemailids;
    map['mI_WhatsAppTextUrl'] = mIWhatsAppTextUrl;
    map['mI_WhatsAppImageUrl'] = mIWhatsAppImageUrl;
    map['mI_WhatsAppPdfUrl'] = mIWhatsAppPdfUrl;
    map['mI_WhatsAppVideoUrl'] = mIWhatsAppVideoUrl;
    map['mI_EntityId'] = mIEntityId;
    map['createdDate'] = createdDate;
    map['updatedDate'] = updatedDate;
    return map;
  }
}
