

class ApiServices {
  static String baseUrl = "https://energetic-kit-dove.cyclic.app/api/v1/";

  /// Authorization apis
  static String signInApi = "${baseUrl}auth/signin";
  static String signUpApi = "${baseUrl}auth/signup";
  static String forgotPasswordApi = "${baseUrl}auth/forgotPassword";
  static String verifyOtpApi = "${baseUrl}auth/verifyOtp";
  static String sendOtpApi = "${baseUrl}auth/sendOtp";
  static String verifyResetOtpApi = "${baseUrl}auth/verifyresetOtp";
  static String resetPasswordApi = "${baseUrl}auth/resetPassword";

  ///Clinic
  static String addClinicDetails = "${baseUrl}clinic/addClinicDetails";
  static String addAdditionalClinicDetails = "${baseUrl}clinic/addaditionalClinicDetails";
  static String addClinicMangerDetails = "${baseUrl}clinic/addClinicMangerDetails";
  static String getClinicProfileAPI = "${baseUrl}clinic/getClinicProfile";


  /// Lab APIs
  static String manageProfile1Api = "${baseUrl}lab/addLabDetails";
  static String manageProfile2Api = "${baseUrl}lab/labadditionalDetails";
  static String manageProfile3Api = "${baseUrl}lab/addLabMangersDetails";
  static String manageProfile4Api = "${baseUrl}lab/addLabWorkHours";
  static String manageProfile5Api = "${baseUrl}lab/addAboutLab";
  static String manageProfile6Api = "${baseUrl}lab/labPaymentMethods";
  static String getLabProfileApi = "${baseUrl}lab/getlabProfile";

  /// Lab APIs AddService
  static String addServices = "${baseUrl}lab/addServices";

  /// Services APIs
  static String getService = "${baseUrl}quotes/getServices";
  static String getLabs= "${baseUrl}quotes/getLabs";

  /// Quote APIs
  static String createQuote = "${baseUrl}quotes/createQuotes";
  static String getQuote = "${baseUrl}quotes/getAllClinicQuotes";
  static String getPendingQuote = "${baseUrl}quotes/getProposals";
  static String getAcceptedQuote = "${baseUrl}quotes/getAcceptedQuote";
}
