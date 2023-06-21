

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

  /// Lab side add services api
  static String addLabServices = "${baseUrl}lab/addServices";
  static String allLabServices = "${baseUrl}lab/getAllServices";
  static String singleLabService = "${baseUrl}lab/getSingleService";

  /// Services APIs
  static String getService = "${baseUrl}quotes/getServices";
  static String getLabs= "${baseUrl}quotes/getLabs";

  ///LabQuote APIs

  static String getLabAllQuote = "${baseUrl}lab/getAllLabQuotes";

  /// Quote APIs
  static String createQuote = "${baseUrl}quotes/createQuotes";
  static String getQuote = "${baseUrl}quotes/getAllClinicQuotes";
  static String getPendingQuote = "${baseUrl}quotes/getProposals";
  static String getAcceptedQuote = "${baseUrl}quotes/getAcceptedQuote";
  static String acceptProposals = "${baseUrl}quotes/acceptProposals";
  static String deliveryAccepted = "${baseUrl}quotes/deliveryAccepted";
  static String deliveryRejected = "${baseUrl}quotes/deliveryRejected";
  static String getLabProfile = "${baseUrl}quotes/getProposalLab";
  static String updateQuote = "${baseUrl}quotes/updateQuote";

  ///Payment APIs
  static String makeAdvancePayment = "${baseUrl}quotes/makeAdvancePayment";
  static String makeRemainingPayment = "${baseUrl}quotes/makeAFullPayment";
  static String paymentHistory = "${baseUrl}clinic/getPaymentDetails";
  static String notification = "${baseUrl}clinic/getClinicNotification";

  ///Comments APIs
  static String addComment = "${baseUrl}quotes/addClinicComment";
  static String getComment = "${baseUrl}quotes/getComments";

  /// Profiles
  static String editProfile = "${baseUrl}lab/editProfile";
  static String editClinicInfo = "${baseUrl}clinic/editClinicDetails";
  static String editClinicAdditionalInfo = "${baseUrl}clinic/editaditionalClinicDetails";
  static String editClinicManagerInfo = "${baseUrl}clinic/editClinicMangerDetails";
}
