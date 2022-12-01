class InboxModel {
  bool? _returnval;
  bool? _alreadyCnt;
  int? _userId;
  String? _rolename;
  bool? _ivrmgCEnableSTIntFlg;
  bool? _ivrmgCEnableCTIntFlg;
  bool? _ivrmgCEnableHODIntFlg;
  bool? _ivrmgCEnablePrincipalIntFlg;
  bool? _ivrmgCEnableASIntFlg;
  int? _asmclid;
  int? _asmsid;
  int? _amsTId;
  int? _hrmEId1;
  int? _studentId;
  int? _hrmEId;
  int? _userhrmEId;
  int? _employeeId;
  int? _asmcLId;
  int? _asmSId;
  int? _ivrmrTId;
  bool? _ivrmgCEnableECIntFlg;
  String? _roleFlag;
  Roletype? _roletype;
  Configflag? _configflag;
  Getinboxmsg? _getinboxmsg;
  GetinboxmsgReadflg? _getinboxmsgReadflg;
  int? _inboxcount;
  int? _isminTId;
  int? _mIId;
  int? _isminTInteractionId;
  int? _asmaYId;
  int? _isminTComposedById;
  String? _isminTDateTime;
  bool? _isminTActiveFlag;
  int? _isminTCreatedBy;
  int? _isminTUpdatedBy;
  int? _istinTId;
  int? _istinTToId;
  int? _istinTComposedById;
  String? _istinTDateTime;
  int? _istinTInteractionOrder;
  bool? _istinTActiveFlag;
  int? _istinTCreatedBy;
  int? _istinTUpdatedBy;
  String? _notificationflag;
  int? _amcsTId;
  int? _amcoid;
  int? _ambid;
  int? _amseid;
  int? _acmsid;
  int? _amcOId;
  int? _amBId;
  int? _amsEId;
  int? _amBOrder;
  int? _amsESEMOrder;
  int? _acmSId;
  int? _acmSOrder;

  InboxModel(
      {bool? returnval,
      bool? alreadyCnt,
      int? userId,
      String? rolename,
      bool? ivrmgCEnableSTIntFlg,
      bool? ivrmgCEnableCTIntFlg,
      bool? ivrmgCEnableHODIntFlg,
      bool? ivrmgCEnablePrincipalIntFlg,
      bool? ivrmgCEnableASIntFlg,
      int? asmclid,
      int? asmsid,
      int? amsTId,
      int? hrmEId1,
      int? studentId,
      int? hrmEId,
      int? userhrmEId,
      int? employeeId,
      int? asmcLId,
      int? asmSId,
      int? ivrmrTId,
      bool? ivrmgCEnableECIntFlg,
      String? roleFlag,
      Roletype? roletype,
      Configflag? configflag,
      Getinboxmsg? getinboxmsg,
      GetinboxmsgReadflg? getinboxmsgReadflg,
      int? inboxcount,
      int? isminTId,
      int? mIId,
      int? isminTInteractionId,
      int? asmaYId,
      int? isminTComposedById,
      String? isminTDateTime,
      bool? isminTActiveFlag,
      int? isminTCreatedBy,
      int? isminTUpdatedBy,
      int? istinTId,
      int? istinTToId,
      int? istinTComposedById,
      String? istinTDateTime,
      int? istinTInteractionOrder,
      bool? istinTActiveFlag,
      int? istinTCreatedBy,
      int? istinTUpdatedBy,
      String? notificationflag,
      int? amcsTId,
      int? amcoid,
      int? ambid,
      int? amseid,
      int? acmsid,
      int? amcOId,
      int? amBId,
      int? amsEId,
      int? amBOrder,
      int? amsESEMOrder,
      int? acmSId,
      int? acmSOrder}) {
    if (returnval != null) {
      this._returnval = returnval;
    }
    if (alreadyCnt != null) {
      this._alreadyCnt = alreadyCnt;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (rolename != null) {
      this._rolename = rolename;
    }
    if (ivrmgCEnableSTIntFlg != null) {
      this._ivrmgCEnableSTIntFlg = ivrmgCEnableSTIntFlg;
    }
    if (ivrmgCEnableCTIntFlg != null) {
      this._ivrmgCEnableCTIntFlg = ivrmgCEnableCTIntFlg;
    }
    if (ivrmgCEnableHODIntFlg != null) {
      this._ivrmgCEnableHODIntFlg = ivrmgCEnableHODIntFlg;
    }
    if (ivrmgCEnablePrincipalIntFlg != null) {
      this._ivrmgCEnablePrincipalIntFlg = ivrmgCEnablePrincipalIntFlg;
    }
    if (ivrmgCEnableASIntFlg != null) {
      this._ivrmgCEnableASIntFlg = ivrmgCEnableASIntFlg;
    }
    if (asmclid != null) {
      this._asmclid = asmclid;
    }
    if (asmsid != null) {
      this._asmsid = asmsid;
    }
    if (amsTId != null) {
      this._amsTId = amsTId;
    }
    if (hrmEId1 != null) {
      this._hrmEId1 = hrmEId1;
    }
    if (studentId != null) {
      this._studentId = studentId;
    }
    if (hrmEId != null) {
      this._hrmEId = hrmEId;
    }
    if (userhrmEId != null) {
      this._userhrmEId = userhrmEId;
    }
    if (employeeId != null) {
      this._employeeId = employeeId;
    }
    if (asmcLId != null) {
      this._asmcLId = asmcLId;
    }
    if (asmSId != null) {
      this._asmSId = asmSId;
    }
    if (ivrmrTId != null) {
      this._ivrmrTId = ivrmrTId;
    }
    if (ivrmgCEnableECIntFlg != null) {
      this._ivrmgCEnableECIntFlg = ivrmgCEnableECIntFlg;
    }
    if (roleFlag != null) {
      this._roleFlag = roleFlag;
    }
    if (roletype != null) {
      this._roletype = roletype;
    }
    if (configflag != null) {
      this._configflag = configflag;
    }
    if (getinboxmsg != null) {
      this._getinboxmsg = getinboxmsg;
    }
    if (getinboxmsgReadflg != null) {
      this._getinboxmsgReadflg = getinboxmsgReadflg;
    }
    if (inboxcount != null) {
      this._inboxcount = inboxcount;
    }
    if (isminTId != null) {
      this._isminTId = isminTId;
    }
    if (mIId != null) {
      this._mIId = mIId;
    }
    if (isminTInteractionId != null) {
      this._isminTInteractionId = isminTInteractionId;
    }
    if (asmaYId != null) {
      this._asmaYId = asmaYId;
    }
    if (isminTComposedById != null) {
      this._isminTComposedById = isminTComposedById;
    }
    if (isminTDateTime != null) {
      this._isminTDateTime = isminTDateTime;
    }
    if (isminTActiveFlag != null) {
      this._isminTActiveFlag = isminTActiveFlag;
    }
    if (isminTCreatedBy != null) {
      this._isminTCreatedBy = isminTCreatedBy;
    }
    if (isminTUpdatedBy != null) {
      this._isminTUpdatedBy = isminTUpdatedBy;
    }
    if (istinTId != null) {
      this._istinTId = istinTId;
    }
    if (istinTToId != null) {
      this._istinTToId = istinTToId;
    }
    if (istinTComposedById != null) {
      this._istinTComposedById = istinTComposedById;
    }
    if (istinTDateTime != null) {
      this._istinTDateTime = istinTDateTime;
    }
    if (istinTInteractionOrder != null) {
      this._istinTInteractionOrder = istinTInteractionOrder;
    }
    if (istinTActiveFlag != null) {
      this._istinTActiveFlag = istinTActiveFlag;
    }
    if (istinTCreatedBy != null) {
      this._istinTCreatedBy = istinTCreatedBy;
    }
    if (istinTUpdatedBy != null) {
      this._istinTUpdatedBy = istinTUpdatedBy;
    }
    if (notificationflag != null) {
      this._notificationflag = notificationflag;
    }
    if (amcsTId != null) {
      this._amcsTId = amcsTId;
    }
    if (amcoid != null) {
      this._amcoid = amcoid;
    }
    if (ambid != null) {
      this._ambid = ambid;
    }
    if (amseid != null) {
      this._amseid = amseid;
    }
    if (acmsid != null) {
      this._acmsid = acmsid;
    }
    if (amcOId != null) {
      this._amcOId = amcOId;
    }
    if (amBId != null) {
      this._amBId = amBId;
    }
    if (amsEId != null) {
      this._amsEId = amsEId;
    }
    if (amBOrder != null) {
      this._amBOrder = amBOrder;
    }
    if (amsESEMOrder != null) {
      this._amsESEMOrder = amsESEMOrder;
    }
    if (acmSId != null) {
      this._acmSId = acmSId;
    }
    if (acmSOrder != null) {
      this._acmSOrder = acmSOrder;
    }
  }

  bool? get returnval => _returnval;
  set returnval(bool? returnval) => _returnval = returnval;
  bool? get alreadyCnt => _alreadyCnt;
  set alreadyCnt(bool? alreadyCnt) => _alreadyCnt = alreadyCnt;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get rolename => _rolename;
  set rolename(String? rolename) => _rolename = rolename;
  bool? get ivrmgCEnableSTIntFlg => _ivrmgCEnableSTIntFlg;
  set ivrmgCEnableSTIntFlg(bool? ivrmgCEnableSTIntFlg) =>
      _ivrmgCEnableSTIntFlg = ivrmgCEnableSTIntFlg;
  bool? get ivrmgCEnableCTIntFlg => _ivrmgCEnableCTIntFlg;
  set ivrmgCEnableCTIntFlg(bool? ivrmgCEnableCTIntFlg) =>
      _ivrmgCEnableCTIntFlg = ivrmgCEnableCTIntFlg;
  bool? get ivrmgCEnableHODIntFlg => _ivrmgCEnableHODIntFlg;
  set ivrmgCEnableHODIntFlg(bool? ivrmgCEnableHODIntFlg) =>
      _ivrmgCEnableHODIntFlg = ivrmgCEnableHODIntFlg;
  bool? get ivrmgCEnablePrincipalIntFlg => _ivrmgCEnablePrincipalIntFlg;
  set ivrmgCEnablePrincipalIntFlg(bool? ivrmgCEnablePrincipalIntFlg) =>
      _ivrmgCEnablePrincipalIntFlg = ivrmgCEnablePrincipalIntFlg;
  bool? get ivrmgCEnableASIntFlg => _ivrmgCEnableASIntFlg;
  set ivrmgCEnableASIntFlg(bool? ivrmgCEnableASIntFlg) =>
      _ivrmgCEnableASIntFlg = ivrmgCEnableASIntFlg;
  int? get asmclid => _asmclid;
  set asmclid(int? asmclid) => _asmclid = asmclid;
  int? get asmsid => _asmsid;
  set asmsid(int? asmsid) => _asmsid = asmsid;
  int? get amsTId => _amsTId;
  set amsTId(int? amsTId) => _amsTId = amsTId;
  int? get hrmEId1 => _hrmEId1;
  set hrmEId1(int? hrmEId1) => _hrmEId1 = hrmEId1;
  int? get studentId => _studentId;
  set studentId(int? studentId) => _studentId = studentId;
  int? get hrmEId => _hrmEId;
  set hrmEId(int? hrmEId) => _hrmEId = hrmEId;
  int? get userhrmEId => _userhrmEId;
  set userhrmEId(int? userhrmEId) => _userhrmEId = userhrmEId;
  int? get employeeId => _employeeId;
  set employeeId(int? employeeId) => _employeeId = employeeId;
  int? get asmcLId => _asmcLId;
  set asmcLId(int? asmcLId) => _asmcLId = asmcLId;
  int? get asmSId => _asmSId;
  set asmSId(int? asmSId) => _asmSId = asmSId;
  int? get ivrmrTId => _ivrmrTId;
  set ivrmrTId(int? ivrmrTId) => _ivrmrTId = ivrmrTId;
  bool? get ivrmgCEnableECIntFlg => _ivrmgCEnableECIntFlg;
  set ivrmgCEnableECIntFlg(bool? ivrmgCEnableECIntFlg) =>
      _ivrmgCEnableECIntFlg = ivrmgCEnableECIntFlg;
  String? get roleFlag => _roleFlag;
  set roleFlag(String? roleFlag) => _roleFlag = roleFlag;
  Roletype? get roletype => _roletype;
  set roletype(Roletype? roletype) => _roletype = roletype;
  Configflag? get configflag => _configflag;
  set configflag(Configflag? configflag) => _configflag = configflag;
  Getinboxmsg? get getinboxmsg => _getinboxmsg;
  set getinboxmsg(Getinboxmsg? getinboxmsg) => _getinboxmsg = getinboxmsg;
  GetinboxmsgReadflg? get getinboxmsgReadflg => _getinboxmsgReadflg;
  set getinboxmsgReadflg(GetinboxmsgReadflg? getinboxmsgReadflg) =>
      _getinboxmsgReadflg = getinboxmsgReadflg;
  int? get inboxcount => _inboxcount;
  set inboxcount(int? inboxcount) => _inboxcount = inboxcount;
  int? get isminTId => _isminTId;
  set isminTId(int? isminTId) => _isminTId = isminTId;
  int? get mIId => _mIId;
  set mIId(int? mIId) => _mIId = mIId;
  int? get isminTInteractionId => _isminTInteractionId;
  set isminTInteractionId(int? isminTInteractionId) =>
      _isminTInteractionId = isminTInteractionId;
  int? get asmaYId => _asmaYId;
  set asmaYId(int? asmaYId) => _asmaYId = asmaYId;
  int? get isminTComposedById => _isminTComposedById;
  set isminTComposedById(int? isminTComposedById) =>
      _isminTComposedById = isminTComposedById;
  String? get isminTDateTime => _isminTDateTime;
  set isminTDateTime(String? isminTDateTime) =>
      _isminTDateTime = isminTDateTime;
  bool? get isminTActiveFlag => _isminTActiveFlag;
  set isminTActiveFlag(bool? isminTActiveFlag) =>
      _isminTActiveFlag = isminTActiveFlag;
  int? get isminTCreatedBy => _isminTCreatedBy;
  set isminTCreatedBy(int? isminTCreatedBy) =>
      _isminTCreatedBy = isminTCreatedBy;
  int? get isminTUpdatedBy => _isminTUpdatedBy;
  set isminTUpdatedBy(int? isminTUpdatedBy) =>
      _isminTUpdatedBy = isminTUpdatedBy;
  int? get istinTId => _istinTId;
  set istinTId(int? istinTId) => _istinTId = istinTId;
  int? get istinTToId => _istinTToId;
  set istinTToId(int? istinTToId) => _istinTToId = istinTToId;
  int? get istinTComposedById => _istinTComposedById;
  set istinTComposedById(int? istinTComposedById) =>
      _istinTComposedById = istinTComposedById;
  String? get istinTDateTime => _istinTDateTime;
  set istinTDateTime(String? istinTDateTime) =>
      _istinTDateTime = istinTDateTime;
  int? get istinTInteractionOrder => _istinTInteractionOrder;
  set istinTInteractionOrder(int? istinTInteractionOrder) =>
      _istinTInteractionOrder = istinTInteractionOrder;
  bool? get istinTActiveFlag => _istinTActiveFlag;
  set istinTActiveFlag(bool? istinTActiveFlag) =>
      _istinTActiveFlag = istinTActiveFlag;
  int? get istinTCreatedBy => _istinTCreatedBy;
  set istinTCreatedBy(int? istinTCreatedBy) =>
      _istinTCreatedBy = istinTCreatedBy;
  int? get istinTUpdatedBy => _istinTUpdatedBy;
  set istinTUpdatedBy(int? istinTUpdatedBy) =>
      _istinTUpdatedBy = istinTUpdatedBy;
  String? get notificationflag => _notificationflag;
  set notificationflag(String? notificationflag) =>
      _notificationflag = notificationflag;
  int? get amcsTId => _amcsTId;
  set amcsTId(int? amcsTId) => _amcsTId = amcsTId;
  int? get amcoid => _amcoid;
  set amcoid(int? amcoid) => _amcoid = amcoid;
  int? get ambid => _ambid;
  set ambid(int? ambid) => _ambid = ambid;
  int? get amseid => _amseid;
  set amseid(int? amseid) => _amseid = amseid;
  int? get acmsid => _acmsid;
  set acmsid(int? acmsid) => _acmsid = acmsid;
  int? get amcOId => _amcOId;
  set amcOId(int? amcOId) => _amcOId = amcOId;
  int? get amBId => _amBId;
  set amBId(int? amBId) => _amBId = amBId;
  int? get amsEId => _amsEId;
  set amsEId(int? amsEId) => _amsEId = amsEId;
  int? get amBOrder => _amBOrder;
  set amBOrder(int? amBOrder) => _amBOrder = amBOrder;
  int? get amsESEMOrder => _amsESEMOrder;
  set amsESEMOrder(int? amsESEMOrder) => _amsESEMOrder = amsESEMOrder;
  int? get acmSId => _acmSId;
  set acmSId(int? acmSId) => _acmSId = acmSId;
  int? get acmSOrder => _acmSOrder;
  set acmSOrder(int? acmSOrder) => _acmSOrder = acmSOrder;

  InboxModel.fromJson(Map<String, dynamic> json) {
    _returnval = json['returnval'];
    _alreadyCnt = json['already_cnt'];
    _userId = json['userId'];
    _rolename = json['rolename'];
    _ivrmgCEnableSTIntFlg = json['ivrmgC_EnableSTIntFlg'];
    _ivrmgCEnableCTIntFlg = json['ivrmgC_EnableCTIntFlg'];
    _ivrmgCEnableHODIntFlg = json['ivrmgC_EnableHODIntFlg'];
    _ivrmgCEnablePrincipalIntFlg = json['ivrmgC_EnablePrincipalIntFlg'];
    _ivrmgCEnableASIntFlg = json['ivrmgC_EnableASIntFlg'];
    _asmclid = json['asmclid'];
    _asmsid = json['asmsid'];
    _amsTId = json['amsT_Id'];
    _hrmEId1 = json['hrmE_Id1'];
    _studentId = json['student_Id'];
    _hrmEId = json['hrmE_Id'];
    _userhrmEId = json['userhrmE_Id'];
    _employeeId = json['employee_Id'];
    _asmcLId = json['asmcL_Id'];
    _asmSId = json['asmS_Id'];
    _ivrmrTId = json['ivrmrT_Id'];
    _ivrmgCEnableECIntFlg = json['ivrmgC_EnableECIntFlg'];
    _roleFlag = json['role_flag'];
    _roletype = json['roletype'] != null
        ? new Roletype.fromJson(json['roletype'])
        : null;
    _configflag = json['configflag'] != null
        ? new Configflag.fromJson(json['configflag'])
        : null;
    _getinboxmsg = json['getinboxmsg'] != null
        ? new Getinboxmsg.fromJson(json['getinboxmsg'])
        : null;
    _getinboxmsgReadflg = json['getinboxmsg_readflg'] != null
        ? new GetinboxmsgReadflg.fromJson(json['getinboxmsg_readflg'])
        : null;
    _inboxcount = json['inboxcount'];
    _isminTId = json['isminT_Id'];
    _mIId = json['mI_Id'];
    _isminTInteractionId = json['isminT_InteractionId'];
    _asmaYId = json['asmaY_Id'];
    _isminTComposedById = json['isminT_ComposedById'];
    _isminTDateTime = json['isminT_DateTime'];
    _isminTActiveFlag = json['isminT_ActiveFlag'];
    _isminTCreatedBy = json['isminT_CreatedBy'];
    _isminTUpdatedBy = json['isminT_UpdatedBy'];
    _istinTId = json['istinT_Id'];
    _istinTToId = json['istinT_ToId'];
    _istinTComposedById = json['istinT_ComposedById'];
    _istinTDateTime = json['istinT_DateTime'];
    _istinTInteractionOrder = json['istinT_InteractionOrder'];
    _istinTActiveFlag = json['istinT_ActiveFlag'];
    _istinTCreatedBy = json['istinT_CreatedBy'];
    _istinTUpdatedBy = json['istinT_UpdatedBy'];
    _notificationflag = json['notificationflag'];
    _amcsTId = json['amcsT_Id'];
    _amcoid = json['amcoid'];
    _ambid = json['ambid'];
    _amseid = json['amseid'];
    _acmsid = json['acmsid'];
    _amcOId = json['amcO_Id'];
    _amBId = json['amB_Id'];
    _amsEId = json['amsE_Id'];
    _amBOrder = json['amB_Order'];
    _amsESEMOrder = json['amsE_SEMOrder'];
    _acmSId = json['acmS_Id'];
    _acmSOrder = json['acmS_Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['returnval'] = this._returnval;
    data['already_cnt'] = this._alreadyCnt;
    data['userId'] = this._userId;
    data['rolename'] = this._rolename;
    data['ivrmgC_EnableSTIntFlg'] = this._ivrmgCEnableSTIntFlg;
    data['ivrmgC_EnableCTIntFlg'] = this._ivrmgCEnableCTIntFlg;
    data['ivrmgC_EnableHODIntFlg'] = this._ivrmgCEnableHODIntFlg;
    data['ivrmgC_EnablePrincipalIntFlg'] = this._ivrmgCEnablePrincipalIntFlg;
    data['ivrmgC_EnableASIntFlg'] = this._ivrmgCEnableASIntFlg;
    data['asmclid'] = this._asmclid;
    data['asmsid'] = this._asmsid;
    data['amsT_Id'] = this._amsTId;
    data['hrmE_Id1'] = this._hrmEId1;
    data['student_Id'] = this._studentId;
    data['hrmE_Id'] = this._hrmEId;
    data['userhrmE_Id'] = this._userhrmEId;
    data['employee_Id'] = this._employeeId;
    data['asmcL_Id'] = this._asmcLId;
    data['asmS_Id'] = this._asmSId;
    data['ivrmrT_Id'] = this._ivrmrTId;
    data['ivrmgC_EnableECIntFlg'] = this._ivrmgCEnableECIntFlg;
    data['role_flag'] = this._roleFlag;
    if (this._roletype != null) {
      data['roletype'] = this._roletype!.toJson();
    }
    if (this._configflag != null) {
      data['configflag'] = this._configflag!.toJson();
    }
    if (this._getinboxmsg != null) {
      data['getinboxmsg'] = this._getinboxmsg!.toJson();
    }
    if (this._getinboxmsgReadflg != null) {
      data['getinboxmsg_readflg'] = this._getinboxmsgReadflg!.toJson();
    }
    data['inboxcount'] = this._inboxcount;
    data['isminT_Id'] = this._isminTId;
    data['mI_Id'] = this._mIId;
    data['isminT_InteractionId'] = this._isminTInteractionId;
    data['asmaY_Id'] = this._asmaYId;
    data['isminT_ComposedById'] = this._isminTComposedById;
    data['isminT_DateTime'] = this._isminTDateTime;
    data['isminT_ActiveFlag'] = this._isminTActiveFlag;
    data['isminT_CreatedBy'] = this._isminTCreatedBy;
    data['isminT_UpdatedBy'] = this._isminTUpdatedBy;
    data['istinT_Id'] = this._istinTId;
    data['istinT_ToId'] = this._istinTToId;
    data['istinT_ComposedById'] = this._istinTComposedById;
    data['istinT_DateTime'] = this._istinTDateTime;
    data['istinT_InteractionOrder'] = this._istinTInteractionOrder;
    data['istinT_ActiveFlag'] = this._istinTActiveFlag;
    data['istinT_CreatedBy'] = this._istinTCreatedBy;
    data['istinT_UpdatedBy'] = this._istinTUpdatedBy;
    data['notificationflag'] = this._notificationflag;
    data['amcsT_Id'] = this._amcsTId;
    data['amcoid'] = this._amcoid;
    data['ambid'] = this._ambid;
    data['amseid'] = this._amseid;
    data['acmsid'] = this._acmsid;
    data['amcO_Id'] = this._amcOId;
    data['amB_Id'] = this._amBId;
    data['amsE_Id'] = this._amsEId;
    data['amB_Order'] = this._amBOrder;
    data['amsE_SEMOrder'] = this._amsESEMOrder;
    data['acmS_Id'] = this._acmSId;
    data['acmS_Order'] = this._acmSOrder;
    return data;
  }
}

class Roletype {
  String? _type;
  List<Values1>? _values1;

  Roletype({String? type, List<Values1>? values1}) {
    if (type != null) {
      this._type = type;
    }
    if (values1 != null) {
      this._values1 = values1;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<Values1>? get values1 => _values1;
  set values1(List<Values1>? values1) => _values1 = values1;

  Roletype.fromJson(Map<String, dynamic> json) {
    _type = json['$type'];
    if (json['$values1'] != null) {
      _values1 = <Values1>[];
      json['$values1'].forEach((v) {
        _values1!.add(new Values1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$type'] = this._type;
    if (this._values1 != null) {
      data['$values1'] = this._values1!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values1 {
  int? _ivrmrTId;
  String? _ivrmrTRole;
  int? _ivrmRId;
  String? _ivrmrTRoleFlag;
  String? _flag;
  String? _createdDate;
  String? _updatedDate;

  Values1(
      {int? ivrmrTId,
      String? ivrmrTRole,
      int? ivrmRId,
      String? ivrmrTRoleFlag,
      String? flag,
      String? createdDate,
      String? updatedDate}) {
    if (ivrmrTId != null) {
      this._ivrmrTId = ivrmrTId;
    }
    if (ivrmrTRole != null) {
      this._ivrmrTRole = ivrmrTRole;
    }
    if (ivrmRId != null) {
      this._ivrmRId = ivrmRId;
    }
    if (ivrmrTRoleFlag != null) {
      this._ivrmrTRoleFlag = ivrmrTRoleFlag;
    }
    if (flag != null) {
      this._flag = flag;
    }
    if (createdDate != null) {
      this._createdDate = createdDate;
    }
    if (updatedDate != null) {
      this._updatedDate = updatedDate;
    }
  }

  int? get ivrmrTId => _ivrmrTId;
  set ivrmrTId(int? ivrmrTId) => _ivrmrTId = ivrmrTId;
  String? get ivrmrTRole => _ivrmrTRole;
  set ivrmrTRole(String? ivrmrTRole) => _ivrmrTRole = ivrmrTRole;
  int? get ivrmRId => _ivrmRId;
  set ivrmRId(int? ivrmRId) => _ivrmRId = ivrmRId;
  String? get ivrmrTRoleFlag => _ivrmrTRoleFlag;
  set ivrmrTRoleFlag(String? ivrmrTRoleFlag) =>
      _ivrmrTRoleFlag = ivrmrTRoleFlag;
  String? get flag => _flag;
  set flag(String? flag) => _flag = flag;
  String? get createdDate => _createdDate;
  set createdDate(String? createdDate) => _createdDate = createdDate;
  String? get updatedDate => _updatedDate;
  set updatedDate(String? updatedDate) => _updatedDate = updatedDate;

  Values1.fromJson(Map<String, dynamic> json) {
    _ivrmrTId = json['ivrmrT_Id'];
    _ivrmrTRole = json['ivrmrT_Role'];
    _ivrmRId = json['ivrmR_Id'];
    _ivrmrTRoleFlag = json['ivrmrT_RoleFlag'];
    _flag = json['flag'];
    _createdDate = json['createdDate'];
    _updatedDate = json['updatedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ivrmrT_Id'] = this._ivrmrTId;
    data['ivrmrT_Role'] = this._ivrmrTRole;
    data['ivrmR_Id'] = this._ivrmRId;
    data['ivrmrT_RoleFlag'] = this._ivrmrTRoleFlag;
    data['flag'] = this._flag;
    data['createdDate'] = this._createdDate;
    data['updatedDate'] = this._updatedDate;
    return data;
  }
}

class Configflag {
  String? _type;
  List<Values2>? _values2;

  Configflag({String? type, List<Values2>? values2}) {
    if (type != null) {
      this._type = type;
    }
    if (values2 != null) {
      this._values2 = values2;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<Values2>? get values2 => _values2;
  set values2(List<Values2>? values2) => _values2 = values2;

  Configflag.fromJson(Map<String, dynamic> json) {
    _type = json['$type'];
    if (json['$values2'] != null) {
      _values2 = <Values2>[];
      json['$values2'].forEach((v) {
        _values2!.add(new Values2.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$type'] = this._type;
    if (this._values2 != null) {
      data['$values2'] = this._values2!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values2 {
  int? _ivrmgCId;
  int? _mIId;
  bool? _ivrmgCMobileValOTPFlag;
  int? _ivrmgCOTPMobileNo;
  String? _ivrmgCOTPMailId;
  bool? _ivrmgCEmailValOTPFlag;
  String? _ivrmgCStudentPhotoPath;
  String? _ivrmgCStaffPhotoPath;
  bool? _ivrmgCComTrasaNoFlag;
  String? _ivrmgCSMSDomain;
  String? _ivrmgCSMSURL;
  String? _ivrmgCSMSUserName;
  String? _ivrmgCSMSPassword;
  String? _ivrmgCSMSSenderId;
  String? _ivrmgCSMSWorkingKey;
  String? _ivrmgCSMSFooter;
  bool? _ivrmgCSMSActiveFlag;
  String? _ivrmgCEmailUserName;
  String? _ivrmgCEmailPassword;
  String? _ivrmgCHostName;
  int? _ivrmgCPortNo;
  String? _ivrmgCMailGenralDesc;
  String? _ivrmgCWebiste;
  String? _ivrmgCEmailid;
  String? _ivrmgCEmailFooter;
  String? _ivrmgCCCMail;
  String? _ivrmgCBCCMail;
  String? _ivrmgCToMail;
  bool? _ivrmgCEmailActiveFlag;
  int? _ivrmgCPagination;
  int? _ivrmgCReminderDays;
  int? _ivrmgCClassCapacity;
  int? _ivrmgCSectionCapacity;
  int? _ivrmgCSCLockingPeriod;
  int? _ivrmgCFPLockingPeriod;
  bool? _ivrmgCSCActive;
  bool? _ivrmgCFPActive;
  bool? _ivrmgCOnlineFPActive;
  bool? _ivrmgCFaceReaderActive;
  bool? _ivrmgCDefaultStudentSelection;
  String? _updatedDate;
  int? _ivrmgCPagePagination;
  int? _ivrmgCReportPagination;
  bool? _ivrmgCAdmnoColumnDisplay;
  bool? _ivrmgCRegnoColumnDisplay;
  bool? _ivrmgCRollnoColumnDisplay;
  String? _ivrmgCDisclaimer;
  String? _ivrmgCAdmNoRegNoRollNoDefaultFlag;
  int? _ivrmgCTransportRequired;
  String? _ivrmgCClasswisePayment;
  String? _ivrmgCAPIOrSMTPFlg;
  bool? _ivrmgCEnableSTIntFlg;
  bool? _ivrmgCEnableCTIntFlg;
  bool? _ivrmgCEnableHODIntFlg;
  bool? _ivrmgCEnablePrincipalIntFlg;
  bool? _ivrmgCEnableASIntFlg;
  String? _ivrmgCSendGridKey;
  bool? _ivrmgCSportsPointsDropdownFlg;
  bool? _ivrmgCStudentDataChangeAlertFlg;
  int? _ivrmgCStudentDataChangeAlertDays;
  bool? _ivrmgCEnableSTSUBTIntFlg;
  bool? _ivrmgCEnableSTCTIntFlg;
  bool? _ivrmgCEnableSTHODIntFlg;
  bool? _ivrmgCEnableSTPrincipalIntFlg;
  bool? _ivrmgCEnableSTASIntFlg;
  bool? _ivrmgCEnableSTECIntFlg;
  bool? _ivrmgCGMRDTOALLFlg;
  bool? _ivrmgCEnableStaffwiseIntFlg;
  bool? _ivrmgCEnableCTSTIntFlg;
  bool? _ivrmgCEnableHODSTIntFlg;
  bool? _ivrmgCEnablePrincipalSTIntFlg;
  bool? _ivrmgCEnableASSTIntFlg;
  bool? _ivrmgCEnableECSTIntFlg;
  bool? _ivrmgCEnableSUBTSTUIntFlg;
  bool? _ivrmgCCatLogoFlg;

  Values2(
      {int? ivrmgCId,
      int? mIId,
      bool? ivrmgCMobileValOTPFlag,
      int? ivrmgCOTPMobileNo,
      String? ivrmgCOTPMailId,
      bool? ivrmgCEmailValOTPFlag,
      String? ivrmgCStudentPhotoPath,
      String? ivrmgCStaffPhotoPath,
      bool? ivrmgCComTrasaNoFlag,
      String? ivrmgCSMSDomain,
      String? ivrmgCSMSURL,
      String? ivrmgCSMSUserName,
      String? ivrmgCSMSPassword,
      String? ivrmgCSMSSenderId,
      String? ivrmgCSMSWorkingKey,
      String? ivrmgCSMSFooter,
      bool? ivrmgCSMSActiveFlag,
      String? ivrmgCEmailUserName,
      String? ivrmgCEmailPassword,
      String? ivrmgCHostName,
      int? ivrmgCPortNo,
      String? ivrmgCMailGenralDesc,
      String? ivrmgCWebiste,
      String? ivrmgCEmailid,
      String? ivrmgCEmailFooter,
      String? ivrmgCCCMail,
      String? ivrmgCBCCMail,
      String? ivrmgCToMail,
      bool? ivrmgCEmailActiveFlag,
      int? ivrmgCPagination,
      int? ivrmgCReminderDays,
      int? ivrmgCClassCapacity,
      int? ivrmgCSectionCapacity,
      int? ivrmgCSCLockingPeriod,
      int? ivrmgCFPLockingPeriod,
      bool? ivrmgCSCActive,
      bool? ivrmgCFPActive,
      bool? ivrmgCOnlineFPActive,
      bool? ivrmgCFaceReaderActive,
      bool? ivrmgCDefaultStudentSelection,
      String? updatedDate,
      int? ivrmgCPagePagination,
      int? ivrmgCReportPagination,
      bool? ivrmgCAdmnoColumnDisplay,
      bool? ivrmgCRegnoColumnDisplay,
      bool? ivrmgCRollnoColumnDisplay,
      String? ivrmgCDisclaimer,
      String? ivrmgCAdmNoRegNoRollNoDefaultFlag,
      int? ivrmgCTransportRequired,
      String? ivrmgCClasswisePayment,
      String? ivrmgCAPIOrSMTPFlg,
      bool? ivrmgCEnableSTIntFlg,
      bool? ivrmgCEnableCTIntFlg,
      bool? ivrmgCEnableHODIntFlg,
      bool? ivrmgCEnablePrincipalIntFlg,
      bool? ivrmgCEnableASIntFlg,
      String? ivrmgCSendGridKey,
      bool? ivrmgCSportsPointsDropdownFlg,
      bool? ivrmgCStudentDataChangeAlertFlg,
      int? ivrmgCStudentDataChangeAlertDays,
      bool? ivrmgCEnableSTSUBTIntFlg,
      bool? ivrmgCEnableSTCTIntFlg,
      bool? ivrmgCEnableSTHODIntFlg,
      bool? ivrmgCEnableSTPrincipalIntFlg,
      bool? ivrmgCEnableSTASIntFlg,
      bool? ivrmgCEnableSTECIntFlg,
      bool? ivrmgCGMRDTOALLFlg,
      bool? ivrmgCEnableStaffwiseIntFlg,
      bool? ivrmgCEnableCTSTIntFlg,
      bool? ivrmgCEnableHODSTIntFlg,
      bool? ivrmgCEnablePrincipalSTIntFlg,
      bool? ivrmgCEnableASSTIntFlg,
      bool? ivrmgCEnableECSTIntFlg,
      bool? ivrmgCEnableSUBTSTUIntFlg,
      bool? ivrmgCCatLogoFlg}) {
    if (ivrmgCId != null) {
      this._ivrmgCId = ivrmgCId;
    }
    if (mIId != null) {
      this._mIId = mIId;
    }
    if (ivrmgCMobileValOTPFlag != null) {
      this._ivrmgCMobileValOTPFlag = ivrmgCMobileValOTPFlag;
    }
    if (ivrmgCOTPMobileNo != null) {
      this._ivrmgCOTPMobileNo = ivrmgCOTPMobileNo;
    }
    if (ivrmgCOTPMailId != null) {
      this._ivrmgCOTPMailId = ivrmgCOTPMailId;
    }
    if (ivrmgCEmailValOTPFlag != null) {
      this._ivrmgCEmailValOTPFlag = ivrmgCEmailValOTPFlag;
    }
    if (ivrmgCStudentPhotoPath != null) {
      this._ivrmgCStudentPhotoPath = ivrmgCStudentPhotoPath;
    }
    if (ivrmgCStaffPhotoPath != null) {
      this._ivrmgCStaffPhotoPath = ivrmgCStaffPhotoPath;
    }
    if (ivrmgCComTrasaNoFlag != null) {
      this._ivrmgCComTrasaNoFlag = ivrmgCComTrasaNoFlag;
    }
    if (ivrmgCSMSDomain != null) {
      this._ivrmgCSMSDomain = ivrmgCSMSDomain;
    }
    if (ivrmgCSMSURL != null) {
      this._ivrmgCSMSURL = ivrmgCSMSURL;
    }
    if (ivrmgCSMSUserName != null) {
      this._ivrmgCSMSUserName = ivrmgCSMSUserName;
    }
    if (ivrmgCSMSPassword != null) {
      this._ivrmgCSMSPassword = ivrmgCSMSPassword;
    }
    if (ivrmgCSMSSenderId != null) {
      this._ivrmgCSMSSenderId = ivrmgCSMSSenderId;
    }
    if (ivrmgCSMSWorkingKey != null) {
      this._ivrmgCSMSWorkingKey = ivrmgCSMSWorkingKey;
    }
    if (ivrmgCSMSFooter != null) {
      this._ivrmgCSMSFooter = ivrmgCSMSFooter;
    }
    if (ivrmgCSMSActiveFlag != null) {
      this._ivrmgCSMSActiveFlag = ivrmgCSMSActiveFlag;
    }
    if (ivrmgCEmailUserName != null) {
      this._ivrmgCEmailUserName = ivrmgCEmailUserName;
    }
    if (ivrmgCEmailPassword != null) {
      this._ivrmgCEmailPassword = ivrmgCEmailPassword;
    }
    if (ivrmgCHostName != null) {
      this._ivrmgCHostName = ivrmgCHostName;
    }
    if (ivrmgCPortNo != null) {
      this._ivrmgCPortNo = ivrmgCPortNo;
    }
    if (ivrmgCMailGenralDesc != null) {
      this._ivrmgCMailGenralDesc = ivrmgCMailGenralDesc;
    }
    if (ivrmgCWebiste != null) {
      this._ivrmgCWebiste = ivrmgCWebiste;
    }
    if (ivrmgCEmailid != null) {
      this._ivrmgCEmailid = ivrmgCEmailid;
    }
    if (ivrmgCEmailFooter != null) {
      this._ivrmgCEmailFooter = ivrmgCEmailFooter;
    }
    if (ivrmgCCCMail != null) {
      this._ivrmgCCCMail = ivrmgCCCMail;
    }
    if (ivrmgCBCCMail != null) {
      this._ivrmgCBCCMail = ivrmgCBCCMail;
    }
    if (ivrmgCToMail != null) {
      this._ivrmgCToMail = ivrmgCToMail;
    }
    if (ivrmgCEmailActiveFlag != null) {
      this._ivrmgCEmailActiveFlag = ivrmgCEmailActiveFlag;
    }
    if (ivrmgCPagination != null) {
      this._ivrmgCPagination = ivrmgCPagination;
    }
    if (ivrmgCReminderDays != null) {
      this._ivrmgCReminderDays = ivrmgCReminderDays;
    }
    if (ivrmgCClassCapacity != null) {
      this._ivrmgCClassCapacity = ivrmgCClassCapacity;
    }
    if (ivrmgCSectionCapacity != null) {
      this._ivrmgCSectionCapacity = ivrmgCSectionCapacity;
    }
    if (ivrmgCSCLockingPeriod != null) {
      this._ivrmgCSCLockingPeriod = ivrmgCSCLockingPeriod;
    }
    if (ivrmgCFPLockingPeriod != null) {
      this._ivrmgCFPLockingPeriod = ivrmgCFPLockingPeriod;
    }
    if (ivrmgCSCActive != null) {
      this._ivrmgCSCActive = ivrmgCSCActive;
    }
    if (ivrmgCFPActive != null) {
      this._ivrmgCFPActive = ivrmgCFPActive;
    }
    if (ivrmgCOnlineFPActive != null) {
      this._ivrmgCOnlineFPActive = ivrmgCOnlineFPActive;
    }
    if (ivrmgCFaceReaderActive != null) {
      this._ivrmgCFaceReaderActive = ivrmgCFaceReaderActive;
    }
    if (ivrmgCDefaultStudentSelection != null) {
      this._ivrmgCDefaultStudentSelection = ivrmgCDefaultStudentSelection;
    }
    if (updatedDate != null) {
      this._updatedDate = updatedDate;
    }
    if (ivrmgCPagePagination != null) {
      this._ivrmgCPagePagination = ivrmgCPagePagination;
    }
    if (ivrmgCReportPagination != null) {
      this._ivrmgCReportPagination = ivrmgCReportPagination;
    }
    if (ivrmgCAdmnoColumnDisplay != null) {
      this._ivrmgCAdmnoColumnDisplay = ivrmgCAdmnoColumnDisplay;
    }
    if (ivrmgCRegnoColumnDisplay != null) {
      this._ivrmgCRegnoColumnDisplay = ivrmgCRegnoColumnDisplay;
    }
    if (ivrmgCRollnoColumnDisplay != null) {
      this._ivrmgCRollnoColumnDisplay = ivrmgCRollnoColumnDisplay;
    }
    if (ivrmgCDisclaimer != null) {
      this._ivrmgCDisclaimer = ivrmgCDisclaimer;
    }
    if (ivrmgCAdmNoRegNoRollNoDefaultFlag != null) {
      this._ivrmgCAdmNoRegNoRollNoDefaultFlag =
          ivrmgCAdmNoRegNoRollNoDefaultFlag;
    }
    if (ivrmgCTransportRequired != null) {
      this._ivrmgCTransportRequired = ivrmgCTransportRequired;
    }
    if (ivrmgCClasswisePayment != null) {
      this._ivrmgCClasswisePayment = ivrmgCClasswisePayment;
    }
    if (ivrmgCAPIOrSMTPFlg != null) {
      this._ivrmgCAPIOrSMTPFlg = ivrmgCAPIOrSMTPFlg;
    }
    if (ivrmgCEnableSTIntFlg != null) {
      this._ivrmgCEnableSTIntFlg = ivrmgCEnableSTIntFlg;
    }
    if (ivrmgCEnableCTIntFlg != null) {
      this._ivrmgCEnableCTIntFlg = ivrmgCEnableCTIntFlg;
    }
    if (ivrmgCEnableHODIntFlg != null) {
      this._ivrmgCEnableHODIntFlg = ivrmgCEnableHODIntFlg;
    }
    if (ivrmgCEnablePrincipalIntFlg != null) {
      this._ivrmgCEnablePrincipalIntFlg = ivrmgCEnablePrincipalIntFlg;
    }
    if (ivrmgCEnableASIntFlg != null) {
      this._ivrmgCEnableASIntFlg = ivrmgCEnableASIntFlg;
    }
    if (ivrmgCSendGridKey != null) {
      this._ivrmgCSendGridKey = ivrmgCSendGridKey;
    }
    if (ivrmgCSportsPointsDropdownFlg != null) {
      this._ivrmgCSportsPointsDropdownFlg = ivrmgCSportsPointsDropdownFlg;
    }
    if (ivrmgCStudentDataChangeAlertFlg != null) {
      this._ivrmgCStudentDataChangeAlertFlg = ivrmgCStudentDataChangeAlertFlg;
    }
    if (ivrmgCStudentDataChangeAlertDays != null) {
      this._ivrmgCStudentDataChangeAlertDays = ivrmgCStudentDataChangeAlertDays;
    }
    if (ivrmgCEnableSTSUBTIntFlg != null) {
      this._ivrmgCEnableSTSUBTIntFlg = ivrmgCEnableSTSUBTIntFlg;
    }
    if (ivrmgCEnableSTCTIntFlg != null) {
      this._ivrmgCEnableSTCTIntFlg = ivrmgCEnableSTCTIntFlg;
    }
    if (ivrmgCEnableSTHODIntFlg != null) {
      this._ivrmgCEnableSTHODIntFlg = ivrmgCEnableSTHODIntFlg;
    }
    if (ivrmgCEnableSTPrincipalIntFlg != null) {
      this._ivrmgCEnableSTPrincipalIntFlg = ivrmgCEnableSTPrincipalIntFlg;
    }
    if (ivrmgCEnableSTASIntFlg != null) {
      this._ivrmgCEnableSTASIntFlg = ivrmgCEnableSTASIntFlg;
    }
    if (ivrmgCEnableSTECIntFlg != null) {
      this._ivrmgCEnableSTECIntFlg = ivrmgCEnableSTECIntFlg;
    }
    if (ivrmgCGMRDTOALLFlg != null) {
      this._ivrmgCGMRDTOALLFlg = ivrmgCGMRDTOALLFlg;
    }
    if (ivrmgCEnableStaffwiseIntFlg != null) {
      this._ivrmgCEnableStaffwiseIntFlg = ivrmgCEnableStaffwiseIntFlg;
    }
    if (ivrmgCEnableCTSTIntFlg != null) {
      this._ivrmgCEnableCTSTIntFlg = ivrmgCEnableCTSTIntFlg;
    }
    if (ivrmgCEnableHODSTIntFlg != null) {
      this._ivrmgCEnableHODSTIntFlg = ivrmgCEnableHODSTIntFlg;
    }
    if (ivrmgCEnablePrincipalSTIntFlg != null) {
      this._ivrmgCEnablePrincipalSTIntFlg = ivrmgCEnablePrincipalSTIntFlg;
    }
    if (ivrmgCEnableASSTIntFlg != null) {
      this._ivrmgCEnableASSTIntFlg = ivrmgCEnableASSTIntFlg;
    }
    if (ivrmgCEnableECSTIntFlg != null) {
      this._ivrmgCEnableECSTIntFlg = ivrmgCEnableECSTIntFlg;
    }
    if (ivrmgCEnableSUBTSTUIntFlg != null) {
      this._ivrmgCEnableSUBTSTUIntFlg = ivrmgCEnableSUBTSTUIntFlg;
    }
    if (ivrmgCCatLogoFlg != null) {
      this._ivrmgCCatLogoFlg = ivrmgCCatLogoFlg;
    }
  }

  int? get ivrmgCId => _ivrmgCId;
  set ivrmgCId(int? ivrmgCId) => _ivrmgCId = ivrmgCId;
  int? get mIId => _mIId;
  set mIId(int? mIId) => _mIId = mIId;
  bool? get ivrmgCMobileValOTPFlag => _ivrmgCMobileValOTPFlag;
  set ivrmgCMobileValOTPFlag(bool? ivrmgCMobileValOTPFlag) =>
      _ivrmgCMobileValOTPFlag = ivrmgCMobileValOTPFlag;
  int? get ivrmgCOTPMobileNo => _ivrmgCOTPMobileNo;
  set ivrmgCOTPMobileNo(int? ivrmgCOTPMobileNo) =>
      _ivrmgCOTPMobileNo = ivrmgCOTPMobileNo;
  String? get ivrmgCOTPMailId => _ivrmgCOTPMailId;
  set ivrmgCOTPMailId(String? ivrmgCOTPMailId) =>
      _ivrmgCOTPMailId = ivrmgCOTPMailId;
  bool? get ivrmgCEmailValOTPFlag => _ivrmgCEmailValOTPFlag;
  set ivrmgCEmailValOTPFlag(bool? ivrmgCEmailValOTPFlag) =>
      _ivrmgCEmailValOTPFlag = ivrmgCEmailValOTPFlag;
  String? get ivrmgCStudentPhotoPath => _ivrmgCStudentPhotoPath;
  set ivrmgCStudentPhotoPath(String? ivrmgCStudentPhotoPath) =>
      _ivrmgCStudentPhotoPath = ivrmgCStudentPhotoPath;
  String? get ivrmgCStaffPhotoPath => _ivrmgCStaffPhotoPath;
  set ivrmgCStaffPhotoPath(String? ivrmgCStaffPhotoPath) =>
      _ivrmgCStaffPhotoPath = ivrmgCStaffPhotoPath;
  bool? get ivrmgCComTrasaNoFlag => _ivrmgCComTrasaNoFlag;
  set ivrmgCComTrasaNoFlag(bool? ivrmgCComTrasaNoFlag) =>
      _ivrmgCComTrasaNoFlag = ivrmgCComTrasaNoFlag;
  String? get ivrmgCSMSDomain => _ivrmgCSMSDomain;
  set ivrmgCSMSDomain(String? ivrmgCSMSDomain) =>
      _ivrmgCSMSDomain = ivrmgCSMSDomain;
  String? get ivrmgCSMSURL => _ivrmgCSMSURL;
  set ivrmgCSMSURL(String? ivrmgCSMSURL) => _ivrmgCSMSURL = ivrmgCSMSURL;
  String? get ivrmgCSMSUserName => _ivrmgCSMSUserName;
  set ivrmgCSMSUserName(String? ivrmgCSMSUserName) =>
      _ivrmgCSMSUserName = ivrmgCSMSUserName;
  String? get ivrmgCSMSPassword => _ivrmgCSMSPassword;
  set ivrmgCSMSPassword(String? ivrmgCSMSPassword) =>
      _ivrmgCSMSPassword = ivrmgCSMSPassword;
  String? get ivrmgCSMSSenderId => _ivrmgCSMSSenderId;
  set ivrmgCSMSSenderId(String? ivrmgCSMSSenderId) =>
      _ivrmgCSMSSenderId = ivrmgCSMSSenderId;
  String? get ivrmgCSMSWorkingKey => _ivrmgCSMSWorkingKey;
  set ivrmgCSMSWorkingKey(String? ivrmgCSMSWorkingKey) =>
      _ivrmgCSMSWorkingKey = ivrmgCSMSWorkingKey;
  String? get ivrmgCSMSFooter => _ivrmgCSMSFooter;
  set ivrmgCSMSFooter(String? ivrmgCSMSFooter) =>
      _ivrmgCSMSFooter = ivrmgCSMSFooter;
  bool? get ivrmgCSMSActiveFlag => _ivrmgCSMSActiveFlag;
  set ivrmgCSMSActiveFlag(bool? ivrmgCSMSActiveFlag) =>
      _ivrmgCSMSActiveFlag = ivrmgCSMSActiveFlag;
  String? get ivrmgCEmailUserName => _ivrmgCEmailUserName;
  set ivrmgCEmailUserName(String? ivrmgCEmailUserName) =>
      _ivrmgCEmailUserName = ivrmgCEmailUserName;
  String? get ivrmgCEmailPassword => _ivrmgCEmailPassword;
  set ivrmgCEmailPassword(String? ivrmgCEmailPassword) =>
      _ivrmgCEmailPassword = ivrmgCEmailPassword;
  String? get ivrmgCHostName => _ivrmgCHostName;
  set ivrmgCHostName(String? ivrmgCHostName) =>
      _ivrmgCHostName = ivrmgCHostName;
  int? get ivrmgCPortNo => _ivrmgCPortNo;
  set ivrmgCPortNo(int? ivrmgCPortNo) => _ivrmgCPortNo = ivrmgCPortNo;
  String? get ivrmgCMailGenralDesc => _ivrmgCMailGenralDesc;
  set ivrmgCMailGenralDesc(String? ivrmgCMailGenralDesc) =>
      _ivrmgCMailGenralDesc = ivrmgCMailGenralDesc;
  String? get ivrmgCWebiste => _ivrmgCWebiste;
  set ivrmgCWebiste(String? ivrmgCWebiste) => _ivrmgCWebiste = ivrmgCWebiste;
  String? get ivrmgCEmailid => _ivrmgCEmailid;
  set ivrmgCEmailid(String? ivrmgCEmailid) => _ivrmgCEmailid = ivrmgCEmailid;
  String? get ivrmgCEmailFooter => _ivrmgCEmailFooter;
  set ivrmgCEmailFooter(String? ivrmgCEmailFooter) =>
      _ivrmgCEmailFooter = ivrmgCEmailFooter;
  String? get ivrmgCCCMail => _ivrmgCCCMail;
  set ivrmgCCCMail(String? ivrmgCCCMail) => _ivrmgCCCMail = ivrmgCCCMail;
  String? get ivrmgCBCCMail => _ivrmgCBCCMail;
  set ivrmgCBCCMail(String? ivrmgCBCCMail) => _ivrmgCBCCMail = ivrmgCBCCMail;
  String? get ivrmgCToMail => _ivrmgCToMail;
  set ivrmgCToMail(String? ivrmgCToMail) => _ivrmgCToMail = ivrmgCToMail;
  bool? get ivrmgCEmailActiveFlag => _ivrmgCEmailActiveFlag;
  set ivrmgCEmailActiveFlag(bool? ivrmgCEmailActiveFlag) =>
      _ivrmgCEmailActiveFlag = ivrmgCEmailActiveFlag;
  int? get ivrmgCPagination => _ivrmgCPagination;
  set ivrmgCPagination(int? ivrmgCPagination) =>
      _ivrmgCPagination = ivrmgCPagination;
  int? get ivrmgCReminderDays => _ivrmgCReminderDays;
  set ivrmgCReminderDays(int? ivrmgCReminderDays) =>
      _ivrmgCReminderDays = ivrmgCReminderDays;
  int? get ivrmgCClassCapacity => _ivrmgCClassCapacity;
  set ivrmgCClassCapacity(int? ivrmgCClassCapacity) =>
      _ivrmgCClassCapacity = ivrmgCClassCapacity;
  int? get ivrmgCSectionCapacity => _ivrmgCSectionCapacity;
  set ivrmgCSectionCapacity(int? ivrmgCSectionCapacity) =>
      _ivrmgCSectionCapacity = ivrmgCSectionCapacity;
  int? get ivrmgCSCLockingPeriod => _ivrmgCSCLockingPeriod;
  set ivrmgCSCLockingPeriod(int? ivrmgCSCLockingPeriod) =>
      _ivrmgCSCLockingPeriod = ivrmgCSCLockingPeriod;
  int? get ivrmgCFPLockingPeriod => _ivrmgCFPLockingPeriod;
  set ivrmgCFPLockingPeriod(int? ivrmgCFPLockingPeriod) =>
      _ivrmgCFPLockingPeriod = ivrmgCFPLockingPeriod;
  bool? get ivrmgCSCActive => _ivrmgCSCActive;
  set ivrmgCSCActive(bool? ivrmgCSCActive) => _ivrmgCSCActive = ivrmgCSCActive;
  bool? get ivrmgCFPActive => _ivrmgCFPActive;
  set ivrmgCFPActive(bool? ivrmgCFPActive) => _ivrmgCFPActive = ivrmgCFPActive;
  bool? get ivrmgCOnlineFPActive => _ivrmgCOnlineFPActive;
  set ivrmgCOnlineFPActive(bool? ivrmgCOnlineFPActive) =>
      _ivrmgCOnlineFPActive = ivrmgCOnlineFPActive;
  bool? get ivrmgCFaceReaderActive => _ivrmgCFaceReaderActive;
  set ivrmgCFaceReaderActive(bool? ivrmgCFaceReaderActive) =>
      _ivrmgCFaceReaderActive = ivrmgCFaceReaderActive;
  bool? get ivrmgCDefaultStudentSelection => _ivrmgCDefaultStudentSelection;
  set ivrmgCDefaultStudentSelection(bool? ivrmgCDefaultStudentSelection) =>
      _ivrmgCDefaultStudentSelection = ivrmgCDefaultStudentSelection;
  String? get updatedDate => _updatedDate;
  set updatedDate(String? updatedDate) => _updatedDate = updatedDate;
  int? get ivrmgCPagePagination => _ivrmgCPagePagination;
  set ivrmgCPagePagination(int? ivrmgCPagePagination) =>
      _ivrmgCPagePagination = ivrmgCPagePagination;
  int? get ivrmgCReportPagination => _ivrmgCReportPagination;
  set ivrmgCReportPagination(int? ivrmgCReportPagination) =>
      _ivrmgCReportPagination = ivrmgCReportPagination;
  bool? get ivrmgCAdmnoColumnDisplay => _ivrmgCAdmnoColumnDisplay;
  set ivrmgCAdmnoColumnDisplay(bool? ivrmgCAdmnoColumnDisplay) =>
      _ivrmgCAdmnoColumnDisplay = ivrmgCAdmnoColumnDisplay;
  bool? get ivrmgCRegnoColumnDisplay => _ivrmgCRegnoColumnDisplay;
  set ivrmgCRegnoColumnDisplay(bool? ivrmgCRegnoColumnDisplay) =>
      _ivrmgCRegnoColumnDisplay = ivrmgCRegnoColumnDisplay;
  bool? get ivrmgCRollnoColumnDisplay => _ivrmgCRollnoColumnDisplay;
  set ivrmgCRollnoColumnDisplay(bool? ivrmgCRollnoColumnDisplay) =>
      _ivrmgCRollnoColumnDisplay = ivrmgCRollnoColumnDisplay;
  String? get ivrmgCDisclaimer => _ivrmgCDisclaimer;
  set ivrmgCDisclaimer(String? ivrmgCDisclaimer) =>
      _ivrmgCDisclaimer = ivrmgCDisclaimer;
  String? get ivrmgCAdmNoRegNoRollNoDefaultFlag =>
      _ivrmgCAdmNoRegNoRollNoDefaultFlag;
  set ivrmgCAdmNoRegNoRollNoDefaultFlag(
          String? ivrmgCAdmNoRegNoRollNoDefaultFlag) =>
      _ivrmgCAdmNoRegNoRollNoDefaultFlag = ivrmgCAdmNoRegNoRollNoDefaultFlag;
  int? get ivrmgCTransportRequired => _ivrmgCTransportRequired;
  set ivrmgCTransportRequired(int? ivrmgCTransportRequired) =>
      _ivrmgCTransportRequired = ivrmgCTransportRequired;
  String? get ivrmgCClasswisePayment => _ivrmgCClasswisePayment;
  set ivrmgCClasswisePayment(String? ivrmgCClasswisePayment) =>
      _ivrmgCClasswisePayment = ivrmgCClasswisePayment;
  String? get ivrmgCAPIOrSMTPFlg => _ivrmgCAPIOrSMTPFlg;
  set ivrmgCAPIOrSMTPFlg(String? ivrmgCAPIOrSMTPFlg) =>
      _ivrmgCAPIOrSMTPFlg = ivrmgCAPIOrSMTPFlg;
  bool? get ivrmgCEnableSTIntFlg => _ivrmgCEnableSTIntFlg;
  set ivrmgCEnableSTIntFlg(bool? ivrmgCEnableSTIntFlg) =>
      _ivrmgCEnableSTIntFlg = ivrmgCEnableSTIntFlg;
  bool? get ivrmgCEnableCTIntFlg => _ivrmgCEnableCTIntFlg;
  set ivrmgCEnableCTIntFlg(bool? ivrmgCEnableCTIntFlg) =>
      _ivrmgCEnableCTIntFlg = ivrmgCEnableCTIntFlg;
  bool? get ivrmgCEnableHODIntFlg => _ivrmgCEnableHODIntFlg;
  set ivrmgCEnableHODIntFlg(bool? ivrmgCEnableHODIntFlg) =>
      _ivrmgCEnableHODIntFlg = ivrmgCEnableHODIntFlg;
  bool? get ivrmgCEnablePrincipalIntFlg => _ivrmgCEnablePrincipalIntFlg;
  set ivrmgCEnablePrincipalIntFlg(bool? ivrmgCEnablePrincipalIntFlg) =>
      _ivrmgCEnablePrincipalIntFlg = ivrmgCEnablePrincipalIntFlg;
  bool? get ivrmgCEnableASIntFlg => _ivrmgCEnableASIntFlg;
  set ivrmgCEnableASIntFlg(bool? ivrmgCEnableASIntFlg) =>
      _ivrmgCEnableASIntFlg = ivrmgCEnableASIntFlg;
  String? get ivrmgCSendGridKey => _ivrmgCSendGridKey;
  set ivrmgCSendGridKey(String? ivrmgCSendGridKey) =>
      _ivrmgCSendGridKey = ivrmgCSendGridKey;
  bool? get ivrmgCSportsPointsDropdownFlg => _ivrmgCSportsPointsDropdownFlg;
  set ivrmgCSportsPointsDropdownFlg(bool? ivrmgCSportsPointsDropdownFlg) =>
      _ivrmgCSportsPointsDropdownFlg = ivrmgCSportsPointsDropdownFlg;
  bool? get ivrmgCStudentDataChangeAlertFlg => _ivrmgCStudentDataChangeAlertFlg;
  set ivrmgCStudentDataChangeAlertFlg(bool? ivrmgCStudentDataChangeAlertFlg) =>
      _ivrmgCStudentDataChangeAlertFlg = ivrmgCStudentDataChangeAlertFlg;
  int? get ivrmgCStudentDataChangeAlertDays =>
      _ivrmgCStudentDataChangeAlertDays;
  set ivrmgCStudentDataChangeAlertDays(int? ivrmgCStudentDataChangeAlertDays) =>
      _ivrmgCStudentDataChangeAlertDays = ivrmgCStudentDataChangeAlertDays;
  bool? get ivrmgCEnableSTSUBTIntFlg => _ivrmgCEnableSTSUBTIntFlg;
  set ivrmgCEnableSTSUBTIntFlg(bool? ivrmgCEnableSTSUBTIntFlg) =>
      _ivrmgCEnableSTSUBTIntFlg = ivrmgCEnableSTSUBTIntFlg;
  bool? get ivrmgCEnableSTCTIntFlg => _ivrmgCEnableSTCTIntFlg;
  set ivrmgCEnableSTCTIntFlg(bool? ivrmgCEnableSTCTIntFlg) =>
      _ivrmgCEnableSTCTIntFlg = ivrmgCEnableSTCTIntFlg;
  bool? get ivrmgCEnableSTHODIntFlg => _ivrmgCEnableSTHODIntFlg;
  set ivrmgCEnableSTHODIntFlg(bool? ivrmgCEnableSTHODIntFlg) =>
      _ivrmgCEnableSTHODIntFlg = ivrmgCEnableSTHODIntFlg;
  bool? get ivrmgCEnableSTPrincipalIntFlg => _ivrmgCEnableSTPrincipalIntFlg;
  set ivrmgCEnableSTPrincipalIntFlg(bool? ivrmgCEnableSTPrincipalIntFlg) =>
      _ivrmgCEnableSTPrincipalIntFlg = ivrmgCEnableSTPrincipalIntFlg;
  bool? get ivrmgCEnableSTASIntFlg => _ivrmgCEnableSTASIntFlg;
  set ivrmgCEnableSTASIntFlg(bool? ivrmgCEnableSTASIntFlg) =>
      _ivrmgCEnableSTASIntFlg = ivrmgCEnableSTASIntFlg;
  bool? get ivrmgCEnableSTECIntFlg => _ivrmgCEnableSTECIntFlg;
  set ivrmgCEnableSTECIntFlg(bool? ivrmgCEnableSTECIntFlg) =>
      _ivrmgCEnableSTECIntFlg = ivrmgCEnableSTECIntFlg;
  bool? get ivrmgCGMRDTOALLFlg => _ivrmgCGMRDTOALLFlg;
  set ivrmgCGMRDTOALLFlg(bool? ivrmgCGMRDTOALLFlg) =>
      _ivrmgCGMRDTOALLFlg = ivrmgCGMRDTOALLFlg;
  bool? get ivrmgCEnableStaffwiseIntFlg => _ivrmgCEnableStaffwiseIntFlg;
  set ivrmgCEnableStaffwiseIntFlg(bool? ivrmgCEnableStaffwiseIntFlg) =>
      _ivrmgCEnableStaffwiseIntFlg = ivrmgCEnableStaffwiseIntFlg;
  bool? get ivrmgCEnableCTSTIntFlg => _ivrmgCEnableCTSTIntFlg;
  set ivrmgCEnableCTSTIntFlg(bool? ivrmgCEnableCTSTIntFlg) =>
      _ivrmgCEnableCTSTIntFlg = ivrmgCEnableCTSTIntFlg;
  bool? get ivrmgCEnableHODSTIntFlg => _ivrmgCEnableHODSTIntFlg;
  set ivrmgCEnableHODSTIntFlg(bool? ivrmgCEnableHODSTIntFlg) =>
      _ivrmgCEnableHODSTIntFlg = ivrmgCEnableHODSTIntFlg;
  bool? get ivrmgCEnablePrincipalSTIntFlg => _ivrmgCEnablePrincipalSTIntFlg;
  set ivrmgCEnablePrincipalSTIntFlg(bool? ivrmgCEnablePrincipalSTIntFlg) =>
      _ivrmgCEnablePrincipalSTIntFlg = ivrmgCEnablePrincipalSTIntFlg;
  bool? get ivrmgCEnableASSTIntFlg => _ivrmgCEnableASSTIntFlg;
  set ivrmgCEnableASSTIntFlg(bool? ivrmgCEnableASSTIntFlg) =>
      _ivrmgCEnableASSTIntFlg = ivrmgCEnableASSTIntFlg;
  bool? get ivrmgCEnableECSTIntFlg => _ivrmgCEnableECSTIntFlg;
  set ivrmgCEnableECSTIntFlg(bool? ivrmgCEnableECSTIntFlg) =>
      _ivrmgCEnableECSTIntFlg = ivrmgCEnableECSTIntFlg;
  bool? get ivrmgCEnableSUBTSTUIntFlg => _ivrmgCEnableSUBTSTUIntFlg;
  set ivrmgCEnableSUBTSTUIntFlg(bool? ivrmgCEnableSUBTSTUIntFlg) =>
      _ivrmgCEnableSUBTSTUIntFlg = ivrmgCEnableSUBTSTUIntFlg;
  bool? get ivrmgCCatLogoFlg => _ivrmgCCatLogoFlg;
  set ivrmgCCatLogoFlg(bool? ivrmgCCatLogoFlg) =>
      _ivrmgCCatLogoFlg = ivrmgCCatLogoFlg;

  Values2.fromJson(Map<String, dynamic> json) {
    _ivrmgCId = json['ivrmgC_Id'];
    _mIId = json['mI_Id'];
    _ivrmgCMobileValOTPFlag = json['ivrmgC_MobileValOTPFlag'];
    _ivrmgCOTPMobileNo = json['ivrmgC_OTPMobileNo'];
    _ivrmgCOTPMailId = json['ivrmgC_OTPMailId'];
    _ivrmgCEmailValOTPFlag = json['ivrmgC_emailValOTPFlag'];
    _ivrmgCStudentPhotoPath = json['ivrmgC_StudentPhotoPath'];
    _ivrmgCStaffPhotoPath = json['ivrmgC_StaffPhotoPath'];
    _ivrmgCComTrasaNoFlag = json['ivrmgC_ComTrasaNoFlag'];
    _ivrmgCSMSDomain = json['ivrmgC_SMSDomain'];
    _ivrmgCSMSURL = json['ivrmgC_SMSURL'];
    _ivrmgCSMSUserName = json['ivrmgC_SMSUserName'];
    _ivrmgCSMSPassword = json['ivrmgC_SMSPassword'];
    _ivrmgCSMSSenderId = json['ivrmgC_SMSSenderId'];
    _ivrmgCSMSWorkingKey = json['ivrmgC_SMSWorkingKey'];
    _ivrmgCSMSFooter = json['ivrmgC_SMSFooter'];
    _ivrmgCSMSActiveFlag = json['ivrmgC_SMSActiveFlag'];
    _ivrmgCEmailUserName = json['ivrmgC_emailUserName'];
    _ivrmgCEmailPassword = json['ivrmgC_emailPassword'];
    _ivrmgCHostName = json['ivrmgC_HostName'];
    _ivrmgCPortNo = json['ivrmgC_PortNo'];
    _ivrmgCMailGenralDesc = json['ivrmgC_MailGenralDesc'];
    _ivrmgCWebiste = json['ivrmgC_Webiste'];
    _ivrmgCEmailid = json['ivrmgC_emailid'];
    _ivrmgCEmailFooter = json['ivrmgC_emailFooter'];
    _ivrmgCCCMail = json['ivrmgC_CCMail'];
    _ivrmgCBCCMail = json['ivrmgC_BCCMail'];
    _ivrmgCToMail = json['ivrmgC_ToMail'];
    _ivrmgCEmailActiveFlag = json['ivrmgC_EmailActiveFlag'];
    _ivrmgCPagination = json['ivrmgC_Pagination'];
    _ivrmgCReminderDays = json['ivrmgC_ReminderDays'];
    _ivrmgCClassCapacity = json['ivrmgC_ClassCapacity'];
    _ivrmgCSectionCapacity = json['ivrmgC_SectionCapacity'];
    _ivrmgCSCLockingPeriod = json['ivrmgC_SCLockingPeriod'];
    _ivrmgCFPLockingPeriod = json['ivrmgC_FPLockingPeriod'];
    _ivrmgCSCActive = json['ivrmgC_SCActive'];
    _ivrmgCFPActive = json['ivrmgC_FPActive'];
    _ivrmgCOnlineFPActive = json['ivrmgC_OnlineFPActive'];
    _ivrmgCFaceReaderActive = json['ivrmgC_FaceReaderActive'];
    _ivrmgCDefaultStudentSelection = json['ivrmgC_DefaultStudentSelection'];
    _updatedDate = json['updatedDate'];
    _ivrmgCPagePagination = json['ivrmgC_PagePagination'];
    _ivrmgCReportPagination = json['ivrmgC_ReportPagination'];
    _ivrmgCAdmnoColumnDisplay = json['ivrmgC_AdmnoColumnDisplay'];
    _ivrmgCRegnoColumnDisplay = json['ivrmgC_RegnoColumnDisplay'];
    _ivrmgCRollnoColumnDisplay = json['ivrmgC_RollnoColumnDisplay'];
    _ivrmgCDisclaimer = json['ivrmgC_Disclaimer'];
    _ivrmgCAdmNoRegNoRollNoDefaultFlag =
        json['ivrmgC_AdmNo_RegNo_RollNo_DefaultFlag'];
    _ivrmgCTransportRequired = json['ivrmgC_TransportRequired'];
    _ivrmgCClasswisePayment = json['ivrmgC_Classwise_Payment'];
    _ivrmgCAPIOrSMTPFlg = json['ivrmgC_APIOrSMTPFlg'];
    _ivrmgCEnableSTIntFlg = json['ivrmgC_EnableSTIntFlg'];
    _ivrmgCEnableCTIntFlg = json['ivrmgC_EnableCTIntFlg'];
    _ivrmgCEnableHODIntFlg = json['ivrmgC_EnableHODIntFlg'];
    _ivrmgCEnablePrincipalIntFlg = json['ivrmgC_EnablePrincipalIntFlg'];
    _ivrmgCEnableASIntFlg = json['ivrmgC_EnableASIntFlg'];
    _ivrmgCSendGridKey = json['ivrmgC_SendGrid_Key'];
    _ivrmgCSportsPointsDropdownFlg = json['ivrmgC_SportsPointsDropdownFlg'];
    _ivrmgCStudentDataChangeAlertFlg = json['ivrmgC_StudentDataChangeAlertFlg'];
    _ivrmgCStudentDataChangeAlertDays =
        json['ivrmgC_StudentDataChangeAlertDays'];
    _ivrmgCEnableSTSUBTIntFlg = json['ivrmgC_EnableSTSUBTIntFlg'];
    _ivrmgCEnableSTCTIntFlg = json['ivrmgC_EnableSTCTIntFlg'];
    _ivrmgCEnableSTHODIntFlg = json['ivrmgC_EnableSTHODIntFlg'];
    _ivrmgCEnableSTPrincipalIntFlg = json['ivrmgC_EnableSTPrincipalIntFlg'];
    _ivrmgCEnableSTASIntFlg = json['ivrmgC_EnableSTASIntFlg'];
    _ivrmgCEnableSTECIntFlg = json['ivrmgC_EnableSTECIntFlg'];
    _ivrmgCGMRDTOALLFlg = json['ivrmgC_GMRDTOALLFlg'];
    _ivrmgCEnableStaffwiseIntFlg = json['ivrmgC_EnableStaffwiseIntFlg'];
    _ivrmgCEnableCTSTIntFlg = json['ivrmgC_EnableCTSTIntFlg'];
    _ivrmgCEnableHODSTIntFlg = json['ivrmgC_EnableHODSTIntFlg'];
    _ivrmgCEnablePrincipalSTIntFlg = json['ivrmgC_EnablePrincipalSTIntFlg'];
    _ivrmgCEnableASSTIntFlg = json['ivrmgC_EnableASSTIntFlg'];
    _ivrmgCEnableECSTIntFlg = json['ivrmgC_EnableECSTIntFlg'];
    _ivrmgCEnableSUBTSTUIntFlg = json['ivrmgC_EnableSUBTSTUIntFlg'];
    _ivrmgCCatLogoFlg = json['ivrmgC_CatLogoFlg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ivrmgC_Id'] = this._ivrmgCId;
    data['mI_Id'] = this._mIId;
    data['ivrmgC_MobileValOTPFlag'] = this._ivrmgCMobileValOTPFlag;
    data['ivrmgC_OTPMobileNo'] = this._ivrmgCOTPMobileNo;
    data['ivrmgC_OTPMailId'] = this._ivrmgCOTPMailId;
    data['ivrmgC_emailValOTPFlag'] = this._ivrmgCEmailValOTPFlag;
    data['ivrmgC_StudentPhotoPath'] = this._ivrmgCStudentPhotoPath;
    data['ivrmgC_StaffPhotoPath'] = this._ivrmgCStaffPhotoPath;
    data['ivrmgC_ComTrasaNoFlag'] = this._ivrmgCComTrasaNoFlag;
    data['ivrmgC_SMSDomain'] = this._ivrmgCSMSDomain;
    data['ivrmgC_SMSURL'] = this._ivrmgCSMSURL;
    data['ivrmgC_SMSUserName'] = this._ivrmgCSMSUserName;
    data['ivrmgC_SMSPassword'] = this._ivrmgCSMSPassword;
    data['ivrmgC_SMSSenderId'] = this._ivrmgCSMSSenderId;
    data['ivrmgC_SMSWorkingKey'] = this._ivrmgCSMSWorkingKey;
    data['ivrmgC_SMSFooter'] = this._ivrmgCSMSFooter;
    data['ivrmgC_SMSActiveFlag'] = this._ivrmgCSMSActiveFlag;
    data['ivrmgC_emailUserName'] = this._ivrmgCEmailUserName;
    data['ivrmgC_emailPassword'] = this._ivrmgCEmailPassword;
    data['ivrmgC_HostName'] = this._ivrmgCHostName;
    data['ivrmgC_PortNo'] = this._ivrmgCPortNo;
    data['ivrmgC_MailGenralDesc'] = this._ivrmgCMailGenralDesc;
    data['ivrmgC_Webiste'] = this._ivrmgCWebiste;
    data['ivrmgC_emailid'] = this._ivrmgCEmailid;
    data['ivrmgC_emailFooter'] = this._ivrmgCEmailFooter;
    data['ivrmgC_CCMail'] = this._ivrmgCCCMail;
    data['ivrmgC_BCCMail'] = this._ivrmgCBCCMail;
    data['ivrmgC_ToMail'] = this._ivrmgCToMail;
    data['ivrmgC_EmailActiveFlag'] = this._ivrmgCEmailActiveFlag;
    data['ivrmgC_Pagination'] = this._ivrmgCPagination;
    data['ivrmgC_ReminderDays'] = this._ivrmgCReminderDays;
    data['ivrmgC_ClassCapacity'] = this._ivrmgCClassCapacity;
    data['ivrmgC_SectionCapacity'] = this._ivrmgCSectionCapacity;
    data['ivrmgC_SCLockingPeriod'] = this._ivrmgCSCLockingPeriod;
    data['ivrmgC_FPLockingPeriod'] = this._ivrmgCFPLockingPeriod;
    data['ivrmgC_SCActive'] = this._ivrmgCSCActive;
    data['ivrmgC_FPActive'] = this._ivrmgCFPActive;
    data['ivrmgC_OnlineFPActive'] = this._ivrmgCOnlineFPActive;
    data['ivrmgC_FaceReaderActive'] = this._ivrmgCFaceReaderActive;
    data['ivrmgC_DefaultStudentSelection'] =
        this._ivrmgCDefaultStudentSelection;
    data['updatedDate'] = this._updatedDate;
    data['ivrmgC_PagePagination'] = this._ivrmgCPagePagination;
    data['ivrmgC_ReportPagination'] = this._ivrmgCReportPagination;
    data['ivrmgC_AdmnoColumnDisplay'] = this._ivrmgCAdmnoColumnDisplay;
    data['ivrmgC_RegnoColumnDisplay'] = this._ivrmgCRegnoColumnDisplay;
    data['ivrmgC_RollnoColumnDisplay'] = this._ivrmgCRollnoColumnDisplay;
    data['ivrmgC_Disclaimer'] = this._ivrmgCDisclaimer;
    data['ivrmgC_AdmNo_RegNo_RollNo_DefaultFlag'] =
        this._ivrmgCAdmNoRegNoRollNoDefaultFlag;
    data['ivrmgC_TransportRequired'] = this._ivrmgCTransportRequired;
    data['ivrmgC_Classwise_Payment'] = this._ivrmgCClasswisePayment;
    data['ivrmgC_APIOrSMTPFlg'] = this._ivrmgCAPIOrSMTPFlg;
    data['ivrmgC_EnableSTIntFlg'] = this._ivrmgCEnableSTIntFlg;
    data['ivrmgC_EnableCTIntFlg'] = this._ivrmgCEnableCTIntFlg;
    data['ivrmgC_EnableHODIntFlg'] = this._ivrmgCEnableHODIntFlg;
    data['ivrmgC_EnablePrincipalIntFlg'] = this._ivrmgCEnablePrincipalIntFlg;
    data['ivrmgC_EnableASIntFlg'] = this._ivrmgCEnableASIntFlg;
    data['ivrmgC_SendGrid_Key'] = this._ivrmgCSendGridKey;
    data['ivrmgC_SportsPointsDropdownFlg'] =
        this._ivrmgCSportsPointsDropdownFlg;
    data['ivrmgC_StudentDataChangeAlertFlg'] =
        this._ivrmgCStudentDataChangeAlertFlg;
    data['ivrmgC_StudentDataChangeAlertDays'] =
        this._ivrmgCStudentDataChangeAlertDays;
    data['ivrmgC_EnableSTSUBTIntFlg'] = this._ivrmgCEnableSTSUBTIntFlg;
    data['ivrmgC_EnableSTCTIntFlg'] = this._ivrmgCEnableSTCTIntFlg;
    data['ivrmgC_EnableSTHODIntFlg'] = this._ivrmgCEnableSTHODIntFlg;
    data['ivrmgC_EnableSTPrincipalIntFlg'] =
        this._ivrmgCEnableSTPrincipalIntFlg;
    data['ivrmgC_EnableSTASIntFlg'] = this._ivrmgCEnableSTASIntFlg;
    data['ivrmgC_EnableSTECIntFlg'] = this._ivrmgCEnableSTECIntFlg;
    data['ivrmgC_GMRDTOALLFlg'] = this._ivrmgCGMRDTOALLFlg;
    data['ivrmgC_EnableStaffwiseIntFlg'] = this._ivrmgCEnableStaffwiseIntFlg;
    data['ivrmgC_EnableCTSTIntFlg'] = this._ivrmgCEnableCTSTIntFlg;
    data['ivrmgC_EnableHODSTIntFlg'] = this._ivrmgCEnableHODSTIntFlg;
    data['ivrmgC_EnablePrincipalSTIntFlg'] =
        this._ivrmgCEnablePrincipalSTIntFlg;
    data['ivrmgC_EnableASSTIntFlg'] = this._ivrmgCEnableASSTIntFlg;
    data['ivrmgC_EnableECSTIntFlg'] = this._ivrmgCEnableECSTIntFlg;
    data['ivrmgC_EnableSUBTSTUIntFlg'] = this._ivrmgCEnableSUBTSTUIntFlg;
    data['ivrmgC_CatLogoFlg'] = this._ivrmgCCatLogoFlg;
    return data;
  }
}

class Getinboxmsg {
  String? _type;
  List<Values3>? _values3;

  Getinboxmsg({String? type, List<Values3>? values3}) {
    if (type != null) {
      this._type = type;
    }
    if (values3 != null) {
      this._values3 = values3;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<Values3>? get values3 => _values3;
  set values3(List<Values3>? values3) => _values3 = values3;

  Getinboxmsg.fromJson(Map<String, dynamic> json) {
    _type = json['$type'];
    if (json['$values3'] != null) {
      _values3 = <Values3>[];
      json['$values3'].forEach((v) {
        _values3!.add(new Values3.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$type'] = this._type;
    if (this._values3 != null) {
      data['$values3'] = this._values3!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values3 {
  String? _type;
  String? _iSTINTDateTime;
  String? _iSTINTAttachment;
  int? _iSMINTId;
  int? _iSTINTId;
  String? _iSMINTInteractionId;
  String? _iSMINTSubject;
  String? _iSMINTInteraction;
  String? _iSMINTGroupOrIndFlg;
  String? _iSMINTComposedByFlg;
  int? _iSMINTComposedById;
  String? _sender;
  String? _receiver;
  String? _iSMINTDateTime;
  bool? _iSMINTActiveFlag;

  Values3(
      {String? type,
      String? iSTINTDateTime,
      String? iSTINTAttachment,
      int? iSMINTId,
      int? iSTINTId,
      String? iSMINTInteractionId,
      String? iSMINTSubject,
      String? iSMINTInteraction,
      String? iSMINTGroupOrIndFlg,
      String? iSMINTComposedByFlg,
      int? iSMINTComposedById,
      String? sender,
      String? receiver,
      String? iSMINTDateTime,
      bool? iSMINTActiveFlag}) {
    if (type != null) {
      this._type = type;
    }
    if (iSTINTDateTime != null) {
      this._iSTINTDateTime = iSTINTDateTime;
    }
    if (iSTINTAttachment != null) {
      this._iSTINTAttachment = iSTINTAttachment;
    }
    if (iSMINTId != null) {
      this._iSMINTId = iSMINTId;
    }
    if (iSTINTId != null) {
      this._iSTINTId = iSTINTId;
    }
    if (iSMINTInteractionId != null) {
      this._iSMINTInteractionId = iSMINTInteractionId;
    }
    if (iSMINTSubject != null) {
      this._iSMINTSubject = iSMINTSubject;
    }
    if (iSMINTInteraction != null) {
      this._iSMINTInteraction = iSMINTInteraction;
    }
    if (iSMINTGroupOrIndFlg != null) {
      this._iSMINTGroupOrIndFlg = iSMINTGroupOrIndFlg;
    }
    if (iSMINTComposedByFlg != null) {
      this._iSMINTComposedByFlg = iSMINTComposedByFlg;
    }
    if (iSMINTComposedById != null) {
      this._iSMINTComposedById = iSMINTComposedById;
    }
    if (sender != null) {
      this._sender = sender;
    }
    if (receiver != null) {
      this._receiver = receiver;
    }
    if (iSMINTDateTime != null) {
      this._iSMINTDateTime = iSMINTDateTime;
    }
    if (iSMINTActiveFlag != null) {
      this._iSMINTActiveFlag = iSMINTActiveFlag;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  String? get iSTINTDateTime => _iSTINTDateTime;
  set iSTINTDateTime(String? iSTINTDateTime) =>
      _iSTINTDateTime = iSTINTDateTime;
  String? get iSTINTAttachment => _iSTINTAttachment;
  set iSTINTAttachment(String? iSTINTAttachment) =>
      _iSTINTAttachment = iSTINTAttachment;
  int? get iSMINTId => _iSMINTId;
  set iSMINTId(int? iSMINTId) => _iSMINTId = iSMINTId;
  int? get iSTINTId => _iSTINTId;
  set iSTINTId(int? iSTINTId) => _iSTINTId = iSTINTId;
  String? get iSMINTInteractionId => _iSMINTInteractionId;
  set iSMINTInteractionId(String? iSMINTInteractionId) =>
      _iSMINTInteractionId = iSMINTInteractionId;
  String? get iSMINTSubject => _iSMINTSubject;
  set iSMINTSubject(String? iSMINTSubject) => _iSMINTSubject = iSMINTSubject;
  String? get iSMINTInteraction => _iSMINTInteraction;
  set iSMINTInteraction(String? iSMINTInteraction) =>
      _iSMINTInteraction = iSMINTInteraction;
  String? get iSMINTGroupOrIndFlg => _iSMINTGroupOrIndFlg;
  set iSMINTGroupOrIndFlg(String? iSMINTGroupOrIndFlg) =>
      _iSMINTGroupOrIndFlg = iSMINTGroupOrIndFlg;
  String? get iSMINTComposedByFlg => _iSMINTComposedByFlg;
  set iSMINTComposedByFlg(String? iSMINTComposedByFlg) =>
      _iSMINTComposedByFlg = iSMINTComposedByFlg;
  int? get iSMINTComposedById => _iSMINTComposedById;
  set iSMINTComposedById(int? iSMINTComposedById) =>
      _iSMINTComposedById = iSMINTComposedById;
  String? get sender => _sender;
  set sender(String? sender) => _sender = sender;
  String? get receiver => _receiver;
  set receiver(String? receiver) => _receiver = receiver;
  String? get iSMINTDateTime => _iSMINTDateTime;
  set iSMINTDateTime(String? iSMINTDateTime) =>
      _iSMINTDateTime = iSMINTDateTime;
  bool? get iSMINTActiveFlag => _iSMINTActiveFlag;
  set iSMINTActiveFlag(bool? iSMINTActiveFlag) =>
      _iSMINTActiveFlag = iSMINTActiveFlag;

  Values3.fromJson(Map<String, dynamic> json) {
    _type = json['$type'];
    _iSTINTDateTime = json['ISTINT_DateTime'];
    _iSTINTAttachment = json['ISTINT_Attachment'];
    _iSMINTId = json['ISMINT_Id'];
    _iSTINTId = json['ISTINT_Id'];
    _iSMINTInteractionId = json['ISMINT_InteractionId'];
    _iSMINTSubject = json['ISMINT_Subject'];
    _iSMINTInteraction = json['ISMINT_Interaction'];
    _iSMINTGroupOrIndFlg = json['ISMINT_GroupOrIndFlg'];
    _iSMINTComposedByFlg = json['ISMINT_ComposedByFlg'];
    _iSMINTComposedById = json['ISMINT_ComposedById'];
    _sender = json['Sender'];
    _receiver = json['Receiver'];
    _iSMINTDateTime = json['ISMINT_DateTime'];
    _iSMINTActiveFlag = json['ISMINT_ActiveFlag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$type'] = this._type;
    data['ISTINT_DateTime'] = this._iSTINTDateTime;
    data['ISTINT_Attachment'] = this._iSTINTAttachment;
    data['ISMINT_Id'] = this._iSMINTId;
    data['ISTINT_Id'] = this._iSTINTId;
    data['ISMINT_InteractionId'] = this._iSMINTInteractionId;
    data['ISMINT_Subject'] = this._iSMINTSubject;
    data['ISMINT_Interaction'] = this._iSMINTInteraction;
    data['ISMINT_GroupOrIndFlg'] = this._iSMINTGroupOrIndFlg;
    data['ISMINT_ComposedByFlg'] = this._iSMINTComposedByFlg;
    data['ISMINT_ComposedById'] = this._iSMINTComposedById;
    data['Sender'] = this._sender;
    data['Receiver'] = this._receiver;
    data['ISMINT_DateTime'] = this._iSMINTDateTime;
    data['ISMINT_ActiveFlag'] = this._iSMINTActiveFlag;
    return data;
  }
}

class GetinboxmsgReadflg {
  String? _type;
  List<Value4>? _value4;

  GetinboxmsgReadflg({String? type, List<Value4>? value4}) {
    if (type != null) {
      this._type = type;
    }
    if (value4 != null) {
      this._value4 = value4;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  List<Value4>? get value4 => _value4;
  set value4(List<Value4>? value4) => _value4 = value4;

  GetinboxmsgReadflg.fromJson(Map<String, dynamic> json) {
    _type = json['$type'];
    if (json['$value4'] != null) {
      _value4 = <Value4>[];
      json['$value4'].forEach((v) {
        _value4!.add(new Value4.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$type'] = this._type;
    if (this._value4 != null) {
      data['$value4'] = this._value4!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Value4 {
  String? _type;
  int? _iSMINTId;
  int? _iSTINTReadFlg;

  Value4({String? type, int? iSMINTId, int? iSTINTReadFlg}) {
    if (type != null) {
      this._type = type;
    }
    if (iSMINTId != null) {
      this._iSMINTId = iSMINTId;
    }
    if (iSTINTReadFlg != null) {
      this._iSTINTReadFlg = iSTINTReadFlg;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  int? get iSMINTId => _iSMINTId;
  set iSMINTId(int? iSMINTId) => _iSMINTId = iSMINTId;
  int? get iSTINTReadFlg => _iSTINTReadFlg;
  set iSTINTReadFlg(int? iSTINTReadFlg) => _iSTINTReadFlg = iSTINTReadFlg;

  Value4.fromJson(Map<String, dynamic> json) {
    _type = json['$type'];
    _iSMINTId = json['ISMINT_Id'];
    _iSTINTReadFlg = json['ISTINT_ReadFlg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$type'] = this._type;
    data['ISMINT_Id'] = this._iSMINTId;
    data['ISTINT_ReadFlg'] = this._iSTINTReadFlg;
    return data;
  }
}
