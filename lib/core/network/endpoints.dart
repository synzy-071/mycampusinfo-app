class Endpoints {
  // // static const String baseUrl = 'https://backend-tc-sa-v2.onrender.com/api/';
 // static const String baseUrl = 'https://mycampusinfo-server.onrender.com/api/';
  static const String baseUrl = 'http://localhost:8080/api/';

  //Authentication Endpoints
  static const String auth = 'auth';
  static const String authLogin = 'auth/login';
  static const String authRegister = 'auth/register';
  static const String authForgotPasswordSendOtp =
      'auth/forgot-password/send-otp';
  static const String authForgotPasswordVerifyOtp =
      'auth/forgot-password/verify-otp';
  static const String authResetPassword = 'auth/reset-password';

  static const String authGoogle = 'auth/google';
  static const String authVerifyEmail = 'auth/verify-email';

  static const String authSendOtp = 'otp/send-otp';
  static const String authVerifyOtp = 'otp/verify-otp';

  //User Endpoints
  static const String usersPreferences = 'users/preferences';
  static const String users = 'users';
  static const String usersShortlist = 'users/shortlist';

  //School Endpoints
  static const String adminSchools = 'colleges';
  static const String adminSchoolsStatus = 'colleges';
  static const String nearbySchools = 'admin/schools/nearby';

  static const String coursesByCollege = 'colleges/courses/college';
  static const String placementsByCollege = 'colleges/placement/college';
  //School Amenities
  static const String adminSchoolsAmenities = 'colleges/amenities';
  static const String studentApplications = 'applications';

  //Chatbot
  static const chatbotBase = '/chatbot';

  //School Activities
  static const String adminSchoolsActivities = 'colleges/activities';
  static const String adminSchoolsAlumnus = 'colleges/alumni';
  static const String adminInfrastructure = 'colleges/infrastructure';
  static const String adminfeeAndScholarship = 'colleges/fees';
  static const String adminOtherDetails = 'colleges/other-details';
  static const String adminAcademics = 'admin/schools/academics';
  static const String adminTechAdoption = 'admin/schools/technology';
  static const String adminSafetyAndSecurity = 'colleges/safety';
  static const String adminInternationalExposure = 'colleges/international';
  static const String adminFaculty = 'colleges/faculty';
  static const String examsByCollege = 'colleges/exam';
  static const String scholarshipsByCollege = 'colleges/scholarship';
  static const String feesByCollege = 'colleges/course-fee';
  static const String adminAdmissionTimeline = 'colleges/admission';
  static const String reviewsBySchoolAdmin = 'colleges/reviews';
  static const String collegeHostels = 'colleges/hostel';
  static const String adminBlogs = 'colleges/blogs';
  static const String adminCompare = 'colleges/compare';

  //Support Page
  static const String adminSupport = 'admin/support';
  static const String adminSupportId = 'admin/support-id';

  //Filter By Fee & Shift
  static const String adminFilterFeeRange = 'admin/filter-feeRange';
  static const String adminFilterShift = 'admin/filter-Shift';

  //predictor
  static const String collegesPredictColleges = 'colleges/predict-colleges';
  static const String collegesSearch = 'colleges/search';
  static const String notifications = 'notifications';

  //Applications
  static const String formStudent = 'form/student';
  static const String formTrack = 'form/track';
  static const String formIsApplied = 'form/is-applied';
  static const String form = 'form';

  //payments
  static const String paymentCreateOrder = 'payment/create-order';
  static const String paymentVerify = 'payment/verify';
}
