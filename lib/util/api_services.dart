class ApiServices {
  static String baseUrl = "https://dark-red-cygnet-wrap.cyclic.app/api/v1/";

  /// Authorization apis
  static String signInApi = "${baseUrl}auth/signin";
  static String signUpApi = "${baseUrl}auth/signup";
  static String forgotPasswordApi = "${baseUrl}auth/forgotPassword";
  static String verifyOtpApi = "${baseUrl}auth/verifyOtp";
  static String sendOtpApi = "${baseUrl}auth/sendOtp";
  static String verifyResetOtpApi = "${baseUrl}auth/verifyresetOtp";
  static String resetPasswordApi = "${baseUrl}auth/resetPassword";

  /// Clinic
  static String addClinicDetails = "${baseUrl}clinic/addClinicDetails";
  static String addAdditionalClinicDetails =
      "${baseUrl}clinic/addaditionalClinicDetails";
  static String addClinicMangerDetails =
      "${baseUrl}clinic/addClinicMangerDetails";
  static String getClinicProfileAPI = "${baseUrl}clinic/getClinicProfile";
  static String updateProfileImage = "${baseUrl}clinic/editProfileImage";

  /// Lab APIs
  static String manageProfile1Api = "${baseUrl}lab/addLabDetails";
  static String manageProfile2Api = "${baseUrl}lab/labadditionalDetails";
  static String manageProfile3Api = "${baseUrl}lab/addLabMangersDetails";
  static String manageProfile4Api = "${baseUrl}lab/addLabWorkHours";
  static String manageProfile5Api = "${baseUrl}lab/addAboutLab";
  static String manageProfile6Api = "${baseUrl}lab/labPaymentMethods";
  static String editLabDetails = "${baseUrl}lab/editLabDetails";
  static String editMangersDetails = "${baseUrl}lab/editMangersDetails";
  static String editPaymenthod = "${baseUrl}lab/editPaymenthod";
  static String editLabAdditionalDetails =
      "${baseUrl}lab/editAdditionalDetails";
  static String editLabWorkingHour = "${baseUrl}lab/editLabWorkingHour";
  static String getLabProfileApi = "${baseUrl}lab/getlabProfile";
  static String putEditProfileApi = "${baseUrl}lab/editProfile";

  /// Lab side add services api
  static String addLabServices = "${baseUrl}lab/addServices";
  static String editLabServices = "${baseUrl}lab/editService";
  static String getAllServices = "${baseUrl}lab/getAllServices";
  static String singleLabService = "${baseUrl}lab/getSingleService";
  static String deleteService = "${baseUrl}lab/deleteService";
  static String labNotification = "${baseUrl}lab/getLabNotification";

  ///Lab Dashboard feed
  static String getFeeds = "${baseUrl}lab/getFeeds";
  static String sendProposal = "${baseUrl}lab/addProposal";

  ///Payment APIs
  static String getNotification = "${baseUrl}lab/getLabNotification";

  /// Services APIs
  static String getService = "${baseUrl}quotes/getServices";
  static String getLabs = "${baseUrl}quotes/getLabs";

  ///LabQuote APIs

  static String getLabAllQuote = "${baseUrl}lab/getAllLabQuotes";

  /// Quote APIs
  static String createQuote = "${baseUrl}quotes/createQuotes";
  static String getQuote = "${baseUrl}quotes/getAllClinicQuotes";
  static String getSingleQuote = "${baseUrl}lab/getSingleFeedQuote";
  static String getPendingQuote = "${baseUrl}quotes/getProposals";
  static String getAcceptedQuote = "${baseUrl}quotes/getAcceptedQuote";
  static String acceptProposals = "${baseUrl}quotes/acceptProposals";
  static String deliveryAccepted = "${baseUrl}quotes/deliveryAccepted";
  static String deliveryRejected = "${baseUrl}quotes/deliveryRejected";
  static String getLabProfile = "${baseUrl}quotes/getProposalLab";
  static String updateQuote = "${baseUrl}quotes/updateQuote";
  static String completeWork = "${baseUrl}lab/outForDelivery";
  static String restartWork = "${baseUrl}lab/quoteStartedAgain";

  /// Payment APIs
  static String makeAdvancePayment = "${baseUrl}quotes/makeAdvancePayment";
  static String makeRemainingPayment = "${baseUrl}quotes/makeAFullPayment";
  static String paymentHistory = "${baseUrl}clinic/getPaymentDetails";
  static String labPaymentHistory = "${baseUrl}lab/getLabPaymentDetails";
  static String notification = "${baseUrl}clinic/getClinicNotification";

  ///Comments APIs
  static String addComment = "${baseUrl}quotes/addClinicComment";
  static String getComment = "${baseUrl}quotes/getComments";

  /// Profiles
  static String editProfile = "${baseUrl}lab/editProfile";
  static String editClinicInfo = "${baseUrl}clinic/editClinicDetails";
  static String editClinicAdditionalInfo =
      "${baseUrl}clinic/editaditionalClinicDetails";
  static String editClinicManagerInfo =
      "${baseUrl}clinic/editClinicMangerDetails";
}
