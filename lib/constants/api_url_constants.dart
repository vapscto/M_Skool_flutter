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
  // static String getUnreadData = 'api/IVRM_InteractionsFacade/reply/';
  static String composeInteraction = 'api/IVRM_InteractionsFacade/savedetails/';
  static String getMessages = 'api/IVRM_InteractionsFacade/reply/';
  static String sendMessage = 'api/IVRM_InteractionsFacade/savereply/';
  static String interactionImageUpload =
      'https://jnujaipur.vapssmartecampus.com:61001/api/LoginFacade/InteractionUpload';

  // Role Constant's

  static int student = 7;
  static int hod = 26;
  static int staff = 18;
  static int principal = 23;
  static int chairman = 22;
  static int manager = 24;

  // ****************Staff Api****************//

  static String viewNoticeCircular = "api/EmployeePtalFacade/onclick_notice";
  static String viewNoticeGetSession = "api/EmployeePtalFacade/getdata/";

  static String staffDailyTTGetDays = "api/EmployeeTTFacade/getdata/";
  static String getStaffDailyTT = "api/EmployeeTTFacade/getdaily_data/";
  static String getWeeklyTT = "api/EmployeeTTFacade/getdata/";

  static String getStudentBday = "api/studentbirthdayreportFacade/getdetails/";

  // SALARY SLIP API .........
  static String getYearandMonth = 'api/SalarySlipFacade/onloadgetdetails/';
  static String getSalarySlipDetails =
      'api/SalarySlipFacade/GenerateEmployeeSalarySlip/';

  // SALARY DETAILS API .........

  static String salaryDetailsApi =
      "api/EmployeeSalaryDetailsFacade/getdaily_data/";
  static String getSalaryBreak =
      "api/EmployeeSalaryDetailsFacade/getsalaryalldetails/";

  static String staffCoe = "api/COEReportFacade/";

  static String getHwYear = "api/EmployeeStudentHomeworkFacade/Getdetails/";
  static String getHwClass = "api/EmployeeStudentHomeworkFacade/get_classes/";
  static String getSection =
      "api/EmployeeStudentHomeworkFacade/getsectiondata/";
  static String getSubjects = "api/EmployeeStudentHomeworkFacade/getsubject/";
  static String saveHw = "api/EmployeeStudentHomeworkFacade/savedetail/";

  // MARKS ENTRY API ............

  static String getacademicYear = 'api/MarksEntryFacade/Getdetails/';
  static String getclass = 'api/MarksEntryFacade/onselectAcdYear/';
  static String getsection = 'api/MarksEntryFacade/onselectclass/';
  static String getexam = 'api/MarksEntryFacade/onselectSection/';
  static String getsubjectname = 'api/MarksEntryFacade/onselectExam/';
  static String getsubsubject = 'api/MarksEntryFacade/onselectSubject/';
  static String getmarksentrydetails = 'api/MarksEntryFacade/onsearch/';
  static String savemarksentrydetails = 'api/MarksEntryFacade/SaveMarks/';

  static String nB_Attachment = "api/EmployeePtalFacade/viewnotice";

  static String punchReport = "api/EmployeePunchAttendenceFacade/getrpt/";

  static String getHwList =
      "api/EmployeeStudentHomeworkFacade/gethomework_list/";

  static String getCwAttachedFile = "api/IVRM_ClassWorkFacade/viewclasswork/";
  static String getHwAttachedFile =
      "api/EmployeeStudentHomeworkFacade/viewhomework";

  static String getCwAttachmentFile =
      "api/IVRM_ClassWorkFacade/viewstudentupload/";

  static String getStudentUploadedHw =
      "api/EmployeeStudentHomeworkFacade/viewstudentupload/";

  static String getVerifyClassWorkList =
      "api/IVRM_ClassWorkFacade/getclasswork_list/";
  // STUDENT ATTENDANCE API .................

  static String getStudentAcademicYear =
      'api/EmployeeStudentAttendenceDetailsFacade/Getdetails/';
  static String getStudentClass =
      'api/EmployeeStudentAttendenceDetailsFacade/getclass/';
  static String getStudentSection =
      'api/EmployeeStudentAttendenceDetailsFacade/Getsection/';
  static String getStudentList = '';
  static String getStudentAttendanceDetails = '';

  // ATTENDANCE ENTRY API .................
  static String getAttendanceInitialData =
      'api/StudentAttendanceEntryFacade/getinitialdata';
  static String uploadCwEnd = "api/LoginFacade/ClassworkUpload";

  static String saveVerifyHw =
      "api/EmployeeStudentHomeworkFacade/homework_marks_update/";

  static String saveVerifyCw =
      "api/IVRM_ClassWorkFacade/classwork_marks_update/";

  static String verifySub = "api/IVRM_ClassWorkFacade/getsubjectlist/";

  static String getCwYear = "api/IVRM_ClassWorkFacade/Getdetails/";
}
