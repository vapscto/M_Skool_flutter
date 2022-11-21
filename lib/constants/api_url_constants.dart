class URLS {
  // static String base = "http://192.168.55.164:4000/";
  static String base = "http://43.205.143.174/";
  static String institutionCodeBaseUrl = "https://bdcampus.azurewebsites.net/";
  // static String base = "http://192.168.1.8:4000/";
  static String userPath = "api/user/";
  static String mobileNoLogin = "mobileno/login";
  static String passWordLogin = "accountLogin";
  static String otpVerification = "verify/otp";
  static String loginVerification = "islogin";
  static String signUp = "create";
  static String logout = "logout";
  static String getProfile = "profile";
  static String updateProfile = "profile/update";
  static String fileUpload = "upload/file";
  static String versionControl = "current/version";
  static String getApiUrl = "api/LoginFacade/getinstitutionapiNew/";

  //Common ids used in all pages.
  static String miId = "mi_id";
  static String userId = "user_Id";
  static String asmayId = "asmaY_Id";
  static String ivrmrtId = "ivrmrt_Id";
  static String amstId = "amst_id";
  static String ivrmrtRole = "ivrmrt_role";
  static String hrmeId = "hrme_Id";

  // Endpoints for different Categories

  static String login = "api/LoginFacade";
  static String lib = "api/StudentDashboardFacade/onclick_LIB/";
  static String getCertitificateType =
      "api/TransferCertificateFacade/getdetails/";

  static String saveFeedBack = "api/StudentFeedbackFormFacade/savefeedback/";
  static String getFeedBack = "api/StudentFeedbackFormFacade/getloaddata/";
  static String getAcademicYear = "api/AttendanceDetailsFacade/getloaddata/";
  static String coeData = "api/COEFacade/getcoedata/";
}
