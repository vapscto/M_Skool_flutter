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
  static String versionControl = "api/AdmissionCtrl/Mobileversion_control";
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
  static String easeBuzzPaymentResponseCall =
      "api/FeeOnlinePaymentFacade/getpaymentresponseeasybuzzmobile/";

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
  static String interactionImageUpload = 'api/LoginFacade/InteractionUpload';

  // Role Constant's

  static String student = "Student";
  static String hod = "Hod";
  static String staff = "Staff";
  static int principal = 23;
  static int chairman = 22;
  static String manager = "Manager";

  // ****************Staff Api****************//

  // View Notice
  static String viewNoticeCircular = "api/EmployeePtalFacade/onclick_notice";
  static String viewNoticeGetSession = "api/EmployeePtalFacade/getdata/";

  static String staffDailyTTGetDays = "api/EmployeeTTFacade/getdata/";
  static String getStaffDailyTT = "api/EmployeeTTFacade/getdaily_data/";
  static String getWeeklyTT = "api/EmployeeTTFacade/getdata/";
  static String nB_Attachment = "api/EmployeePtalFacade/viewnotice";
  static String filterViewNotice =
      "api/EmployeePtalFacade/onclick_noticeboard_datewise/";

  //Verify HW & CW
  static String getHwTopic =
      "api/EmployeeStudentHomeworkFacade/gethomework_list/";

  static String getHwList =
      "api/EmployeeStudentHomeworkFacade/gethomework_listTopic/";
  static String getCwAttachedFile = "api/IVRM_ClassWorkFacade/viewclasswork/";
  static String getHwAttachedFile =
      "api/EmployeeStudentHomeworkFacade/viewhomework";

  static String getCwAttachmentFile =
      "api/IVRM_ClassWorkFacade/viewstudentupload/";

  static String getStudentUploadedHw =
      "api/EmployeeStudentHomeworkFacade/viewstudentupload/";

  static String getVerifyClassWorkList =
      "api/IVRM_ClassWorkFacade/getclasswork_Topiclist/";

  static String getVerifyClassWorkTopic =
      "api/IVRM_ClassWorkFacade/getclasswork_list/";
  static String uploadCwEnd = "api/LoginFacade/ClassworkUpload";

  static String saveVerifyHw =
      "api/EmployeeStudentHomeworkFacade/homework_marks_update/";

  static String saveVerifyCw =
      "api/IVRM_ClassWorkFacade/classwork_marks_update/";

  static String verifySub = "api/IVRM_ClassWorkFacade/getsubjectlist/";

  static String getCwYear = "api/IVRM_ClassWorkFacade/Getdetails/";

  static String saveCw = "api/IVRM_ClassWorkFacade/savedetail/";

  //Birthday
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

  /// COE **/
  static String staffCoe = "api/COEReportFacade/";

  /* HW CW API */
  static String getHwYear = "api/EmployeeStudentHomeworkFacade/Getdetails/";
  static String getHwClass = "api/EmployeeStudentHomeworkFacade/get_classes/";
  static String getSection =
      "api/EmployeeStudentHomeworkFacade/getsectiondata/";
  static String getSubjects = "api/EmployeeStudentHomeworkFacade/getsubject/";
  static String saveHw = "api/EmployeeStudentHomeworkFacade/savedetail/";
  static String getHwAttachment = "api/EmployeeStudentHomeworkFacade/viewData";

  static String getCwAttachment = "api/IVRM_ClassWorkFacade/viewData";

  static String activateDeactiveHw =
      "api/EmployeeStudentHomeworkFacade/deactivate";

  static String activateDeactiveCw = "api/IVRM_ClassWorkFacade/deactivate";

  static String getFilteredHw =
      "api/EmployeePtalFacade/onclick_Homework_datewise/";
  static String getFilteredCw =
      "api/EmployeePtalFacade/onclick_classwork_datewise/";

  // MARKS ENTRY API ............

  static String getacademicYear = 'api/MarksEntryFacade/Getdetails/';
  static String getclass = 'api/MarksEntryFacade/onselectAcdYear/';
  static String getsection = 'api/MarksEntryFacade/onselectclass/';
  static String getexam = 'api/MarksEntryFacade/onselectSection/';
  static String getsubjectname = 'api/MarksEntryFacade/onselectExam/';
  static String getsubsubject = 'api/MarksEntryFacade/onselectSubject/';
  static String getmarksentrydetails = 'api/MarksEntryFacade/onsearch/';
  static String savemarksentrydetails = 'api/MarksEntryFacade/SaveMarks/';

  // PunchReport
  static String punchReport = "api/EmployeePunchAttendenceFacade/getrpt/";

  // STUDENT ATTENDANCE API .................

  static String getInitialData =
      'api/StudentAttendanceReportFacade/getinitialdata';
  // static String getStudentClass =
  //     'api/EmployeeStudentAttendenceDetailsFacade/getclass/';
  // static String getStudentSection =
  //     'api/EmployeeStudentAttendenceDetailsFacade/Getsection/';
  static String getStudentList =
      'api/StudentAttendanceReportFacade/getdatatype';
  static String getStudentAttendanceDetails =
      'api/StudentAttendanceReportFacade/searchdata';

  // ATTENDANCE ENTRY API .................
  static String getAttendanceInitialData =
      'api/StudentAttendanceEntryFacade/getinitialdata';
  static String onChangeClass =
      'api/StudentAttendanceEntryFacade/getstudentdata'; // same url for onChangeofSection
  static String onChangeMonth =
      'api/StudentAttendanceEntryFacade/getmonthclassheld/';
  static String onChangePeriod =
      'api/StudentAttendanceEntryFacade/getstdlistperiod';
  static String saveAttendanceEntry =
      'api/StudentAttendanceEntryFacade/savestudentattendance/';
  static String getAttendanceRecord =
      'api/StudentAttendanceEntryFacade/ViewAttendanceDetailsStaffWise';
  static String attendanceRecordDelete =
      'api/StudentAttendanceEntryFacade/AttendanceDeleteRecordWise/';

  // ..............
  //Dashboard
  static String staffDashboard = "api/AdmissionCtrl/staffDashboardDetails/";
  static String getStaffProfileDet = "api/AdmissionCtrl/staffProfile/";

  /* StaffNoticeBoard */
  static String noticeGetDetails = "api/NoticeBoardFacade/Getdetails/";
  static String getNoticeSection = "api/NoticeBoardFacade/getsection";
  static String getNoticeStudent = "api/NoticeBoardFacade/getstudent";
  static String getDesignation = "api/NoticeBoardFacade/Deptselectiondetails";
  static String getEmployee = "api/NoticeBoardFacade/Desgselectiondetails";
  static String saveNotices = "api/NoticeBoardFacade/savedetail";
  static String getNbAttachment = "api/NoticeBoardFacade/viewData";
  static String activeDeactiveNb = "api/NoticeBoardFacade/deactivate";
  static String getNbRecord = "api/NoticeBoardFacade/viewrecords/";

  /*  Staff Interaction */
  static String composeOnload = 'api/IVRM_InteractionsFacade/getdetails/';
  static String onChangeOfClass =
      'api/EmployeeStudentAttendenceDetailsFacade/Getsection/';
  static String onChangeOfSection = 'api/IVRM_InteractionsFacade/getstudent/';
  static String onSubmit = 'api/IVRM_InteractionsFacade/savedetails/';
  static String getInbox = 'api/IVRM_InteractionsFacade/getloaddata/';

  ////////////////////

  /* Online leave apply */
  static String getLeaveName =
      "api/OnlineLeaveApplicationFacade/getonlineLeave/";
  static String appliedLeaves =
      "api/OnlineLeaveApplicationFacade/getonlineLeavestatus";
  static String saveLeave = "api/OnlineLeaveApplicationFacade/save/";

  /* Global Endpoints */
  static String pushNotification = "api/AdmissionCtrl/PushNotificationonload/";

  static String attendanceShortage =
      "api/AdmissionCtrl/shortageOfAttendanceAlert";

  ////////////////////////////////////////////////////*Manager APIS*/////////////////////////////////////////

  //Student Details
  static String managerAcademic = "api/StudentSearchFacade/getalldetails/";
  static String managerGetSection =
      "api/AdmissionCtrl/AcademicyearwiseClassSection/";
  static String managerGetStuent =
      "api/AdmissionCtrl/AcademicyearwiseClassSectionStudent/";
  static String getStudentDetails =
      "api/StudentSearchFacade/getstudentdetails/";
  static String getAcademicHistory =
      "api/StudentDashboardFacade/ViewStudentProfile/";
  static String searchStudent = "api/StudentSearchFacade/";

  //////  OVERALL FEE APIS ////////////////////
  static String getOverallFeeAcademicYear =
      'api/PrincipalDefaulterFeeFacade/Getdetails/';
  static String getOverallClasswiseFeeResults =
      'api/AdmissionCtrl/AcademicwiseFeesDetails/';
  static String getClasswiseSectionwiseFeeResults =
      'api/AdmissionCtrl/AcademicwiseClassFeesDetails/';
  static String examDetails = "api/StudentSearchFacade/showsectionGrid/";
  static String feeDetails = "api/AdmissionCtrl/ManagerDashboardDetails/";

  //COE
  static String getCoeAcaForManager = "api/COEReportFacade/getdata/";
  static String getEventForManager = "api/COEReportFacade/";

  //LeaveApprovalManager
  static String getLeaves = "api/LeaveApprovalFacade/getApprovalStatus/";
  static String approveLeave = "api/LeaveApprovalFacade/get_status/";

  //ManagerDashboard
  static String managerDashboard = "api/AdmissionCtrl/ManagerDashboardDetails/";

  ///////////  EMPLOYEE DETAILS ////////////////
  static String getTypes =
      'api/EmployeeLateInEarlyOutReportFacade/getalldetails';
  static String getDepartment =
      'api/EmployeeLateInEarlyOutReportFacade/get_departments';
  static String getdesignation =
      'api/EmployeeLateInEarlyOutReportFacade/get_designation';

  static String getEmployeeDetails =
      'api/EmployeeDetailsReportFacade/getEmployeedetailsBySelection';

  static String playStoreLink =
      "https://play.google.com/store/apps/details?id=com.app.mskool";

  static String expiredPwd = "api/changepwdFacade/";
}
