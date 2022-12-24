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

  // profile
  static String profile = "api/StudentDashboardFacade/Getdetails";
  static String studentProfileDetails =
      "api/StudentDashboardFacade/ViewStudentProfile/";

  //Library
  static String lib = "api/AdmissionCtrl/onclick_LIB/";

  // Certificates
  static String getCertitificateType =
      "api/TransferCertificateFacade/getdetails/";
  static String applyCertificate = "api/TransferCertificateFacade/tcApply/";
  static String getAllAppliedCertificate =
      "api/TransferCertificateFacade/getdetails/";

  //feedback
  static String saveFeedBack = "api/StudentFeedbackFormFacade/savefeedback/";
  static String getFeedBack = "api/StudentFeedbackFormFacade/getloaddata/";

  //Coe
  static String getAcademicYear = "api/AttendanceDetailsFacade/getloaddata/";
  static String coeData = "api/COEFacade/getcoedata/";

  //Attendance
  static String getAttAcademicYear = "api/AttendanceDetailsFacade/getloaddata/";
  static String getAttendanceDetails = "api/AdmissionCtrl/attGetdetails/";

  //NoticeBoard
  static String getNotice = "api/StudentDashboardFacade/onclick_notice/";

  //Information
  static String classWork = "api/StudentDashboardFacade/onclick_Classwork/";
  static String homeWork =
      "api/StudentDashboardFacade/onclick_Homework_datewise/";
  static String uploadHomeWork = "api/StudentDashboardFacade/savehome_doc";
  static String classworkFiltered =
      "api/StudentDashboardFacade/onclick_classwork_datewise/";
  static String noticeDatewise =
      "api/StudentDashboardFacade/onclick_notice_datewise/";
  static String uploadHomeWorkBase = "https://bdcampus.azurewebsites.net/";
  static String uploadHomeWorkEnd = "api/LoginFacade/HomeworkUpload";
  static String uploadClasswork = "api/StudentDashboardFacade/savecls_doc";

  // Fee Module Endpoints
  static String getFeeAnalysis = 'api/CumulativeFeeAnalysisFacade/getloaddata/';
  static String getFeeReceiptYear = 'api/FeesCtrl/feereceiptgetloaddata/';
  static String getFeeReceiptNo = 'api/FeesCtrl/getrecdetails/';
  static String getFeeReceiptDetails = 'api/FeesCtrl/printreceipt/';

  // Exam module
  static String getExamAcademicYear = 'api/ExamReportFacade/getloaddata/';
  static String getExamdetail = 'api/ExamReportFacade/getexamdata/';
  static String getSubjectDetail = 'api/ExamReportFacade/getexamdata';
  static String getMarksOverview = 'api/ExamReportFacade/StudentExamDetails/';

  //Time Table
  static String tt = "api/AdmissionCtrl/getStudentTT/";
  static String getloaddata = "api/AdmissionCtrl/ttgetloaddata/";

  //ForgotPassword
  static String verifyUser = "api/LoginFacade/VerifyUserName";
  static String sendOtp = "api/LoginFacade/Mobileappotp";
  static String changePassword = "api/LoginFacade/forgotpassword";
  static String resetPassword = "api/changepwdFacade";

  //PaymentApi

  static String getFeeDetForCurrentAcademic =
      "api/FeeOnlinePaymentFacade/getFeetotalamount";
  static String getInstallmentDetails =
      "api/FeeOnlinePaymentFacade/getpagedetails";

  static String openPaymentGateWay =
      "api/FeeOnlinePaymentFacade/mobilepayuconnect/";

  static String razorPayResponse =
      "api/FeeOnlinePaymentFacade/Razorpaypaymentresponse";

  // Dashboard
  static String studentDashboard = "api/AdmissionCtrl/stdDashboardDet/";

  static String paymentCharges = "api/FeesCtrl/paymentGatewayrate/";

  static String emailOtp = "api/LoginFacade/getOTPForEmail";

  static String updateHwSeen =
      "api/StudentDashboardFacade/onclick_Homework_seen/";

  static String transHistory = "api/FeesCtrl/feeTransactionlog/";

  static String transStatus = "api/FeesCtrl/feeTransactiondetail/";

  static String getSyllabusNotice =
      "api/StudentDashboardFacade/onclick_syllabus/";

  static String getTTNotice = "api/StudentDashboardFacade/onclick_TT/";

  static String stdFeeDue = "api/AdmissionCtrl/stdFeeDue/";

  static String updateCwSeen =
      "api/StudentDashboardFacade/onclick_classwork_seen/";

  static String dailyTT = "api/AdmissionCtrl/daywiseTimetable";

  /////   Interaction
  static String getStaffList = 'api/IVRM_InteractionsFacade/getdetails/';

  static String examGraph = "api/AdmissionCtrl/stdDashboardExam";
  static String getInboxData = 'api/IVRM_InteractionsFacade/getloaddata/';
  static String getUnreadData = 'api/IVRM_InteractionsFacade/reply/';
}
